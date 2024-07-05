from flask import Flask, request, jsonify
import mysql.connector
from geopy.geocoders import Nominatim
import requests
from difflib import get_close_matches

app = Flask(__name__)

# Connessione al database MySQL
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="Projectwork"
)

# Crea un'istanza del geocodificatore
geolocator = Nominatim(user_agent="my_geocoder_application")

# Funzione per ottenere le coordinate geografiche
def get_coordinates(address):
    try:
        location = geolocator.geocode(address)
        if location:
            return (location.latitude, location.longitude)
        else:
            return None
    except Exception as e:
        print("Errore di geocodifica:", e)
        return None

# Funzione per ottenere la zona utilizzando le coordinate
def get_zone(latitude, longitude):
    url = f"https://nominatim.openstreetmap.org/reverse?format=json&lat={latitude}&lon={longitude}&zoom=18&addressdetails=1"
    headers = {
        'User-Agent': 'my_geocoder_application'
    }
    try:
        response = requests.get(url, headers=headers)
        if response.status_code == 200:
            data = response.json()
            address = data.get('address', {})
            zone = address.get('neighbourhood') or \
                   address.get('suburb') or \
                   address.get('quarter') or \
                   address.get('city_district') or \
                   address.get('borough') or \
                   address.get('district') or \
                   address.get('village') or \
                   address.get('town') or \
                   address.get('county') or \
                   "Zona non trovata"
            return zone
        else:
            print(f"Errore nella risposta della richiesta: {response.status_code}")
            return "Errore durante la richiesta"
    except requests.RequestException as e:
        print("Errore di richiesta:", e)
        return "Errore durante la richiesta"

# Funzione per trovare la zona più vicina
def trova_zona_piu_vicina(zona, zone_disponibili):
    zona_vicina = get_close_matches(zona, zone_disponibili, n=1)
    if zona_vicina:
        return zona_vicina[0]
    else:
        return "Zona non trovata"

@app.route('/inserisci_indirizzo', methods=['POST'])
def inserisci_indirizzo():
    data = request.json
    indirizzo = data.get('indirizzo')
    nome_citta = data.get('citta')

    try:
        mycursor = mydb.cursor()

        
        mycursor.execute("SELECT id_citta FROM citta WHERE nome = %s", (nome_citta,))
        citta = mycursor.fetchone()
        if not citta:
            return jsonify({"error": "Città non supportata"}), 400
        id_citta = citta[0]

        
        coordinates = get_coordinates(indirizzo)
        if coordinates:
            latitude, longitude = coordinates
            print(f"Coordinate: Latitudine {latitude}, Longitudine {longitude}")

            
            zona = get_zone(latitude, longitude)
            print(f"La zona di '{indirizzo}' è: {zona}")

           
            mycursor.execute("SELECT id, nome_zona FROM zone WHERE citta = %s", (id_citta,))
            zone_disponibili = mycursor.fetchall()
            zone_nomi = [row[1] for row in zone_disponibili]

            # Controlla se la zona è presente nel database
            if zona not in zone_nomi:
                zona = trova_zona_piu_vicina(zona, zone_nomi)
                print(f"La zona più vicina a '{indirizzo}' è: {zona}")

            # Ottieni l'id della zona
            mycursor.execute("SELECT id FROM zone WHERE nome_zona = %s AND citta = %s", (zona, id_citta))
            zona_result = mycursor.fetchone()
            if not zona_result:
                return jsonify({"error": "Zona non trovata"}), 400
            id_zona = zona_result[0]

            # Inserisci l'indirizzo nella tabella indirizzi
            sql_insert_indirizzo = "INSERT INTO indirizzi (via, id_citta, id_zona) VALUES (%s, %s, %s)"
            mycursor.execute(sql_insert_indirizzo, (indirizzo, id_citta, id_zona))
            mydb.commit()
            id_indirizzo = mycursor.lastrowid

            # Inserisci nella tabella affitti
            sql_insert_affitti = "INSERT INTO affitti (idzona, indirizzo) VALUES (%s, %s)"
            mycursor.execute(sql_insert_affitti, (id_zona, indirizzo))
            mydb.commit()

            return jsonify({"message": "Indirizzo e zona inseriti correttamente", "id_indirizzo": id_indirizzo, "id_zona": id_zona}), 200

        else:
            return jsonify({"error": "Impossibile ottenere le coordinate per l'indirizzo"}), 400

    except Exception as e:
        print("Errore:", e)
        return jsonify({"error": "Errore durante l'elaborazione della richiesta"}), 500

    finally:
        mycursor.close()

if __name__ == '__main__':
    app.run(debug=True)

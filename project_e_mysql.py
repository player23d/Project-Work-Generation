import mysql.connector
from geopy.geocoders import Nominatim
import requests

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
    # Utilizza un servizio di reverse geocoding (in questo caso OpenStreetMap)
    url = f"https://nominatim.openstreetmap.org/reverse?format=json&lat={latitude}&lon={longitude}&zoom=18&addressdetails=1"
    headers = {
        'User-Agent': 'my_geocoder_application'
    }
    try:
        response = requests.get(url, headers=headers)
        if response.status_code == 200:
            data = response.json()
            address = data.get('address', {})
            # Controlla diversi campi per trovare la zona
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

try:
    # Esegui la query SQL per ottenere le vie
    mycursor = mydb.cursor()
    sql = "SELECT via FROM indirizzi;"
    mycursor.execute(sql)
    result = mycursor.fetchall()

    # Itera sui risultati della query
    for row in result:
        via = row[0]  # Assumi che via sia la prima colonna della tabella
        print(f"Ottenendo informazioni per: {via}")

        # Ottieni le coordinate geografiche dell'indirizzo
        coordinates = get_coordinates(via)
        if coordinates:
            latitude, longitude = coordinates
            print(f"Coordinate: Latitudine {latitude}, Longitudine {longitude}")

            # Ottieni la zona utilizzando le coordinate
            zona = get_zone(latitude, longitude)
            print(f"La zona di '{via}' è: {zona}")
        else:
            print(f"Impossibile ottenere le coordinate per: {via}")

finally:
    mycursor.close()
    mydb.close()

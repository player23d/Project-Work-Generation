import mysql.connector
from geopy.geocoders import GoogleV3
import requests

# Connessione al database MySQL
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="Projectwork"
)

# Crea un'istanza del geocodificatore di Google Maps
geolocator = GoogleV3(api_key='your_api_key_here', user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")

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
    # Utilizza un servizio di reverse geocoding di Google Maps
    url = f"https://maps.googleapis.com/maps/api/geocode/json?latlng={latitude},{longitude}&key=your_api_key_here"
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    try:
        response = requests.get(url, headers=headers)
        if response.status_code == 200:
            data = response.json()
            results = data.get('results', [])
            if results:
                address_components = results[0].get('address_components', [])
                for component in address_components:
                    if 'neighborhood' in component['types']:
                        return component['long_name']
                return "Zona non trovata"
            else:
                return "Zona non trovata"
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

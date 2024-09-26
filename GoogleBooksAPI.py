import requests, uuid, json

def addByTitle(title):
    key = "AIzaSyD0Pf5G8H4Fsk9orNpJMDRqqmKEFyWZWQ0"
    endpoint = "https://books.googleapis.com"

    path = '/books/v1/volumes'
    constructed_url = endpoint + path

    params = {
        'q': title,
        'key': key
    }

    headers = {

    }

    body = [{

    }]

    request1 = requests.get(constructed_url, params=params)
    response1 = request1.json()
    for items in response1['items']:
        try:
            book = {
                'bookName': items['volumeInfo']['title'],
                'author': items['volumeInfo']['authors'][0],
                'ISBN': items['volumeInfo']['industryIdentifiers'][1]['identifier'],
                'quantity': 100,
                'category': 6
                # 'publisher': items['volumeInfo']['publisher'],
            }
            return book
        except KeyError:
            continue

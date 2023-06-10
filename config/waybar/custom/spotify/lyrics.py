import requests

# Replace 'YOUR_API_KEY' with your actual Musixmatch API key
api_key = 'YOUR_API_KEY'

def get_lyrics(track_name, artist_name):
    base_url = 'https://api.musixmatch.com/ws/1.1/'
    endpoint = 'matcher.lyrics.get'

    # Build the API request URL
    url = f'{base_url}{endpoint}'
    params = {
        'apikey': api_key,
        'q_track': track_name,
        'q_artist': artist_name,
        'format': 'json'
    }

    # Send the API request
    response = requests.get(url, params=params)
    data = response.json()

    # Check if lyrics were found
    if 'lyrics' in data['message']:
        lyrics = data['message']['lyrics']['body']
        return lyrics
    else:
        return 'Lyrics not found.'

# Example usage
track_name = 'Bohemian Rhapsody'
artist_name = 'Queen'
lyrics = get_lyrics(track_name, artist_name)
print(lyrics)

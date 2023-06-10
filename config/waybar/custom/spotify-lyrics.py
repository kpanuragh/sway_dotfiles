import os
import sys
import requests
import json

from waybar import bar, widget


class SpotifyLyrics(widget.Widget):
    def __init__(self):
        super().__init__()
        self.spotify = Spotify()
        self.current_song = None

    def update(self):
        if self.current_song is None:
            return

        song_data = self.spotify.get_song_data(self.current_song)
        lyrics = self.spotify.get_song_lyrics(song_data['id'])

        self.set_text(lyrics)


class Spotify(object):
    def __init__(self):
        self.client_id = os.environ['SPOTIFY_CLIENT_ID']
        self.client_secret = os.environ['SPOTIFY_CLIENT_SECRET']

    def get_song_data(self, song_id):
        response = requests.get(
            'https://api.spotify.com/v1/tracks/{}'.format(song_id),
            headers={
                'Authorization': 'Bearer {}'.format(self.get_access_token())
            }
        )

        if response.status_code == 200:
            return json.loads(response.content)
        else:
            raise Exception('Could not get song data')

    def get_song_lyrics(self, song_id):
        response = requests.get(
            'https://api.lyrics.ovh/v1/lyrics/{}'.format(song_id),
        )

        if response.status_code == 200:
            return json.loads(response.content)['lyrics']
        else:
            raise Exception('Could not get song lyrics')

    def get_access_token(self):
        response = requests.post(
            'https://accounts.spotify.com/api/token',
            data={
                'grant_type': 'client_credentials',
                'client_id': self.client_id,
                'client_secret': self.client_secret
            }
        )

        if response.status_code == 200:
            return json.loads(response.content)['access_token']
        else:
            raise Exception('Could not get access token')


if __name__ == '__main__':
    bar.start()
    spotify_lyrics = SpotifyLyrics()
    bar.add_widget(spotify_lyrics)

    bar.run()

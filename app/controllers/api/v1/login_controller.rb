class Api::V1::LoginController < ApplicationController
    def create
        query_params = {
          client_id: ENV["CLIENT_ID"],
          response_type: 'code',
          redirect_uri: ENV["REDIRECT_URI"],
          scope: 'user-read-recently-played user-read-playback-state user-library-read user-library-modify user-modify-playback-state playlist-modify-public streaming user-read-birthdate user-read-email user-read-private',
          show_dialog: true
        }
        url = 'https://accounts.spotify.com/authorize'
        redirect_to "#{url}?#{query_params.to_query}"
      end
end

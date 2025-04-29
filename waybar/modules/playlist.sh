#!/bin/bash
source ~/.config/waybar/modules/.env

function get_song_id()
{
    song_name=$(playerctl metadata --player=Feishin --format '{{title}}' | cut -d\; -f1 | cut -d, -f1 | cut -d\( -f1)
    song_author=$(playerctl metadata --player=Feishin --format '{{artist}}' | cut -d\; -f1 | cut -d, -f1)

    #echo "Searching for $song_name"
    song_data=$(curl -s -G "$JF_URL/Users/$JF_USER_ID/Items" \
        --data-urlencode "searchTerm=$song_name" \
        --data-urlencode "includeItemTypes=Audio" \
        --data-urlencode "userId=$JF_USER_ID" \
        --data-urlencode "limit=10" \
        --data-urlencode "recursive=true" \
        -H "X-MediaBrowser-Token: $JF_TOKEN")

    song_id=$(echo "$song_data" | jq -r --arg title "$song_name" --arg author "$song_author" '
        .Items[] 
        | select(.Name == $title and .AlbumArtists[0].Name == $author) 
        | .Id
    ')

    test=$(curl -s -G "$JF_URL/Items/$song_id" \
        -H "X-MediaBrowser-Token: $JF_TOKEN" \
        --data-urlencode "userId=$JF_USER_ID")
}
function is_in_playlist()
{
    sleep 0.5
    local song_id=""
    get_song_id
    #in_playlist=$(echo $playlist_data | jq --arg song_id "$song_id" 'any(.Items[]; .Id == $song_id)')

    song_name=$(playerctl metadata --player=Feishin --format '{{title}}' | cut -d\; -f1 | cut -d, -f1 | cut -d\( -f1)
    song_author=$(playerctl metadata --player=Feishin --format '{{artist}}' | cut -d\; -f1 | cut -d, -f1)
    playlist_data=$(curl -s -G "$JF_URL/Playlists/$JF_PLAYLIST_ID/Items" \
        --data-urlencode "userId=$JF_USER_ID" \
        -H "X-MediaBrowser-Token: $JF_TOKEN")

    in_playlist=$(echo "$playlist_data" | jq -r --arg title "$song_name" --arg author "$song_author" '
        .Items[] 
        | select(.Name == $title and .AlbumArtists[0].Name == $author) 
    ')

    if [ -z $in_playlist ]; then
        echo -e "{\"text\":\"♡\"}" #
    else
        echo -e "{\"text\":\"♥\"}" 
    fi
}

function add_to_playlist()
{
    local song_id=""
    get_song_id
    curl -X POST "$JF_URL/Playlists/$JF_PLAYLIST_ID/Items?ids=${song_id}&userId=${JF_USER_ID}" \
        -H "Content-Type: application/json" \
        -H "X-MediaBrowser-Token: $JF_TOKEN" 
}

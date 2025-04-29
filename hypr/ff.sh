#!/usr/bin/env bash

function watcher() {
    /usr/bin/firefox --name "ffwatcher" -P watcher --allow-downgrade & 
}

function searcher() {
    /usr/bin/firefox --name "ffsearcher" -P searcher --allow-downgrade & 
}

function homelab() {
    /usr/bin/firefox --name "ffhomelab" -P homelab --allow-downgrade &
}


function start() {
    until ping -c1 google.com; do sleep 1; done;

    watcher
    searcher
    homelab
}

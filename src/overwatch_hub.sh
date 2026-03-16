#!/bin/bash

params=null
api="https://services.nbalin.dev/owhub/api.php"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

authenticate() {
    params="vk_access_token_settings=${5:-}&vk_app_id=7722891&vk_are_notifications_enabled=${6:-0}&vk_is_app_user=${7:-0}&vk_is_favorite=${8:-0}&vk_language=${9:-ru}&vk_platform=${10:-desktop_web}&vk_ref=$4&vk_ts=$3&vk_user_id=$2&sign=$1"
}

_get() {
    curl -s -X GET "$api?$1&$params"    \
        -H "User-Agent: $user_agent"    \
        -H "content-type: application/json"
}

load_wall() {
    _get "act=loadWall&page=$1"
}

start_app() {
    _get "act=startapp"
}

get_game_profile() {
    _get "act=db.GetGameProfile"
}

get_team_mates_profile() {
    _get "act=teammates.getProfile"
}

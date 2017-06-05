#!/bin/bash
API="http://localhost:4741"
URL_PATH="/books"
TEXT="UPDATED"
TOKEN="KhD0pchz7/vIVK7bz2Vn9lyuUwaZhyLosicOYLFSJME=--kMd073xHfy6HESjYMFEUPX3TMKD4DO0y3mgHjbe/TUg="
ID="593587803f16e046a023af29"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "example": {
      "book": {
        "title": "'"${TEXT}"'",
        "status": "'"${TEXT}"'"
      }
    }
  }'

echo

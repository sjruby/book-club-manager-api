#!/bin/bash

API="http://localhost:4741"
URL_PATH="/books"
TEXT="TEST"
DATE="01-01-12"
TOKEN="KhD0pchz7/vIVK7bz2Vn9lyuUwaZhyLosicOYLFSJME=--kMd073xHfy6HESjYMFEUPX3TMKD4DO0y3mgHjbe/TUg="

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "book": {
      "title": "'"${TEXT}"'",
      "startDate": "'"${DATE}"'",
      "endDate": "'"${DATE}"'",
      "status": "'"${TEXT}"'"
    }
  }'

echo

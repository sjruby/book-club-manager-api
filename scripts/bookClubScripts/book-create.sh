#!/bin/bash

API="http://localhost:4741"
URL_PATH="/books"
TEXT="TEST"
DATE="01-01-12"
TOKEN="oWnOjgB0iY5n+TaiOiYRHSm46PANcyfg2ZNqM4DmF/U=--/mNAo6WY5BmH55bPd17zL3GwK/Vye8g4qTEIM7soxd4="

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

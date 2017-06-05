#!/bin/bash

API="http://localhost:4741"
URL_PATH="/books"
TOKEN="KhD0pchz7/vIVK7bz2Vn9lyuUwaZhyLosicOYLFSJME=--kMd073xHfy6HESjYMFEUPX3TMKD4DO0y3mgHjbe/TUg="
ID="593583693f16e046a023af27"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo

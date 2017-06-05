#!/bin/bash

API="http://localhost:4741"
URL_PATH="/books"
TOKEN="KhD0pchz7/vIVK7bz2Vn9lyuUwaZhyLosicOYLFSJME=--kMd073xHfy6HESjYMFEUPX3TMKD4DO0y3mgHjbe/TUg="

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo

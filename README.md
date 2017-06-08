[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Links:

- Client Repo: https://github.com/sjruby/book-club-client
- Deployed Client: https://sjruby.github.io/book-club-client/
- API Repo: https://github.com/sjruby/book-club-manager-api
- Deployed API:  https://salty-citadel-91716.herokuapp.com


# wat-r-u-reading-api

This API is set up to store information about book clubs neccessasry to support the wat-r-u-reading app.

## Dependencies

Install with `npm install`.

-   [`express`](http://expressjs.com/)
-   [`mongoose`](http://mongoosejs.com/)

# ERD

A link to the ERD is below:

Note: The primary resource is called books, in retrospect that should be bookClubs.  Before adding the feature to allow users to track the books they've read, I would need to update the model names.  Because its 3:30 on Thursday before submission...books it stays!

[ERD](http://i.imgur.com/vX1mcmn.jpg)

## API

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:4741/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:4741/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:4741/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:4741/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:4741/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

### Books

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/books`    | `users#index`     |
| GET  | `/books/1`  | `users#show`      |
| POST | `/books`    | `users#create`    |
| PATCH| `/books/1`  | `users#update`    |
|DELETE| `/books/1`  | `users#destroy`   |

#### GET /books

Request:

```sh
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
API="http://localhost:4741"
URL_PATH="/books"
TOKEN="KhD0pchz7/vIVK7bz2Vn9lyuUwaZhyLosicOYLFSJME=--kMd073xHfy6HESjYMFEUPX3TMKD4DO0y3mgHjbe/TUg="
```

Response:

```md
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 3078
ETag: W/"c06-8k/SUdQ9hmZFhNP+3+U0RRylQCo"
Date: Mon, 05 Jun 2017 16:18:48 GMT
Connection: keep-alive

{
  "book": {
    "id": 2,
    "title": "example",
    startDate: 01-01-1012
    endDate: '01-01-2012'
  }
}
```

#### GET /books/2

Request:

```sh
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
API="http://localhost:4741"
URL_PATH="/books"
TOKEN="KhD0pchz7/vIVK7bz2Vn9lyuUwaZhyLosicOYLFSJME=--kMd073xHfy6HESjYMFEUPX3TMKD4DO0y3mgHjbe/TUg="
ID=2
```

Response:

```md
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 255
ETag: W/"ff-FpOA8oh2frLEbHGrPAt1rK8x4nw"
Date: Mon, 05 Jun 2017 16:20:35 GMT
Connection: keep-alive

{
  "book": {
    "id": 2,
    "title": "example",
    startDate: 01-01-1012
    endDate: '01-01-2012'
  }
}
```

#### POST /books

Request:

```sh
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "book": {
      "title": "'"${TEXT}"'",
      "startDate": "'"${DATE}"'",
      "endDate": "'"${DATE}"'"
    }
  }'
```

```sh
API="http://localhost:4741"
URL_PATH="/books"
TEXT="TEST"
DATE="01-01-12"
TOKEN="KhD0pchz7/vIVK7bz2Vn9lyuUwaZhyLosicOYLFSJME=--kMd073xHfy6HESjYMFEUPX3TMKD4DO0y3mgHjbe/TUg="

```

Response:

```md
HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 255
ETag: W/"ff-BybssWu3Xjq7wXI2XNPFiACpc1A"
Date: Mon, 05 Jun 2017 16:22:10 GMT
Connection: keep-alive

{
  "book": {
    "id": 2,
    "title": "TEST",
    startDate: 01-01-1012
    endDate: '01-01-2012'
  }
}
```



#### PATCH /books/2

Request:

```sh
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "book": {
      "title": "'"${TEXT}"'",
      "startDate": "'"${DATE}"'",
      "endDate": "'"${DATE}"'"
    }
  }'
```

```sh
API="http://localhost:4741"
URL_PATH="/books"
TEXT="TEST"
DATE="01-01-12"
TOKEN="KhD0pchz7/vIVK7bz2Vn9lyuUwaZhyLosicOYLFSJME=--kMd073xHfy6HESjYMFEUPX3TMKD4DO0y3mgHjbe/TUg="

```

Response:

```md
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 255
ETag: W/"ff-FpOA8oh2frLEbHGrPAt1rK8x4nw"
Date: Mon, 05 Jun 2017 16:29:55 GMT
Connection: keep-alive
```


#### DESTROY /books/2

Request:

```sh
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
API="http://localhost:4741"
URL_PATH="/books"
TOKEN="KhD0pchz7/vIVK7bz2Vn9lyuUwaZhyLosicOYLFSJME=--kMd073xHfy6HESjYMFEUPX3TMKD4DO0y3mgHjbe/TUg="
ID=2

```

Response:

```md
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 255
ETag: W/"ff-FpOA8oh2frLEbHGrPAt1rK8x4nw"
Date: Mon, 05 Jun 2017 16:29:55 GMT
Connection: keep-alive
```
## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.

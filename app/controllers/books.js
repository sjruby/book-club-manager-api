'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Book = models.book

const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Book.find()
    .then(books => res.json({
      books: books.map((e) =>
        e.toJSON({ virtuals: true, user: req.user }))
    }))
    .catch(next)
}

const show = (req, res) => {
  res.json({
    book: req.book.toJSON({ virtuals: true, user: req.user })
  })
}

const create = (req, res, next) => {
  const book = Object.assign(req.body.book, {
    _owner: req.user._id
  })
  Book.create(book)
    .then(book =>
      res.status(201)
        .json({
          book: book.toJSON({ virtuals: true, user: req.user })
        }))
    .catch(next)
}

const update = (req, res, next) => {
  delete req.body._owner  // disallow owner reassignment.
  req.book.update(req.body.book)
    .then(() => res.sendStatus(204))
    .catch(next)
}

const destroy = (req, res, next) => {
  req.book.remove()
    .then(() => res.sendStatus(204))
    .catch(next)
}

module.exports = controller({
  index,
  show,
  create,
  update,
  destroy
}, { before: [
  { method: setUser, only: ['index', 'show'] },
  { method: authenticate },
  { method: setModel(Book), only: ['show'] },
  { method: setModel(Book, { forUser: true }), only: ['update', 'destroy'] }
] })

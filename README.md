# Todos API

[![Build Status](https://travis-ci.org/tulenkovR/Todos.svg?branch=master)](https://travis-ci.org/tulenkovR/Todos)
[![Maintainability](https://api.codeclimate.com/v1/badges/8d4fc121874ef9e2608a/maintainability)](https://codeclimate.com/github/tulenkovR/Todos/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/8d4fc121874ef9e2608a/test_coverage)](https://codeclimate.com/github/tulenkovR/Todos/test_coverage)

### API Endpoints
#### Our API will expose the following RESTful endpoints:

|       Endpoint	      |       Functionality        |
| ----------------------- |:--------------------------:| 
| POST /signup            | Signup                     |
| POST /auth/login        | Login                      |
| GET /auth/logout        | Logout                     |
| GET /todos	          | List all todos             |
| POST /todos	          | Create a new todo          |
| GET /todos/:id	      | Get a todo                 |
| PUT /todos/:id	      | Update a todo              |
| DELETE /todos/:id	      | Delete a todo and its items|
| GET /todos/:id/items	  | Get a todo item            |
| PUT /todos/:id/items	  | Update a todo item         |
| DELETE /todos/:id/items | Delete a todo item         |

### Defined a custom vendor media type: 
- application/vnd.todos.{version_number}+json 

Example: 
- Accept: application/vnd.todos.v1+json 
- Accept: application/vnd.todos.v2+json 

### Pagination
- Add to request page==(number page), each page returns 20 records
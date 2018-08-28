# Todos API

[![Build Status](https://travis-ci.org/tulenkovR/Todos.svg?branch=master)](https://travis-ci.org/tulenkovR/Todos)
[![Maintainability](https://api.codeclimate.com/v1/badges/8d4fc121874ef9e2608a/maintainability)](https://codeclimate.com/github/tulenkovR/Todos/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/8d4fc121874ef9e2608a/test_coverage)](https://codeclimate.com/github/tulenkovR/Todos/test_coverage)

### Running application on Heroku
#### https://task-backend.herokuapp.com/api/todos
#### Сreated user: email:test@test.com, password: roman123

### API Endpoints
#### Our API will expose the following RESTful endpoints:

|       Endpoint	          |       Functionality        |
| ----------------------------|:--------------------------:| 
| POST   /api/signup          | Signup                     |
| POST   /api/auth/login      | Login                      |
| GET    /api/auth/logout     | Logout                     |
| GET    /api/todos	          | List all todos             |
| POST   /api/todos	          | Create a new todo          |
| GET    /api/todos/:id	      | Get a todo                 |
| PUT    /api/todos/:id	      | Update a todo              |
| DELETE /api/todos/:id	      | Delete a todo and its items|
| GET    /api/todos/:id/items | Get a todo item            |
| PUT    /api/todos/:id/items | Update a todo item         |
| DELETE /api/todos/:id/items | Delete a todo item         |

### Model Todo - json
    { 
        "todo":{
            "title": "Test 1"
        } 
    }

### Model Item - json
    {   
	    "item":{
		    "name": "Add test 1",
		    "done": "false"
	    }
	}

### Defined a custom vendor media type: 
- application/vnd.todos.{version_number}+json 

Example: 
- Accept: application/vnd.todos.v1+json 
- Accept: application/vnd.todos.v2+json 

### Pagination
- Add to request page==(number page), each page returns 20 records
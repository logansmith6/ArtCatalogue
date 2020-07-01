ArtCatalogue will be an app that lets users register, login,  create posts (image upload, title, era, artist name, ect), view posts, and more

GET /register
    signup!

POST /users
    add user to database/ validate user?

GET /login
    login form

POST /login
    new session + redirect

GET /paintings/new
    form to create new painting/post

POST /paintings
    save new painting to the database

GET /paintings
    show all painting posts

GET /paintings/:id
    show specific painting post


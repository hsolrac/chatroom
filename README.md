# ChatRoom

#### 1. Clone the repository:
```bash
git clone git@github.com:hsolrac/chatroom.git
```
#### 2. Go inside chatroom folder:
```bash 
cd chatroom/
```

#### 3. Start the services:

Make sure you have Docker installed.

```bash 
docker compose up --build
```

## Whitouth docker:

### Requirements

- Ruby 3.1
- Node.js 20
- Redis

Make sure you have installed all those dependencies.

## Install gem dependencies

```bash 
bundle install
```
#### Install javascript dependencies

```bash 
yarn install
```

#### Database Configuration

```bash 
bin/rails db:create 
bin/rails db:migrate

# or using bin/rails db:prepare 
```

#### Create a user 

Run `bin/rails console`

```bash 
User.create!(username: "admin", email: "admin@localhost", password: "password", password_confirmation: "password")
```

### Start the server

After you’ve set up everything, now you can running `./bin/dev` and `redis-server` to start all service you need to develop.
Then visit <http://localhost:3000>


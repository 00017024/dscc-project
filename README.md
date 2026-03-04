# DSCC Dockerized Django Blog

## Project Description

This project is a containerized blogging web application developed using the Django web framework. The purpose of the project is to demonstrate modern deployment practices including containerization with Docker, service orchestration using Docker Compose, and automated deployment using a CI/CD pipeline.

The application allows users to register accounts, create blog posts, categorize posts using tags, and interact through comments. The system is deployed on a remote VPS server and automatically updated whenever changes are pushed to the GitHub repository.

The architecture follows a multi-service approach consisting of a Django application server, a PostgreSQL database for persistent storage, and an Nginx reverse proxy for handling incoming HTTP requests and serving static files.

# Features

The application provides the following functionality:

* User registration and authentication
* Create, update, and delete blog posts
* View list of posts and detailed post pages
* Tag system for organizing posts
* Comment system for user interaction
* Django admin panel for content management
* Containerized architecture using Docker
* Automated deployment using CI/CD pipeline
* Production server configuration using Gunicorn and Nginx

# Technologies Used

## Backend

* Python
* Django

## Database

* PostgreSQL

## Containerization

* Docker
* Docker Compose

## Web Server

* Gunicorn
* Nginx

## CI/CD

* GitHub Actions

## Infrastructure

* Ubuntu VPS server


# Application Architecture

The system consists of three Docker services:

Django -- Main application service running with Gunicorn
PostgreSQL -- Database storing application data              
Nginx  -- Reverse proxy and static file server

Request flow:

User → Nginx → Django (Gunicorn) → PostgreSQL

# Local Setup Instructions

## Prerequisites

Ensure the following software is installed:

* Docker
* Docker Compose
* Git

## Clone the repository

```bash
git clone https://github.com/00017024/dscc-project.git
cd dscc-project
```

## Create environment variables

Create a `.env` file in the project root:

```
DB_NAME=YOUR_DATABASE_NAME
DB_USER=YOUR_USERNAME
DB_PASSWORD=YOUR_DATABASE_PASSWORD
SECRET_KEY=YOUR_SECRET_KEY
DEBUG=True
ALLOWED_HOSTS=*
```


## Start the application

Run the following command:

```bash
docker compose up --build
```

This will start these containers:

* Django application
* PostgreSQL database
* Nginx reverse proxy


## Access the application

Open the browser and visit:

```
http://localhost
```

# Deployment Instructions

The application is deployed on a remote Ubuntu VPS server.

## Server Setup

Install Docker and Docker Compose on the VPS:

```bash
sudo apt update
sudo apt install docker.io docker-compose -y
```

## Clone the repository on the server

```bash
git clone https://github.com/00017024/dscc-project.git
cd dscc-project
```

---

## Configure environment variables

Create a `.env` file on the server with the same variables used locally.

## Run the application

Start the containers:

```bash
docker compose up -d --build
```

## Access deployed application

The application can be accessed through the server IP address:

```
http://170.168.6.70
```

# Continuous Deployment

A CI/CD pipeline was implemented using GitHub Actions.

The pipeline performs these steps:

1. Detects code pushes to the main branch
2. Connects to the VPS using SSH
3. Pulls the latest code
4. Rebuilds Docker containers
5. Restarts the application automatically

Workflow file location:

```
.github/workflows/deploy.yml
```

# Environment Variables

The application configuration is managed using environment variables stored in the `.env` file.

Variable      | Description                     |
DB_NAME       | Name of the PostgreSQL database |
DB_USER       | PostgreSQL username             |
DB_PASSWORD   | PostgreSQL password             |
SECRET_KEY    | Django secret key               |
DEBUG         | Enables/disables debug mode     |
ALLOWED_HOSTS | Allowed hostnames for Django    |

# Screenshots

## Homepage

<img width="1920" height="1080" alt="Screenshot (29)" src="https://github.com/user-attachments/assets/8693215a-8219-468e-bff1-bf280683b9dc" />

---

## Post List Page

<img width="1920" height="1080" alt="Screenshot (30)" src="https://github.com/user-attachments/assets/7af26e5b-30c0-4159-bfbb-156d43263d0d" />

---

## Create Post Page

<img width="1920" height="1080" alt="Screenshot (31)" src="https://github.com/user-attachments/assets/5b079a9f-715d-4507-97c2-98d2d016506d" />


---

## Running Docker Containers

<img width="974" height="100" alt="image" src="https://github.com/user-attachments/assets/8238d8d1-4774-4660-b161-dfdc6bb74132" />


---

## GitHub CI/CD Pipeline

<img width="974" height="548" alt="image" src="https://github.com/user-attachments/assets/58cff9dc-1037-45ed-a98e-4b655cf32214" />


---

# Author

Student ID: 00017024
Module: DSCC
Project: Dockerized Django Blog Deployment

---

# License

This project was developed for academic coursework purposes.

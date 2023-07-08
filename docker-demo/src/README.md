## Compose sample application

### Use with Docker Development Environments

You can open this sample in the Dev Environments.

### React application with a NodeJS backend and a MongoDB database

Project structure:
```
.
├── backend
│   ├── Dockerfile
│   ...
├── compose.yaml
├── frontend
│   ├── ...
│   └── Dockerfile
└── README.md
```

[_compose.yaml_](compose.yaml)
```
services:
  frontend:
   ... 

  backend:
  ...

  mongo:
  ...
    ...
```
The compose file defines an application with three services `frontend`, `backend` and `db`.
When deploying the application, docker compose maps port 3000 of the frontend service container to port 3000 of the host as specified in the file.
Make sure port 3000 on the host is not already being in use.

## Build docker images
```
e.g:
docker build . -t frontend
docker build . -t backend
```


## Deploy with docker compose

```
$ docker compose up -d
 [+] Running 14/14
 ✔ mongo 13 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                      20.9s 
   ✔ 22e816666fd6 Pull complete                                                                                   3.9s 
   ✔ 079b6d2a1e53 Pull complete                                                                                   4.0s 
   ✔ 11048ebae908 Pull complete                                                                                   4.1s 
   ✔ c58094023a2e Pull complete                                                                                   4.1s 
   ✔ 252003e80cc8 Pull complete                                                                                   4.2s 
   ✔ 7cb91a976d85 Pull complete                                                                                   4.9s 
   ✔ 929663192bb1 Pull complete                                                                                   6.3s 
   ✔ 5af259c6f8d8 Pull complete                                                                                    6.4s 
   ✔ 44f2ab049616 Pull complete                                                                                   6.4s 
   ✔ 14f8b9afdeb2 Pull complete                                                                                    6.5s 
   ✔ 8fd542a9a576 Pull complete                                                                                  16.4s 
   ✔ d940963cc55f Pull complete                                                                                  16.5s 
   ✔ 64541ae8fc1a Pull complete                                                                                  16.5s 
[+] Running 5/5
 ✔ Network src_react-express  Created                                                                             0.1s 
 ✔ Network src_express-mongo  Created                                                                              0.1s 
 ✔ Container src-mongo-1      Created                                                                             1.2s 
 ✔ Container src-backend-1    Created                                                                              0.7s 
 ✔ Container src-frontend-1   Created  
  ...

```

## Expected result

Listing containers must show containers running and the port mapping as below:
```
$ docker ps
CONTAINER ID  IMAGE          COMMAND                     CREATED                 STATUS                   PORTS                                                    NAMES
989e50efcd63     frontend         "docker-entrypoint.s…"    About a minute ago     Up About a minute    0.0.0.0:3000->3000/tcp, :::3000->3000/tcp   src-frontend-1
0ba75829f782     backend         "docker-entrypoint.s…"     About a minute ago   Up About a minute     3000/tcp                                                   src-backend-1
8c56c76d7cf9     mongo:4.2.0   "docker-entrypoint.s…"     About a minute ago    Up About a minute    27017/tcp                                                  src-mongo-1
```

After the application starts, navigate to `http://localhost:3000` in your web browser.

![page](./output.png)

Stop and remove the containers
```
$ docker compose down
Stopping server   ... done
Stopping frontend ... done
Stopping mongo    ... done
Removing server   ... done
Removing frontend ... done
Removing mongo    ... done
```

##### Explanation of `docker-compose`
__Services__

Our main goal to create a containers, it starts from here. As you can see there are three services(Docker images): 
- First is __frontend__ 
- Second is __backend -
- Third is __mongo__ which is db.
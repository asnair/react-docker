# 499 Doc

This repo is for CNIT 499, the 2 branches are:
*master*: we reset this branch in December when some unknown change in Docker broke our build, probably a dependency somewhere.
*broke*: this is the broken branch, was master before the reset, we saved our work here for when we try to reimplement changes (more slowly this time).

```sh
git init
git remote add origin https://github.com/asnair/react-docker
git pull origin master
git add .
git commit -m "Commit message"
git push origin master
```
We use material-ui with react, which exists within a docker container. Every new instance of the Web app spins up a container using hot-reloading.

To run node inside docker, just ```./run.sh``` and the app will be available on http://localhost:3000

To stop the server, you can run ```docker container list``` then use the *CONTAINER ID* in the command ```docker stop ID``` . The command ```docker image list``` should contain 2 images, 1 being the app and the other being the node backend.

For the basic React app, npm, Node, and Docker are required, which can be installed using:
```sh
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt-get install npm
sudo apt-get install nodejs
```

To install docker (run the first half to remove old docker installations)
```sh
sudo apt-get remove docker docker-engine
sudo apt-get update
```
Install Docker:
```sh
sudo apt-get install \
    apt-transport-https \
        ca-certificates \
            curl \
                software-properties-common
                curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
                sudo add-apt-repository \
                   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                      $(lsb_release -cs) \
                         stable"
                         sudo apt-get update
                         sudo apt-get install docker-ce
                         ```

                         Next this can be run using Docker Compose, which allows for container management. The following script should be added to package.js in the project so these commands can be run easier:

                         ```
                         "scripts": {    

                             "docker-build-and-run": "docker build -t image-dev-local . && docker run -p 3000:3000 --name container-dev-local image-dev-local",
                             "docker-stop-and-clear": "(docker stop container-dev-local || true) && (docker rm container-dev-local || true)",
                             "docker-run": "npm run docker-stop-and-clear && npm run docker-build-and-run"

                         }
                         ```

                         To start: ```npm run docker-run```

                         To stop: ```npm run docker-stop-and-clear```

                         Every next run will clear previous and build/run again automagically.

                         Don't forget to run build.sh on new installs.


                         This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

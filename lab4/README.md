# TODO: record video

# Lab 4

* Run `docker build -t simple-server .`
* Run `docker run -d -p 8080:80 --name simple-server-container simple-server`
* Open `http://localhost:8080`
* Cleanup:
  * `docker stop simple-server-container`
  * `docker rm simple-server-container`
  * `docker rmi simple-server`

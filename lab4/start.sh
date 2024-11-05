docker build -t simple-server .
docker run -d -p 8080:80 --name simple-server-container simple-server

This is a docker container of play framework.

# Note:
if you hadn't setup a dedicated security group for docker in your local OS, you will need to prepend `sudo` to all/most `docker` commands below. So please do.

# Building this container:
```
docker build -t matanster/play-framework .
```
This will take several minutes, depending mostly on your connection speed.

# Using this container to run a play framework app:

1. package your play application with the `dist` or  `universal:packageZipTarball` command (see https://www.playframework.com/documentation/2.4.x/Production)

2. extract the resulting package somewhere

3. run this docker container via:

    ```
    docker run -v /local-application-path:/app:rw -p 9000:9000 matanster/play-framework bin/app-name
    ```
    whereas:

        + `local-application-path` should be the location extracted to, as per above
        + `app-name` should be the name of the executable in /bin of the extraction

    Which makes the docker container mount the path you supply as `/app` in its virtual file system,

    To run the container differently, see `docker run --help`.

#Inheriting this image

In case you wish to package the application inside the container, you may inherit this container in a new one ― simply create an empty docker project with this as the content of `Dockerfile` in it:

```
FROM play-framework
ADD /local-application-path /app
```

then build your new container with
```
docker build -t new-container-name .
```

# Docker Hub

Docker Hub just stores containers. A little clumsy to administer, no real added value. It may probably be as fast to locally build the image after having pulled this repo. But anyway if you must:

##Publishing this container to hub.docker.com:

0. Uploading a near 1GB image like this may sure take a while - is this really what you need?
1. create a dockerhub repo
2. build this repo

    ```
    docker build -t dockerhub-user-name/play-framework .
    ```

3. push it to dockerhub

    ```
    docker push dockerhub-user-name/play-framework
    ```

##Getting the container from hub.docker.com:

```
docker pull dockerhub-user-name/play-framework
```

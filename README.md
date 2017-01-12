#Resilio Sync based on Alpine



# Usage

```shell
STATE_FOLDER=/path/to/state/of/app/folder/on/the/host
DATA_FOLDER=/path/to/data/folder/on/the/host
WEBUI_PORT=[ port to access the webui on the host ]
RSLSYNC_USER_NAME=web_login_username
RSLSYNC_USER_PWD=web_login_password

mkdir -p $STATE_FOLDER
mkdir -p $DATA_FOLDER

docker run -d --name ResilioSync \
  -p 127.0.0.1:$WEBUI_PORT:8888 -p 55555 \
  -e RSLSYNC_USER_NAME=username \
  -e RSLSYNC_USER_PWD=password \
  -v $STATE_FOLDER:/root/.sync \
  -v $DATA_FOLDER:/mnt/rslsync \
  --restart on-failure \
  dishuostec/docker-resilio-sync
```

Go to localhost:$WEBUI_PORT in a web browser to access the webui.

#### LAN access

If you do not want to limit the access to the webui to localhost, run instead:

```shell
docker run -d --name ResilioSync \
  -p $WEBUI_PORT:8888 -p 55555 \
  -e RSLSYNC_USER_NAME=username \
  -e RSLSYNC_USER_PWD=password \
  -v $STATE_FOLDER:/root/.sync \
  -v $DATA_FOLDER:/mnt/rslsync \
  --restart on-failure \
  dishuostec/docker-resilio-sync
```

# Volume

* /root/.sync - State files
* /mnt/rslsync - folders

# Ports

* 8888 - Webui
* 55555 - Listening port for Sync traffic

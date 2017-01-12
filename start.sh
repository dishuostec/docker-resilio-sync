#!/bin/ash

cat > /etc/rslsync.conf << EOT
{
    "device_name": "My Sync Device",
    "listening_port" : 55555,
    "storage_path" : "/root/.sync",
    "use_upnp" : true,
    "download_limit" : 0,
    "upload_limit" : 0,
    "directory_root" : "/mnt/rslsync/",
    "webui" :
    {
        "listen" : "0.0.0.0:8888"
        ,"login" : "${RSLSYNC_USER_NAME}"
        ,"password" : "${RSLSYNC_USER_PWD}"
        ,"allow_empty_password" : false
    }
}
EOT

rslsync --nodaemon --config /etc/rslsync.conf

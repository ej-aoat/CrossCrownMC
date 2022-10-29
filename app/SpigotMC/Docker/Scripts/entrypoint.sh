#!/usr/bin/env sh

rm spigot.jar
ln -s /opt/spigot-1.19.2.jar spigot.jar

exec java -jar spigot.jar nogui

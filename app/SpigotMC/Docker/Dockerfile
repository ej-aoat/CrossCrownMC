##############################################
# SpigotMCのビルド
FROM openjdk:18-jdk-alpine AS build

###
# 基本設定
WORKDIR /

# ソフトウェア追加
RUN apk update && \
    apk --no-cache add bash vim tzdata git

###
# SpigotMCのビルド
WORKDIR /build
# プロジェクトのSpigotアプリの構成ファイルをコンテナ内へ全てコピー
COPY app/SpigotMC/BuildTools.jar .

###
# SpigotMCアプリのビルド、およびJARファイルの生成
WORKDIR /tmp/ccmc
RUN java -jar /build/BuildTools.jar --rev 1.19.2

##############################################
# SpigotMCのデプロイ
FROM openjdk:18-jdk-alpine AS runtime

###
# 基本設定
WORKDIR /

# ソフトウェア追加
RUN apk update && \
    apk --no-cache add bash vim tzdata

###
# SpigotMCアプリの配置

WORKDIR /opt
COPY --from=build /tmp/ccmc/spigot-1.19.2.jar .

WORKDIR /opt/ccmc
COPY app/SpigotMC/eula.txt .
COPY app/SpigotMC/server.properties .
COPY app/SpigotMC/plugins ./plugins

###
# エントリポイント
COPY app/SpigotMC/Docker/Scripts/entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh
ENTRYPOINT [ "/sbin/entrypoint.sh" ]

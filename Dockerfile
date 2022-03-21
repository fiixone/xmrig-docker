FROM  alpine AS build

RUN apk add --no-cache git make cmake libstdc++ gcc g++ automake libtool autoconf linux-headers

RUN git clone https://github.com/xmrig/xmrig.git
RUN mkdir xmrig/build && \
    cd xmrig/scripts && \
    ./build_deps.sh && \
    cd ../build && \
    cmake .. -DXMRIG_DEPS=scripts/deps -DBUILD_STATIC=ON && \
    make -j$(nproc) && \
    chmod +x xmrig
FROM  alpine
WORKDIR /app
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apk del tzdata &&\
    echo "Asia/Shanghai" > /etc/timezone
COPY --from=build /xmrig/build/xmrig /app/x
COPY ./full.config.json /app/config.json
EXPOSE 1611
ENTRYPOINT ["/app/x"]

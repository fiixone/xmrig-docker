## 一. Docker Pull 运行


```bash
## --cpuset-cpus 限制cpu核心数使用
docker run -d --name xmrig -p 1611:1611 fiixone/xmrig
```



## 二. Docker Build 运行


```bash
docker build --pull --rm -f "Dockerfile" -t xmrig  "."
```
```bash
## --cpuset-cpus 限制cpu核心数使用
docker run -d --name xmrig -p 1611:1611 xmrig
```



## 三. Docker Build 运行(c3pool版本)


```bash
docker build --pull --rm -f "Dockerfile-c3pool" -t xmrig  "."
```
```bash
## --cpuset-cpus 限制cpu核心数使用
docker run -d --name xmrig -p 1611:1611 xmrig
```



## 四. 注意

### 1. 钱包地址

**请自行修改`钱包`地址**

容器内`config.json` 位置为`/app/config.json`

构建运行可修改`full.config.json`

### 2. API
默认打开容器`1611`端口为API端口,默认Token为`12348765`,可搭配[xmrig-worker](http://workers.xmrig.info/)使用.

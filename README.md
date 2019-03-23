# openwrt_imagebuilder_dockerfile

## 简介

此镜像是使用 openwrt-imagebuilder 自动编译编译 openwrt 镜像所使用的

- 编译平台 x86 
- 编译命令 

```bash
# 加入了 e1000e 内核模块，防止不识别千兆wan口网卡
make image PROFILE=Generic PACKAGES="luci luci-app-qos luci-app-upnp luci-proto-ipv6 kmod-e1000e"
```

- VOLUME 为 /opt/openwrt/bin 即是编译生成镜像的目录，请挂载到你喜欢的目录下面

```bash
# 示范
docker run --rm -v ${PWD}:/opt/openwrt/bin tangcuyu/openwrtsdk
```
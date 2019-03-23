FROM ubuntu:latest
LABEL maintainer="expo li<zzutcy@qq.com>"
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
RUN cd /opt && apt-get update \
    && apt-get upgrade -y   
RUN apt-get install apt-utils \
    axel libncurses5-dev zlib1g-dev gawk \
    flex patch git-core g++ subversion xz-utils make unzip wget Python2.7 file -y 
RUN cd /opt \
    && axel -n 100 https://downloads.openwrt.org/releases/18.06.2/targets/x86/generic/openwrt-imagebuilder-18.06.2-x86-generic.Linux-x86_64.tar.xz   \
    && xz -d openwrt-imagebuilder-18.06.2-x86-generic.Linux-x86_64.tar.xz   \
    && tar xf openwrt-imagebuilder-18.06.2-x86-generic.Linux-x86_64.tar \
    && rm openwrt-imagebuilder-18.06.2-x86-generic.Linux-x86_64.tar \
    && mv openwrt-imagebuilder-18.06.2-x86-generic.Linux-x86_64 openwrt    \
    && cd openwrt
WORKDIR /opt/openwrt/
VOLUME /opt/openwrt/bin
ENTRYPOINT [ "sh", "-c", "make image PROFILE=Generic PACKAGES=\"luci luci-app-qos luci-app-upnp luci-proto-ipv6 kmod-e1000e\" "]
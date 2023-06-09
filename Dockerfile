# 指定基础镜像
FROM centos:7

# 维护者信息
MAINTAINER bowen 544218160@qq.com

# 复制脚本文件到容器目录中
COPY entrypoint.sh /sbin/entrypoint.sh

# 运行指令
RUN yum -y install wget \
  && wget -O /tmp/ngrok.tar.gz "https://gitee.com/lliubowen_94/docker-ngrok-server/raw/master/files/ngrok.tar.gz" \
  && tar -zxvf /tmp/ngrok.tar.gz -C /usr/local \
  && rm -rf /tmp/ngrok.tar.gz \
  && chmod 755 /sbin/entrypoint.sh \
  && yum install -y epel-release \
  && yum install -y golang openssl


# 允许指定的端口
EXPOSE 80/tcp 443/tcp 4443/tcp

# 指定ngrok运行入口
ENTRYPOINT ["/sbin/entrypoint.sh"]

给Docker守护进程配置加速器

如果要配置 Docker 守护进程默认使用 Docker 官方镜像加速。您可以在 Docker 守护进程启动时配置 --registry-mirror 参数。

通过命令行启动Docker

$ docker --registry-mirror=https://registry.docker-cn.com daemon
 

通过配置文件启动Docker

Docker 版本在 1.12 或更高
修改 /etc/docker/daemon.json 文件并添加上 registry-mirrors 键值。

$ vim /etc/docker/daemon.json
 
{
 "registry-mirrors": ["https://registry.docker-cn.com"]
}


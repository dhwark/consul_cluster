# consul三节点高可用集群

1. 在hosts文件中按照格式填入ip地址

2. 修改roles\consul_cluster\files\consul_*\consul_config.json中的配置项：

   注意不要在json中添加任何注释

   ```json
   {
     "datacenter": "internal",# dc标识名
     "data_dir": "/usr/local/consul/data",
     "log_file": "/usr/local/consul/log/consul.log",
     "log_level": "INFO",
     "log_rotate_duration": "24h",
     "node_name": "master", # 节点角色名
     "server": true,
     "bootstrap_expect": 3,
     "bind_addr": "0.0.0.0",
     "client_addr": "0.0.0.0",
     "advertise_addr": "192.168.6.41", # 这里修改为节点ip
     "start_join": ["192.168.6.41"],# 这里修改为master节点的ip
     "ui": true,
     "telemetry": {
       "prometheus_retention_time": "60s"
     }
   }
   ```

   

3. 主程序部署主要是依赖files下的脚本，如果需要其他版本的consul请自行修改

4. 进入master的ui界面，查看consul集群是否正常启动

![](E:\Ansible&运维脚本\consul_cluster\images\20240201223904.png)

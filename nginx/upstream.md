# Nginx错误：(13: Permission denied) while reading upstream

### 描述

遇到个问题，就是nginx代理nodejs，nodejs里的文件下载不全就断开了。

``` text
2018/04/27 04:12:21 [crit] 1119#0: *87427 open() "/home/npm_home/usr/local/nginx/proxy_temp/8/12/0000000128" failed (13: Permission denied) while reading upstream, client: 10.0.1.94, server: npm.test.com.cn, request: "GET /main-vkm/-/main-vkm-1.0.100.tgz HTTP/1.1", upstream: "http://127.0.0.1:17003/main-vkm/-/main-vkm-1.0.100.tgz", host: "npm.test.com.cn"
```


### 问题原因

当代理文件大小超过配置的proxy_temp_file_write_size值时，nginx会将文件写入到临时目录下（默认为/proxy_temp）。

如果nginx对/proxy_temp没有权限，就写不进去。

### 解决
调整/proxy_temp权限为配置nginx的那个用户。

chown -R www:www /usr/local/nginx/proxy-temp

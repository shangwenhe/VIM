# Nginx错误：(13: Permission denied) while reading upstream

### 问题原因

当代理文件大小超过配置的proxy_temp_file_write_size值时，nginx会将文件写入到临时目录下（默认为/proxy_temp）。

如果nginx对/proxy_temp没有权限，就写不进去。

### 解决
调整/proxy_temp权限为配置nginx的那个用户。

chown -R www:www /usr/local/nginx/proxy-temp

# 问题
```
nginx 代理php-fpm 9000端口处理PHP文件
处理文件是页面展示 Not File
```

# 报错
```
[error] 48017#0: *161 FastCGI sent in stderr: "Primary script unknown" while reading response header from upstream,
```

## 分析


### script 可能是Nginx配置问题

```nginx

    location ~ \.php$ {
        root /home/www/ldap/phpLDAPadmin/;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        # 修改script为变量$document_root
        # fastcgi_param  SCRIPT_FILENAME  /script$fastcgi_script_name;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
    
```

### 测试静态文件 index.html
```
可以访问-> 说明权限没有问题
```

### 可能是权限问题导致的无法访问
```
修改文件权限 
drwxr--r--. 12 www www  4096 9月  26 04:49 .
```
### 用户权限问题
```
Ngxin使用用户为www
php-fpm使用用户为nobody

修改 php-fpm使用用户为www
```
## 解决问题




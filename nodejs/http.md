# 中文时，接收字符长度出错
## 原因 content-length 长度与内容长度不符导致的
#### 出错版本
```javascript
let data = {key: '这是一些中文'}
http.request({
      hostname: 'vos-api.vipkid.com.cn',
      port: 80,
      path: '/',
      headers: {
        client: 'node.shell.v0.0.1',
        'Content-Length': JSON.stringfy(data).length
      })
```

#### 正确版本
```javascript
let data = {key: '这是一些中文'}
http.request({
      hostname: 'vos-api.vipkid.com.cn',
      port: 80,
      path: '/',
      headers: {
        client: 'node.shell.v0.0.1',
        'Content-Length': Buffer.from(postData).length,
      })
```

# 中文时，接收字符长度出错
## 原因 content-length 长度与内容长度不符导致的
#### 出错版本
```javascript
let data = {key: '这是一些中文'}
http.request({
      hostname: 'xxxxx.com',
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
      hostname: 'xxxxx.com',
      port: 80,
      path: '/',
      headers: {
        client: 'node.shell.v0.0.1',
        'Content-Length': Buffer.from(postData).length,
      })
```

```text
JSON.stringfy(data).length
在计算英文字符时，是没有问题在但如果有中文存在就会出现问题。length计算的不是字节长度。
所以需要修改为Buffer.from(postData).length，去计算需要上传数据的长度

```

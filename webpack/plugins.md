# 报错 TypeError: Cannot read property 'type' of undefined
```text
# 因为plugins应该为数组形式
```

# plugin 的所有事件
```javascript
'use strict';

function testPlugin(options) {
  console.log('init plugin', options)
}

testPlugin.prototype.apply = function(compiler) {

  compiler.plugin('run', function(compiler, callback) {
    // console.log(compiler)
    console.log("webpack 构建过程开始！！！");
    callback();
  });
  
  compiler.plugin("compile", function(params) {
    console.log("编译器开始编译...");
  });

  compiler.plugin("compilation", function(compilation) {
    console.log("开始编译一个区块...");

    compilation.plugin("optimize", function() {
      console.log("文件优化...");
    });
  });
  
  compiler.plugin("after-compile", function(params, callback) {
    console.log(" after编译器开始编译...");
    callback()
  });

  compiler.plugin('make', function(compiler, callback) {
    console.log("webpack make 构建过程开始！！！");
    callback();
  });
 
  compiler.plugin('emit', function(compiler, callback) {
    // console.log(compiler)
    console.log("webpack 编译完成！！！");
    callback();
  });
  
  compiler.plugin('after-emit', function(compiler, callback) {
    // console.log(compiler)
    console.log("webpack after编译完成！！！");
    callback();
  });
  
}

module.exports = testPlugin;
```

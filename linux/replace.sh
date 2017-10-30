 
#!/bin/bash 

tar zxvf ./output.tar.gz

# 对查找到的文件进行字符串替换
# 在find中使用流编译器进行字符串替换，并直接重写原文件
find ./output  -name '*'  -exec sed  -i '' 's/https:\/\/www.test.com.cn/https:\/\/dev-01.test.com.cn/g;s/shang/test/g;s/index.js/entry.js/g' {} \;
find ./output  -name '*'  -exec sed  -i '' 's/http\:\/\/www.test.com.cn/http\:\/\/dev-01.test.com.cn/g;s/shang/test/g;s/index.js/entry.js/g' {} \;

 
#!/bin/bash 

tar zxvf ./output.tar.gz

find ./output  -name '*'  -exec sed  -i '' 's/www.test.com.cn/dev-01.test.com.cn/g;s/shang/test/g;s/index.js/entry.js/g' {} \;

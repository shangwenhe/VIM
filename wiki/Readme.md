# 安装，语言包，破解

1 安装 ./atlassian-confluence-5.9.11-x64.bin
2 语言包 安装,选择语言包 https://translations.atlassian.com/ （官方下载）

    1、插件管理 http://wiki.xiaodutv.com/plugins/servlet/upm/  
    2、上传插件 把刚刚下载的语言包安装上。

3、选择使用语言包

    1、http://wiki.xiaodutv.com/admin/viewlanguage.action
    2、选择中文语言包，重启后设置生效

4 破解
    
    cp atlassian-extras-decoder-v2-3.2.jar /opt/atlassian/confluence/confluence/WEB-INF/lib

# 最优方案

    /opt/atlassian/confluence/bin/setenv.sh
    根据需要进行调整
    -Xms 最小使用内存
    -Xmx 最大使用内存
    CATALINA_OPTS="-Xms3072m -Xmx10240m -XX:+UseG1GC ${CATALINA_OPTS}"

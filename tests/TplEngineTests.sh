#!/bin/bash

###############
# Name: 简单模板引擎测试脚本
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 设置变量
ShellPath=$(cd $(dirname $(readlink -f "${BASH_SOURCE[0]}")) && pwd )
ServerName="localhost"
SslSign="ssl"

### 创建模板
echo "----- 模板 -----"
echo '
server {
    listen 80;
<{=if [ "${ServerAlias}" == "" ]; then=}>
    server_name <%=${ServerName}=%>;
<{=else=}>
    server_name <%=${ServerName}=%> <%=${ServerAlias}=%>;
<{=fi=}>
    if ($scheme = "http") {
        return 301 https://$host$request_uri;
    }
    ssl_certificate <%=${SslSign}=%>.crt;
    ssl_certificate_key <%=${SslSign}=%>.key;
}
' | tee "${ShellPath}/TplEngine.tests.tpl"

### 引入测试
echo "----- 测试 Source 模式 -----"
TplContent=$(cat "${ShellPath}/TplEngine.tests.tpl")
source ${ShellPath}/../TplEngine.sh
echo "${TplContent}"

### 执行测试
echo "----- 测试 Bash 模式 -----"
bash ${ShellPath}/../TplEngine.sh \
    "${ShellPath}/TplEngine.tests.tpl" \
    "${ShellPath}/TplEngine.tests.conf" \
    "ServerAlias=default_server" \
    "ServerName=$ServerName" \
    "SslSign=$SslSign"

rm -rf ${ShellPath}/TplEngine.tests.*

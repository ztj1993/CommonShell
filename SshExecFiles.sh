#!/bin/bash

###############
# Name: 远程执行本地文件
# author: ZhangTianJie
# email: ztj1993@gmail.com
# Param 1: <Host>(Host|IP)
# Param 2: <Username>(Username)
# Param 3: <Password>(Password)
# Param Other: <File...>(ShellFiles)
# Returns: 0:skip-quit   1:error
###############

### 定义帮助文本
if [ "${1}" == "help" ]; then
    echo ">>> params 1 <Host>(Host|IP)"
    echo ">>> params 2 <Username>(Username)"
    echo ">>> params 3 <Password>(Password)"
    echo ">>> params Other <File...>(ShellFiles)"
    exit
fi

### 设置变量
[ -z "${Host}" ] && Host="${1}"
[ -z "${Username}" ] && Username="${2}"
[ -z "${Password}" ] && Password="${3}"
[ -z "${Files}" ] && Files=("${@:4}")

### 执行文件
cat ${Files[*]} | sshpass -p "${Password}" ssh -T -o StrictHostKeyChecking=no ${Username}@${Host}

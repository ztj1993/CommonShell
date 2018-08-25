#!/bin/bash

###############
# Name: 批量路径复制
# author: ZhangTianJie
# email: ztj1993@gmail.com
# Params: <Path Path...>(ArrayString)[OriginalPath=>TargetPath]
# Returns: 0:skip-quit   1:error
###############

### 使用示例
if [ "${1}" == "debug1" ] && [ ! ${debug} ]; then
    debug=true
    ShellPath=$(cd $(dirname $(readlink -f "${BASH_SOURCE[0]}")) && pwd )
    BatchCopyPaths=(
        "${ShellPath}/BatchCopy.sh=>${ShellPath}/BatchCopy.sh.bak1"
        "${ShellPath}/BatchCopy.sh=>${ShellPath}/BatchCopy.sh.bak2"
    )
    source ${ShellPath}/BatchCopy.sh
    [ ! -f "${ShellPath}/BatchCopy.sh.bak1" ] && echo "error bak1" && exit 1
    [ ! -f "${ShellPath}/BatchCopy.sh.bak2" ] && echo "error bak2" && exit 1
    rm -rf ${ShellPath}/BatchCopy.sh.bak*
    bash ${ShellPath}/BatchCopy.sh "${BatchCopyPaths[@]}"
    [ ! -f "${ShellPath}/BatchCopy.sh.bak1" ] && echo "error bak1" && exit 1
    [ ! -f "${ShellPath}/BatchCopy.sh.bak2" ] && echo "error bak2" && exit 1
    rm -rf ${ShellPath}/BatchCopy.sh.bak*
    exit 0
fi

### 定义帮助文本
if [ "${1}" == "help" ] || [ "${1}" == "" ]; then
    echo ">>> Params <Path Path...>(ArrayString)[OriginalPath=>TargetPath]"
    exit 0
fi

### 设置变量
[ -z "${BatchCopyPaths}" ] && BatchCopyPaths=(${*})

### 判断是否定义了路径
if [ "${BatchCopyPaths[*]}" == "" ]; then
    echo ">>>>> Error: the var <BatchCopyPaths>(ArrayString) does not exist"
    exit 1
fi

### 循环数组
for Path in ${BatchCopyPaths[@]}
do
    ### 复制文件
    \cp -fR ${Path%=>*} ${Path#*=>}
    [ $? -ne 0 ] && echo ">>>>> Error: copy path error" && exit 1
done

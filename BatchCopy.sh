#!/bin/bash

###############
# Name: 批量路径复制
# author: ZhangTianJie
# email: ztj1993@gmail.com
# Params: <Path Path...>(ArrayString)[OriginalPath=>TargetPath]
# Returns: 0:skip-quit   1:error
###############

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
    SrcPath=${Path%=>*}
    DistPath=${Path#*=>}
    ### 跳过不存在路径
    if [ "${SkipNotExist}" == "yes" ]; then
        if [ ! -e ${SrcPath%\*} ]; then
            continue
        fi
        if [ ! -e ${DistPath} ]; then
            continue
        fi
    fi
    ### 复制文件
    \cp -fR ${Path%=>*} ${Path#*=>}
    [ $? -ne 0 ] && echo ">>>>> Error: copy path error" && exit 1
done

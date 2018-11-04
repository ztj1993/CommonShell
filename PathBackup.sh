#!/bin/bash

###############
# Name: 路径备份
# author: ZhangTianJie
# email: ztj1993@gmail.com
# Params 1: <OriginalPath>(FilePath|DirPath|Required)
# Params 2: <TargetPath>(DirPath)
# Params 3: <PathAlias>(FileName|DirName)
# Returns: 0:skip-quit   1:error
###############

### 定义帮助文本
if [ "${1}" == "help" ]; then
    echo ">>> param 1 <OriginalPath>(FilePath|DirPath|Required)"
    echo ">>> param 2 <TargetPath>(DirPath)"
    echo ">>> param 3 <PathAlias>(FileName|DirName)"
    exit
fi

### 设置变量
[ -z "${OriginalPath}" ] && OriginalPath="${1}"
[ -z "${TargetPath}" ] && TargetPath="${2}"
[ -z "${PathAlias}" ] && PathAlias="${3}"

### 处理变量
[ -z "${TargetPath}" ] && TargetPath=$(dirname "${OriginalPath}")
[ -z "${PathAlias}" ] && PathAlias=$(basename "${OriginalPath}")

### 判断变量
if [ ! -f "${OriginalPath}" ] && [ ! -d "${OriginalPath}" ]; then
    echo ">>>>> Error: the var <OriginalPath> does not exist"
    exit 1
fi

### 备份原始文件
if [ ! -f "${TargetPath}/${PathAlias}.bak" ] && [ ! -d "${TargetPath}/${PathAlias}.bak" ]; then
    sudo cp -fR "${OriginalPath}" "${TargetPath}/${PathAlias}.bak"
fi

### 按日期备份
DateTime=`date +%Y-%m-%d-%H-%M-%S`
sudo cp -fR "${OriginalPath}" "${TargetPath}/${PathAlias}.bak.${DateTime}"
[ $? -ne 0 ] && echo ">>>>> Error: backup path error" && exit 1

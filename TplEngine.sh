#!/bin/bash

###############
# Name: 简单模板引擎
# author: ZhangTianJie
# email: ztj1993@gmail.com
# Use: curl -sSL http://dwz.cn/tJvCyBGb > /tmp/SelectMenu && source /tmp/SelectMenu
# Param 1: <FilePath|TplContent>(FilePath|String|Required)
# Param 2: <OutFile>(FilePath)
# Param Other: <Var...>(ArrayString)[name=>value]
# Returns: 0:skip-quit   1:error
###############

### 定义帮助文本
if [ "${1}" == "help" ]; then
    echo ">>> param 1 <FilePath|TplContent>(FilePath|String|Required)"
    echo ">>> param 2 <OutFile>(FilePath)"
    echo ">>> Param Other <Var...>(ArrayString)[name=>value]"
    exit 0
fi

### 设置变量
[ -z "${TplContent}" ] && TplContent="${1}"
[ -z "${TplOutFile}" ] && TplOutFile="${2}"
[ -z "${TplVars}" ] && TplVars=("${@:3}")

### 设置模板变量
for VarString in ${TplVars[@]}
do
    eval $VarString
done

### 判断是否设置了模板内容变量
[ -f "${TplContent}" ] && TplContent=$(cat ${TplContent})
[ "${TplContent}" == "" ] && echo ">>>>> Error: the var <TplContent> does not exist" && exit 1

### 替换所有的 $ 为 \$
TplContent=${TplContent//\$/\\\$}

### 将所有的变量和语句中的 \$ 替换 $
TplContent=$(echo "${TplContent}" | sed -E '/<[%|{]=.+?=[%|}]>/ s/\\\$/$/g')

### 替换所有的非语句中的 " 为 \"
TplContent=$(echo "${TplContent}" | sed -e '/^<{=/! s/\"/\\\"/g')

### 将所有的非语句 echo 一下
TplContent=$(echo "${TplContent}" | sed -e '/^<{=/! s/^.*$/echo "&"/')

### 替换掉所有的模板标签
TplContent=$(echo "${TplContent}" | sed -e 's/<{=\|=}>\|<%=\|=%>//g')

### 执行字符串
TplContent=$(eval "${TplContent}")

[ "${TplOutFile}" != "" ] && echo "${TplContent}" | sudo tee ${TplOutFile}

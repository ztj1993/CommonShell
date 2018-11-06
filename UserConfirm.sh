#!/bin/bash

###############
# Name: 用户提示并确认
# Author: ZhangTianJie
# Email: ztj1993@gmail.com
# Params: <DefaultInput>[yes|no] 默认输入
# Params: <TipsArr>[StringArray](tips tips...) 路径数组
# Return=0: 用户全部确认
# Return=!0: 用户有一项没有确认，返回提示的第几项
###############

### 定义帮助文本
if [ "${1}" == "help" ]; then
    echo ">>> Params: <DefaultInput>[yes|no] 默认输入"
    echo ">>> Params: <TipsArr>[StringArray](tips tips...) 路径数组"
    echo ">>> Return=0: 用户全部确认"
    echo ">>> Return=!0: 用户没有确认，返回提示的第几项"
    exit 0
fi

# 全局跳过
[ "${SkipUserConfirm}" == "yes" ] && exit 0

### 定义变量
DefaultInput="${1}"
TipsArr=("${@:2}")

# 循环提示
for i in ${!TipsArr[@]}
do
    read -p "${TipsArr[$i]} [Y/n] " response
    response=${response:-${DefaultInput}}
    case ${response} in
        [yY][eE][sS]|[yY]|'')
            ;;
        *)
            # 用户没有确认时，直接退出
            exit $(($i+1))
            ;;
    esac
done

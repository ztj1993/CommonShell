#!/bin/bash

###############
# Name: 获取第一个存在的路径
# Params: <Path Path...> 路径
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############
function getFirstExistPath () {
    for Path in ${*}
    do
        [ -e ${Path} ] && return ${Path}
    done
}

###############
# Name: 用户确认
# Params: <Path Path...> 路径
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############
function userConfirm () {
    # 全局跳过
    [ "${skipUserConfirm}" == "yes" ] && return 0
    # 提示
    for Tips in ${*}
    do
        read -p "${Tips} [Y/n] " response
        case $response in
            [yY][eE][sS]|[yY]|'')
                ;;
            *)
                # 失败返回
                return 1
                ;;
        esac
    done
    # 通过返回
    return 0
}

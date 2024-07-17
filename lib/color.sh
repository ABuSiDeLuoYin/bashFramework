#!/usr/bin/env bash
#本脚本用于定义输出文本颜色(如提示性文本可以定义为绿色),放在lib目录下作为依赖引入,出于兼容性,部分颜色提供纯小写,纯驼峰,和下划线大写形式调用
#注:\e与\033等价
#原始
export origin="\e[0m"
export ORIGIN="\e[0m"
#文本颜色
#黑
export black="\e[0;30m"
#深灰
export darkGrey="\e[1;30m"
export darkgrey="\e[1;30m"
export DARK_GREY="\e[1;30m"
#红
export red="\e[0;31m"
#浅红
export lightRed="\e[1;31m"
export lightred="\e[1;31m"
export LIGHT_RED="\e[1;31m"
#绿
export green="\e[0;32m"
#浅绿
export lightGreen="\e[1;32m"
export lightgreen="\e[1;32m"
export LIGHT_GREEN="\e[1;32m"
#棕
export brown="\e[0;33m"
#黄
export yellow="\e[1;33m"
#蓝
export blue="\e[0;34m"
#浅蓝
export lightBlue="\e[1;34m"
export lightblue="\e[1;34m"
export LIGHT_BLUE="\e[1;34m"
#粉红
export pink="\e[0;35m"
#浅粉
export lightPink="\e[1;35m"
export lightpink="\e[1;35m"
export LIGHT_PINK="\e[1;35m"
#青
export cyan="\e[0;36m"
#浅青
export lightCyan="\e[1;36m"
export lightcyan="\e[1;36m"
export LIGHT_CYAN="\e[1;36m"
#浅灰
export lightGrey="\e[0;37m"
export lightgrey="\e[0;37m"
export LIGHT_GREY="\e[0;37m"
#白
export white="\e[1;37m"
#背景颜色
#背景黑
export bgBlack="\e[0;40m"
export bgblack="\e[0;40m"
export BG_BLACK="\e[0;40m"
#背景红
export bgRed="\e[0;41m"
export bgred="\e[0;41m"
export BG_RED="\e[0;41m"
#背景绿
export bgGreen="\e[0;42m"
export bggreen="\e[0;42m"
export BG_GREEN="\e[0;42m"
#背景棕
export bgBrown="\e[0;43m"
export bgbrown="\e[0;43m"
export BG_BROWN="\e[0;43m"
#背景蓝
export bgBlue="\e[1;44m"
export bgblue="\e[1;44m"
export BG_BLUE="\e[1;44m"
#背景粉红
export bgPink="\e[1;45m"
export bgpink="\e[1;45m"
export BG_PINK="\e[1;45m"
#背景青
export bgCyan="\e[1;46m"
export bgcyan="\e[1;46m"
export BG_CYAN="\e[1;46m"
#背景浅灰
export bgLightGrey="\e[1;47m"
export bglightgrey="\e[1;47m"
export BG_LIGHT_GREY="\e[1;47m"
#额外的echo用法
#echo -en "\033[1A\033[K"
#echo -en "\033[J"
# 上面的两个命令行中,\033是转义字符,代表ESC(也可以直接用\e)。
# \033[1A 将光标上移1行，
# \033[K 清除从光标所在位置到行尾的所有内容，
# \033[J 清除从光标所在位置到屏幕底部的所有内容。
#!/usr/bin/env bash
#建议创建软链接到家目录,如'ln -s 绝对路径/ui.sh ~/'
#初始化过程中只要脚本发生错误,终止执行
set -e
set -o errexit
set -o pipefail

#获取本脚本的真实路径(即支持本脚本被软链接)
#不排错就注释掉
# 获取当前执行的脚本或软链接的名称
#SCRIPT_NAME=$(basename "$0")
# 获取脚本的真实目录
#SCRIPT_DIR=$(realpath "$(readlink -f "$0")")
#if [ -L "$0" ];then
#    echo -e "${SCRIPT_NAME} 是一个软链接"
#    echo -e "软链接所指向的脚本目录是: ${SCRIPT_DIR}"
#else
#    echo -e "${SCRIPT_NAME} 是一个真实脚本"
#    echo -e "脚本的目录是: ${SCRIPT_DIR}"
#fi

#切换当前目录到真实目录
cd $(dirname "$(readlink -f "$0")")
#库目录
LIB_DIR=$(dirname "$(readlink -f "$0")")/lib
#生效颜色库
source "${LIB_DIR}"/color.sh
#生效常量库
source "${LIB_DIR}"/const.sh
#读取自定义脚本的目录(默认当前执行脚本真实路径下的目录中)
declare -r  SCRIPTS_DIR="personal-scripts"
#与真实路径组合后的自定义脚本读取路径
COMBINED_PATH=$(dirname "$(readlink -f "$0")")/${SCRIPTS_DIR}
#开始初始化
echo -e "${lightgreen}${SPLIT_STR}初始化中,正在读取已有脚本${origin}"
echo -e "${lightgreen}${SPLIT_STR}读取目录配置为:${origin}${bggreen}${white}${COMBINED_PATH}${origin}"
#遍历脚本目录中所有脚本,开始建立映射关系(索引)
declare -a SCRIPTS_LIST=$(ls ${COMBINED_PATH})
declare -a SCRIPTS_ARR
declare -i ARR_INDEX=0

declare -A SCRIPTS_MAP
for file in ${SCRIPTS_LIST[*]}
do
	SCRIPTS_MAP["${file}"]=$(sh ${COMBINED_PATH}/${file} -d)
	SCRIPTS_ARR[${ARR_INDEX}]="${file}"
	let ARR_INDEX=${ARR_INDEX}+1
done
#数组长度获取
#echo -e "数组长度"${#SCRIPTS_ARR[*]}
declare -i ARR_LENGTH=${#SCRIPTS_ARR[*]}
#初始化完关闭此选项
set +o errexit
set +o pipefail
#set +e
echo -e "${lightgreen}${SPLIT_STR}初始化完成${origin}"
#打印脚本列表的方法
function printScripts(){
	# 首先,使用tput移动光标到第1行的第0个位置
	tput cup 0 0
	# 然后,清除从当前位置到屏幕底部的所有内容
	tput el; tput cnorm; tput sc; tput rc; tput ed
	# 备用方案
	#光标上移8行,并移到行首,然后清除光标到底部的内容
	#echo -e "\033[8A\033[J"
	echo -e "${lightgreen}${SPLIT_STR}${SPLIT_STR}${SPLIT_STR}${origin}"
	for((i=0 ; i < ${ARR_LENGTH};i++))
	do
		DESCRIPTION="${SCRIPTS_MAP[${SCRIPTS_ARR[${i}]}]}"
		echo -e "输入${lightblue}${i}${origin}  \t  \t${DESCRIPTION}"
	done
	echo -e "输入${lightblue}m或M${origin} \t重新展示本列表信息"
	echo -e "输入${lightblue}esc或ESC${origin} \t退出"
	echo -e "${lightgreen}${SPLIT_STR}${SPLIT_STR}${SPLIT_STR}${origin}"
}

function execute(){
	if [ $1 ];then
		#解决输入不在列表中任意选项时会执行第一个菜单中的脚本的问题,限制只对输入数字做处理
		shopt -s extglob
		case "${1}" in
			*[[:digit:]])
				if [ -f "${COMBINED_PATH}/${SCRIPTS_ARR[${1}]}" ];then
					sh "${COMBINED_PATH}/${SCRIPTS_ARR[$1]}" -e
				else
					#这里有没有必要再提示一下
					echo -e "${red}请输入正确的菜单列表选项${origin}"
				fi
				;;
			[mM])
				printScripts
				;;
			esc|ESC)
				echo -en "\033[1A\033[J脚本退出"
				exit 0
				;;
			*)
				echo -e "${red}请输入正确的菜单列表选项${origin}"
				;;
		esac
	fi
}
echo -e "${lightgreen}${SPLIT_STR}输入对应菜单前的数字即可使用对应功能${origin}"
#打印脚本功能列表
printScripts

while true ;do
	#可超时120秒
	if read -et 120 input; then
		#sh xxx.sh
		execute "${input}"
	else
		echo -e "${yellow}等待输入已超时或被取消,退出脚本${origin}"
		exit 0
	fi
done
		

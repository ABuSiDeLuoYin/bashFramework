#!/usr/bin/env bash
#这是一个脚本模板文件,把要做的操作写进main函数,并将脚本描述写进getDesc函数的echo命令后即可
#脚本执行主方法
#script's main function
function main(){
	#do something
	echo "做点什么"
}

#返回脚本功能
#return script's description
function getDesc(){
	#return the description of this script file
	echo "脚本描述"
}

while getopts "ed" OPTION; do
  case "${OPTION}" in
    #execute main function
    e)
      main
      ;;
    #get the description of this script file
    d)
      getDesc
      ;;
    ?)
      echo "script usage: $(basename $0) [-e] [-d]" >&2
      exit 1
      ;;
  esac
done
shift "$((${OPTIND} - 1))"
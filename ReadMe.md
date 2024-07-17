# 这是怎样一个项目?

这个项目旨在提供一个shell脚本调用的框架,它带有一个简易的文字版UI,按照提示输入指令可以快捷调用对应脚本

# 我该怎样使用?

首先要明确一件事,那就是本项目只需要

- ui.sh
- lib/
  - color.sh
  - const.sh
- personal-scripts/

这些文件及目录结构就够了

## 你要做的事

1. 在`personal-script`目录下根据模板文件`thisIsAScriptFile.sh`来编写自己期望的脚本文件即可,编写完后仍然保存在`personal-scripts`目录下,主脚本`ui.sh`会逐一调用该目录下所有脚本并带上`-d`参数以生成一个脚本列表,并以文字版UI的形式展示
2. 执行`ui.sh`,无论你当前是否在`ui.sh`所在目录,或者你执行的是一个指向`ui.sh`的软链接,都可以正常工作

# 其他语言Other Language

[English](./ReadMe-en.md)
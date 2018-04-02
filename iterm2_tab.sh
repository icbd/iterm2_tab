# README
# 将本脚本复制到自己用户目录下
# 编辑 vi ~/.bash_profile
# 添加一行 source ~/iterm2_tab.sh
# 命令行执行 source ~/.bash_profile

# iterm2_tab_set_title "哈  哈"
function iterm2_tab_set_title() {
    if [ $# -eq 0 ];then
        echo -ne "\033]0;`pwd`\007";
    elif [ $# -eq 1 ];then
        if [ "$1" == "" ];then
            echo -ne "\033]0;`pwd`\007";
        else
            echo -ne "\033]0;$1\007";
        fi
    else
        echo "Error: too many arguments."
    fi
}

# iterm2_tab_set_color 1 2 3
function iterm2_tab_set_color() {
  echo -ne "\033]6;1;bg;red;brightness;$1\a";
  echo -ne "\033]6;1;bg;green;brightness;$2\a";
  echo -ne "\033]6;1;bg;blue;brightness;$3\a";
}

function tabr {
    iterm2_tab_set_title "$1";
    iterm2_tab_set_color 255 0 0;
}

function tabg {
    iterm2_tab_set_title "$1";
    iterm2_tab_set_color 0 255 0;
}

function tabb {
    iterm2_tab_set_title "$1";
    iterm2_tab_set_color 0 0 255;
}

function tab {
    iterm2_tab_set_title "$1";
    r=$(( RANDOM % 255  ))
    g=$(( RANDOM % 255  ))
    b=$(( RANDOM % 255  ))
    echo $r $g $b
    iterm2_tab_set_color $r $g $b
}

alias title="iterm2_tab_set_title"
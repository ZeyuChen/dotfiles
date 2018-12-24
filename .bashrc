# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias docker="sudo docker"

[[ -s "/home/chenzeyu01/.jumbo/etc/bashrc" ]] && source "/home/chenzeyu01/.jumbo/etc/bashrc"
source /home/chenzeyu01/anaconda3/etc/profile.d/conda.sh

function proxyoff(){
    unset http_proxy
    unset https_proxy
    echo -e "已关闭代理"
}

function proxyon() {
    export http_proxy=http://172.19.57.45:3128
    export https_proxy=http://172.19.57.45:3128
    echo -e "已开启代理"
}

# # short cut for Conda activate and deactivate
alias dact="conda deactivate"

alias tfenv="conda activate tf1.12-py36"
alias mxnetenv="conda activate mxnet131-cu80mkl-py36"
alias pytorchenv="conda activate pytorch1.0-cu80-py36"
alias paddleenv="conda activate paddle1.2-py36"

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias docker="sudo docker"

# Jumbo
export JUMBO_ROOT="/home/chenzeyu01/.jumbo"
export PATH="$JUMBO_ROOT/bin:$PATH"
export MANPATH="$JUMBO_ROOT/share/man:$(manpath)"

# protoc
export PATH="$HOME/tool/bin:$PATH"

# Conda
source $HOME/anaconda3/etc/profile.d/conda.sh


# Baidu Internal Proxy
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
# Open Proxy by default
#proxyon

# short cut for Conda activate and deactivate
alias dact="conda deactivate"

# Deep Learning environment
alias tfenv="conda activate tf1.12-py36"
alias mxnetenv="conda activate mxnet131-cu80mkl-py36"
alias pytorchenv="conda activate pytorch1.0-cu80-py36"
alias paddleenv="conda activate paddle1.2-py36"
alias paddledev="conda activate paddle-dev-py36"
alias deact="conda deactivate"

# nvidia-smi
alias smi="watch -n 1 nvidia-smi"


# PS display branch info
function git_branch {
   branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
       echo " ($branch)"
   fi
}

export PS1='\u@\h \[\033[01;36m\]\W\[\033[01;32m\]$(git_branch)\[\033[00m\] \$ '

export CUDA_VISIBLE_DEVICES=1,2
export LD_LIBRARY_PATH=/home/work/cuda-9.0/lib64/:/home/work/cudnn/cudnn_v7.1/cuda/lib64/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/work/nccl_2.2.12-1+cuda9.0_x86_64/lib:$LD_LIBRARY_PATH # nccl
export CUDA_HOME=/home/work/cuda-9.0

# temp for paddlehub develop
export PYTHONPATH="/home/chenzeyu01/Paddle/PaddleHub/":

# scp addr
alias addr='echo chenzeyu01@`hostname`:`pwd`'
alias ftpaddr='echo -n ftp://`hostname`/`pwd`/;echo '
alias httpserver='python -m http.server'

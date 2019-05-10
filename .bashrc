# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Anaconda 
source $HOME/anaconda3/etc/profile.d/conda.sh

# Jumbo
[[ -s "/home/chenzeyu01/.jumbo/etc/bashrc" ]] && source "/home/chenzeyu01/.jumbo/etc/bashrc"

# User specific aliases and functions

alias docker="sudo docker"

# Conda
export CUDA_HOME=/home/work/cuda-10.0
export LD_LIBRARY_PATH=/home/work/cuda-10.0/lib64/:/home/work/cudnn/cudnn_v7.4/cuda/lib64/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/work/nccl/nccl2.4.2_cuda10.0/lib:$LD_LIBRARY_PATH # nccl
export LD_LIBRARY_PATH=$HOME/.jumbo/lib:$LD_LIBRARY_PATH # jumbo


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

# Deep Learning environment
alias tfenv="conda activate tf1.12-py36"
alias mxnetenv="conda activate mxnet131-cu80mkl-py36"
alias pytorchenv="conda activate pytorch1.0-cu80-py36"
alias paddleenv="conda activate paddle1.3-py36"
alias pdenv="conda activate paddle1.3-py36"
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


# temp for paddlehub develop
export PYTHONPATH="/home/chenzeyu01/Paddle/PaddleHub/":$PYTHONPATH

# For tensorflow models
#TFMODELS='/home/chenzeyu01/tensorflow/models/research/'
# From tensorflow/models/research/
#export PYTHONPATH=$PYTHONPATH:$TFMODELS:$TFMODELS/slim

# scp addr
alias addr='echo chenzeyu01@`hostname`:`pwd`'
alias ftpaddr='echo -n ftp://`hostname``pwd`/;echo '
alias httpserver='python -m http.server'

alias ftpserver='nohup sudo /usr/local/proftp/sbin/proftpd'


init: vundle oh-my-zsh tmux zsh vim iterm

vundle:
	[ -d ~/.vim/bundle/Vundle.vim ] || \
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

oh-my-zsh:
	[ -d ~/.oh-my-zsh/.git ] || \
		git clone git://github.com/robbyrussel/oh-my-zsh.git ~/.oh-my-zsh

tmux:
	ln -fs `pwd`/.tmux.conf ~/.tmux.conf

zsh:
	ln -fs `pwd`/.zshrc ~/.zshrc

vim:
	ln -fs `pwd`/.vimrc ~/.vimrc

config:
	ln -fs `pwd`/config ~/.ssh/config

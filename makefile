#oh-my-zsh:
#	[ -d ~/.oh-my-zsh/.git ] || \
#		git clone git://github.com/robbyrussel/oh-my-zsh.git ~/.oh-my-zsh

.PHONY: init tmux zsh vim

init: tmux zsh vim

tmux:
	ln -fs `pwd`/.tmux.conf ~/.tmux.conf
zsh:
	ln -fs `pwd`/.zshrc ~/.zshrc

vim:
	ln -fs `pwd`/.vimrc ~/.vimrc

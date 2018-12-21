
init: vundle oh-my-zsh tmux zsh bash vim

vundle:
	[ -d ~/.vim/bundle/Vundle.vim ] || \
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

oh-my-zsh:
	[ -d ~/.oh-my-zsh/.git ] || \
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

tmux:
	ln -fs `pwd`/.tmux.conf ~/.tmux.conf

zsh:
	ln -fs `pwd`/.zshrc ~/.zshrc

bash:
	ln -fs `pwd`/.bashrc ~/.bashrc

vim:
	ln -fs `pwd`/.vimrc ~/.vimrc

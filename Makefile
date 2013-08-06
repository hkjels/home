
PWD=$(shell pwd)
SRC:=$(wildcard .*.link)
DST:=$(patsubst %.link,~/%,$(SRC))


install: symlinks
	@echo '    If you have any preferences to add, create ~/.[app].local'
	@echo '    files, where `app` is one of bashrc, vimrc, gitconfig.'
	@echo ''
	@echo '    You will need to change your shell for completion to work'
	@echo '    properly.'
	@echo ''
	@echo '    sudo chsh -s $(brew --prefix bash)/bin/bash'
	@echo ''

symlinks: $(DST)
	@echo ""
	@echo "    ==============================="
	@echo "    All symlinks have been created."
	@echo "    ==============================="
	@echo ""

brew:
	@. ~/.brew
	@echo ""
	@echo "    =============================================="
	@echo "    Homebrew and applications have been installed."
	@echo "    =============================================="
	@echo ""

vim:
	@mkdir -p ~/.vim/bundle
	@git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	@vim +NeoBundleInstall +qall
	@echo ""
	@echo "    =========================================="
	@echo "    Vim and all of it's bundles are installed."
	@echo "    =========================================="
	@echo ""

~/%: $(PWD)/%.link
	ln -is $^ $@

uninstall:
	rm $(DST)

update:
	@g pull --rebase
	@cat History.md


.PHONY: install symlinks uninstall update


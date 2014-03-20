
OS := $(shell uname -s | tr '[:upper:]' '[:lower:]')
SRC:= $(wildcard .*.link)
DST:= $(patsubst %.link,~/%,$(SRC))


install: symlinks apps vim
	@echo ''
	@echo '    Everything was successfully installed! If you bump into any issues,'
	@echo '    please let me know: [https://github.com/hkjels/home/issues].'
	@echo '    Any personal preferences should be added to `~/.[app].local` files,'
	@echo '    where [app] is one of `bashrc`, `vimrc`, `gitconfig`, etc.'
	@echo ''
	@echo '    You will need to change your shell for everything to work as expected:'
	@echo ''
	@echo '    `sudo chsh -s $(brew --prefix bash)/bin/bash`'
	@echo ''
	@echo '    Have a nice day!'
	@echo ''

symlinks: $(DST)
	@echo ""
	@echo "    Symlinks have been created."
	@echo "    ==========================="
	@echo ""

apps:
	@. ~/.$(OS)
	@echo ""
	@echo "    Applications have been installed."
	@echo "    ================================="
	@echo ""

vim:
	@mkdir -p ~/.vim/{autoload,backup,swap}
	@curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim
	@vim +PlugInstall +qall
	@cd ~/.vim/plugged/vimproc.vim && make
	@cd ~/.vim/plugged/tern_for_vim && npm install
	@echo ""
	@echo "    Vim and all of it's bundles are installed."
	@echo "    =========================================="
	@echo ""

~/%: $(PWD)/%.link
	ln -is $^ $@

uninstall:
	rm $(DST)

update:
	@git pull --rebase
	@cat History.md


.PHONY: install symlinks uninstall update


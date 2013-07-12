
PWD=$(shell pwd)
SRC:=$(wildcard .*.link)
DST:=$(patsubst %.link,~/%,$(SRC))


install: symlinks
	@echo '    If you have any preferences to add, create ~/.[app].local'
	@echo '    files, where `app` is one of zshrc, bashrc, vimrc, gitconfig,'
	@echo '    tmux.conf.'
	@echo ''

symlinks: $(DST)
	@echo ""
	@echo "    ==============================="
	@echo "    All symlinks have been created."
	@echo "    ==============================="
	@echo ""

~/%: $(PWD)/%.link
	ln -is $^ $@

uninstall:
	rm $(DST)

update:
	@g pull --rebase
	@cat History.md


.PHONY: install symlinks uninstall update


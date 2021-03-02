.PHONY: install bundle

CURL=curl -fsSL

brew:
	@type -p "$@" >/dev/null 2>&1 || $(CURL) "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

bundle: brew
	$< $@

.terminfo: terminfo-24bit
	$(TIC) -o "$HOME/$@" $<

install: .terminfo bundle

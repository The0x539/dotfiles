plug "kak-lsp/kak-lsp" do %{
	cargo install --locked --force --path .
} config %{
	set-option global lsp_hover_anchor true
	set-option global lsp_hover_max_lines 16

	hook global WinSetOption "filetype=(rust|go)" %{
		activate-lsp  %val{hook_param_capture_1}

		hook -once -always window WinSetOption filetype=.* %{
			deactivate-lsp %val{hook_param_capture_1}
		}
	}
}

# General routines for activating/deactivating LSP functionality
define-command -params 0..1 activate-lsp %{
	lsp-enable-window
	lsp-auto-signature-help-enable
	#lsp-inlay-diagnostics-enable window
	#lsp-auto-hover-enable

	hook window -group lsp BufWritePre .* lsp-formatting-sync
	map window user l %{: enter-user-mode lsp<ret>} -docstring "LSP mode"

	hook window -group lsp BufReload .* lsp-semantic-tokens
	hook window -group lsp NormalIdle .* lsp-semantic-tokens
	hook window -group lsp InsertIdle .* lsp-semantic-tokens

	try "activate-lsp-%arg{1}"
}

define-command deactivate-lsp -params 0..1  %{
	lsp-disable-window
	remove-hooks window lsp
	unmap window user l

	try "deactivate-lsp-%arg{1}"
}

# Filetype specific activation/deactivation routines
define-command -hidden activate-lsp-rust %{
	#set-option window aligntab false
	#set-option window indentwidth 4
	#hook window -group lsp BufReload .* rust-analyzer-inlay-hints
	#hook window -group lsp NormalIdle .* rust-analyzer-inlay-hints
	#hook window -group lsp InsertIdle .* rust-analyzer-inlay-hints
}

define-command -hidden deactivate-lsp-rust %{
	#set-option window aligntab true
	#set-option window indentwidth 0
}

hook global InsertCompletionShow .* %{
	try %{
		execute-keys -draft 'h<a-K>\h<ret>'
		map window insert <tab> <c-n>
		map window insert <s-tab> <c-p>
		hook -once -always window InsertCompletionHide .* %{
			map window insert <tab> <tab>
			map window insert <s-tab> <s-tab>
		}
	}
}

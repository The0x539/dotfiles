plug "kak-lsp/kak-lsp" do %{
	cargo build --release --locked
	cargo install --force --path .
} config %{
	set-option global lsp_hover_anchor true
	hook global WinSetOption filetype=rust %{
		lsp-enable-window
		#lsp-auto-hover-enable
		lsp-auto-signature-help-enable
		#lsp-inline-diagnostics-enable window

		set-option window aligntab false
		set-option window indentwidth 4

		hook window BufWritePre .* lsp-formatting-sync

		hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
		hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
		hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
		hook -once -always window WinSetOption filetype=.* %{
			remove-hooks window semantic-tokens
		}
	}
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

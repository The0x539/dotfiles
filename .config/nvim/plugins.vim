set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.config/nvim/dein')
	call dein#begin('~/.config/nvim/dein')
	
	for plugin in readfile($HOME . '/.config/nvim/plugins.txt')
		if strlen(plugin) > 0
			call dein#add(plugin)
		end
	endfor

	call dein#end()
	call dein#save_state()
end

lua <<EOF
	local lspconfig = require 'lspconfig'
	local completion = require 'completion'
	local function on_attach(client, bufnr)
		vim.wo.signcolumn = 'yes'
		completion.on_attach(client, bufnr)
	end

	local servers = {
		rust_analyzer = 'rust-analyzer',
		vimls = 'vim-language-server',
	}

	for module, server in pairs(servers) do
		local expr = string.format('executable(\'%s\')', server)
		if vim.api.nvim_eval(expr) ~= 0 then
			lspconfig[module].setup { on_attach = on_attach }
		end
	end
EOF

if dein#check_install()
	call dein#install()
end

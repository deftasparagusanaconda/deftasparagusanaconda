require("config.lazy")

function rm_temp_all()
	--	vim.cmd('terminal rm '..vim.g.temp_all)
	vim.fn.system("rm " .. vim.g.temp_all)
end

function execute()
	vim.cmd("w! " .. vim.g.temp)
	vim.cmd("!clear && chmod +x " .. vim.g.temp .. " && " .. vim.g.temp)
end

function nasm_compile()
	vim.cmd("w! " .. vim.g.temp .. ".asm")
	vim.cmd(
		"!clear && nasm -f elf64 "
			.. vim.g.temp
			.. ".asm -o "
			.. vim.g.temp
			.. ".o && ld -m elf_x86_64 -s -o"
			.. vim.g.temp
			.. " "
			.. vim.g.temp
			.. ".o"
	)
end

function nasm_compile_and_gdb_debug()
	vim.cmd("w! " .. vim.g.temp .. ".asm")
	vim.cmd(
		"!nasm -f elf64 "
			.. vim.g.temp
			.. ".asm -o "
			.. vim.g.temp
			.. ".o && ld -m elf_x86_64 -s -o"
			.. vim.g.temp
			.. " "
			.. vim.g.temp
			.. ".o && gdb "
			.. vim.g.temp
	)
end

function nasm_compile_and_run()
	vim.cmd("w! " .. vim.g.temp .. ".asm")
	vim.cmd(
		"!nasm -f elf64 "
			.. vim.g.temp
			.. ".asm -o "
			.. vim.g.temp
			.. ".o && ld -m elf_x86_64 -s -o"
			.. vim.g.temp
			.. " "
			.. vim.g.temp
			.. ".o && "
			.. vim.g.temp
	)
end

function clang_compile()
	vim.cmd("w! " .. vim.g.temp .. ".c")
	vim.cmd("!clear && clang " .. vim.g.temp .. ".c -Wall -lm -fsyntax-only")
end

function clang_compile_and_run()
	vim.cmd("w! " .. vim.g.temp .. ".c")
	vim.cmd("!clang " .. vim.g.temp .. ".c -Wall -lm -o " .. vim.g.temp .. ".out && " .. vim.g.temp .. ".out")
end

function gcc_compile()
	vim.cmd("w! " .. vim.g.temp .. ".c")
	vim.cmd("!clear && gcc " .. vim.g.temp .. ".c -Wall -lm -fsyntax-only")
end

function gcc_compile_and_run()
	vim.cmd("w! " .. vim.g.temp .. ".c")
	vim.cmd("!gcc " .. vim.g.temp .. ".c -Wall -lm -o " .. vim.g.temp .. ".out && " .. vim.g.temp .. ".out")
end

function clangpp_compile()
	vim.cmd("w! " .. vim.g.temp .. ".cpp")
	vim.cmd("!clear && clang++ " .. vim.g.temp .. ".cpp -Wall -fsyntax-only")
end

function clangpp_compile_and_run()
	vim.cmd("w! " .. vim.g.temp .. ".cpp")
	vim.cmd("!clang++ " .. vim.g.temp .. ".cpp -Wall -o " .. vim.g.temp .. ".out && " .. vim.g.temp .. ".out")
end

function gpp_compile()
	vim.cmd("w! " .. vim.g.temp .. ".cpp")
	vim.cmd("!clear && g++ " .. vim.g.temp .. ".cpp -Wall -fsyntax-only")
end

function gpp_compile_and_run()
	vim.cmd("w! " .. vim.g.temp .. ".cpp")
	vim.cmd("!g++ " .. vim.g.temp .. ".cpp -Wall -o " .. vim.g.temp .. ".out && " .. vim.g.temp .. ".out")
end

function rustc_compile()
	vim.cmd("w! " .. vim.g.temp .. ".rs")
	vim.cmd("!clear && rustc " .. vim.g.temp .. ".rs -o " .. vim.g.temp .. ".out")
end

function rustc_compile_and_run()
	vim.cmd("w! " .. vim.g.temp .. ".rs")
	vim.cmd("!rustc " .. vim.g.temp .. ".rs -o " .. vim.g.temp .. ".out && " .. vim.g.temp .. ".out")
end

-- implement java direct source compilation, .java > javac > exec pipeline, jshell redirect pipelines
function javac_compile()
	vim.cmd("w! " .. vim.g.temp .. ".java")
	vim.cmd("!javac " .. vim.g.temp .. ".java")
end

function java_run()
	vim.cmd("w! " .. vim.g.temp .. ".java")
	vim.cmd("!java " .. vim.g.temp .. ".java")
end

function javac_compile_and_run()
	vim.cmd("w! " .. vim.g.temp .. ".java")
	vim.cmd("!javac " .. vim.g.temp .. ".java && java " .. vim.g.temp)
end

function jshell()
	-- incomplete implementation
	vim.cmd("!jshell")
end

function python3_run()
	vim.cmd("w! " .. vim.g.temp .. ".py")
	vim.cmd(string.format("terminal env PYTHONPATH=%s python3 %s", vim.fn.getcwd(), vim.g.temp .. ".py"))
	vim.api.nvim_feedkeys("i", "n", false)
end

function python3_compile()
	vim.cmd("w! " .. vim.g.temp .. ".py")
	vim.cmd(string.format("terminal env PYTHONPATH=%s python3 -m py_compile %s", vim.fn.getcwd(), vim.g.temp .. ".py"))
	vim.api.nvim_feedkeys("i", "n", false)
end

function python3_compile()
	vim.cmd("w! " .. vim.g.temp .. ".py")
	vim.cmd(
		string.format("terminal env PYTHONPATH=%s python3 -i -m py_compile %s", vim.fn.getcwd(), vim.g.temp .. ".py")
	)
	vim.api.nvim_feedkeys("i", "n", false)
end

function python3_run_interactive()
	vim.cmd("w! " .. vim.g.temp .. ".py")
	vim.cmd(string.format("terminal env PYTHONPATH=%s python3 -i %s", vim.fn.getcwd(), vim.g.temp .. ".py"))
	vim.api.nvim_feedkeys("i", "n", false)
end

function open_in_GUI()
	vim.cmd("w! " .. vim.g.temp)
	vim.cmd("silent !gnome-text-editor " .. vim.g.temp)
end

function toggle_color()
	vim.o.color = (vim.o.color == "koehler") and "quiet" or "koehler"
end

function toggle_background()
	if vim.g.enable_background then
		vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
		vim.g.enable_background = false
	else
		vim.cmd("highlight Normal guibg=black ctermbg=black")
		vim.g.enable_background = true
	end
end

function toggle_scrolloff()
	vim.o.scrolloff = (vim.o.scrolloff == 99) and 0 or 99
	vim.o.sidescrolloff = (vim.o.sidescrolloff == 99) and 0 or 99
	vim.api.nvim_feedkeys("zz", "n", false)
end

function toggle_helpers()
	vim.o.relativenumber = not vim.o.relativenumber
	vim.o.cursorcolumn = not vim.o.cursorcolumn
	vim.o.cursorline = not vim.o.cursorline
	vim.o.number = not vim.o.number
	vim.o.spell = not vim.o.spell
	vim.o.list = not vim.o.list
	vim.o.wrap = not vim.o.wrap
	vim.o.colorcolumn = (vim.o.colorcolumn == "80") and "0" or "80"
	vim.o.foldcolumn = (vim.o.foldcolumn == "4") and "0" or "4"
	vim.o.cmdheight = (vim.o.cmdheight == 1) and 0 or 1
	vim.o.showbreak = (vim.o.showbreak == "↪") and "" or "↪"
	--vim.cmd("call clearmatches()")
end

function toggle_wrap()
	vim.o.wrap = not vim.o.wrap
end

-- to see what keycode a key maps to, use ctrl + v in insert mode and press your keys

-- shift + space inserts four spaces
vim.keymap.set({ "n", "i" }, "<S-Space>", "<Space><Space><Space><Space>")

--vim.keymap.set({'n', 'i'}, '<C-A-Up>', '<Up><Up>')
--vim.keymap.set({'n', 'i'}, '<C-A-Down>', '<Down><Down>')
--vim.keymap.set({'n', 'i'}, '<C-A-Left>', '<Left><Left>')
--vim.keymap.set({'n', 'i'}, '<C-A-Right>', '<Right><Right>')

-- jump movements with ctrl + arrow keys
vim.keymap.set("i", "<C-Left>", "<C-o>b")
vim.keymap.set("i", "<C-Right>", "<C-o>e<Right>")
vim.keymap.set("i", "<C-Up>", "<C-o>zk")
vim.keymap.set("i", "<C-Down>", "<C-o>zj")
vim.keymap.set("n", "<C-Left>", "b")
vim.keymap.set("n", "<C-Right>", "e<Right>")
vim.keymap.set("n", "<C-Up>", "zk")
vim.keymap.set("n", "<C-Down>", "zj")

-- scrolling with alt + arrow keys
vim.keymap.set("i", "<A-Up>", "<C-o><C-y><Up>")
vim.keymap.set("i", "<A-Down>", "<C-o><C-e><Down>")
vim.keymap.set("i", "<A-Left>", "<C-o>zh<Left>")
vim.keymap.set("i", "<A-Right>", "<C-o>zl<Right>")
vim.keymap.set("n", "<A-Up>", "<C-y><Up>")
vim.keymap.set("n", "<A-Down>", "<C-e><Down>")
vim.keymap.set("n", "<A-Left>", "zh<Left>")
vim.keymap.set("n", "<A-Right>", "zl<Right>")

-- move line or letter with shift + alt + arrow keys
vim.keymap.set({ "n", "i" }, "<S-A-Up>", "<C-o>dd<Up><C-o>P")
vim.keymap.set({ "n", "i" }, "<S-A-Down>", "<C-o>dd<C-o>p")
vim.keymap.set({ "n", "i" }, "<S-A-Left>", "<C-o>X<C-o>p<Left><Left>")
vim.keymap.set({ "n", "i" }, "<S-A-Right>", "<C-o>X<C-o>p")

-- visual mode with shift + arrow keys
vim.keymap.set("i", "<S-Up>", "<Esc>v<Up><Right>")
vim.keymap.set("i", "<S-Down>", "<Esc><Right>v<Down><Left>")
vim.keymap.set("i", "<S-Left>", "<Esc>v")
vim.keymap.set("i", "<S-Right>", "<Esc><Right>v")
vim.keymap.set("n", "<S-Up>", "v<Up>")
vim.keymap.set("n", "<S-Down>", "v<Down>")
vim.keymap.set("n", "<S-Left>", "v<Left>")
vim.keymap.set("n", "<S-Right>", "v<Right>")
vim.keymap.set("v", "<S-Up>", "<Up>")
vim.keymap.set("v", "<S-Down>", "<Down>")
vim.keymap.set("v", "<S-Left>", "<Left>")
vim.keymap.set("v", "<S-Right>", "<Right>")
vim.keymap.set("v", "<Up>", "<Esc>i<Up>")
vim.keymap.set("v", "<Down>", "<Esc>i<Down><Right>")
vim.keymap.set("v", "<Left>", "<Esc>i<Left>")
vim.keymap.set("v", "<Right>", "<Esc>i<Right><Right>")

-- move line or letter with shift + alt + arrow keys
--vim.keymap.set({'n', 'i'}, '<S-A-Up>', '<C-o>dd<Up><C-o>P')
--vim.keymap.set({'n', 'i'}, '<S-A-Down>', '<C-o>dd<C-o>p')
--vim.keymap.set({'n', 'i'}, '<S-A-Left>', '<C-o>X<C-o>p<Left><Left>')
--vim.keymap.set({'n', 'i'}, '<S-A-Right>', '<C-o>X<C-o>p')

-- enable ctrl + del to delete a word to the end
vim.keymap.set("i", "<C-del>", "<C-o>de", { noremap = true })

vim.keymap.set({ "n", "i" }, "<F3>", clang_compile)
vim.keymap.set({ "n", "i" }, "<F27>", clang_compile_and_run)
vim.keymap.set({ "n", "i" }, "<F15>", gcc_compile)
vim.keymap.set({ "n", "i" }, "<F39>", gcc_compile_and_run)
vim.keymap.set({ "n", "i" }, "<F4>", clangpp_compile)
vim.keymap.set({ "n", "i" }, "<F28>", clangpp_compile_and_run)
vim.keymap.set({ "n", "i" }, "<F16>", gpp_compile)
vim.keymap.set({ "n", "i" }, "<F40>", gpp_compile_and_run)
vim.keymap.set({ "n", "i" }, "<F5>", javac_compile)
vim.keymap.set({ "n", "i" }, "<F17>", java_run)
vim.keymap.set({ "n", "i" }, "<F29>", javac_compile_and_run)
vim.keymap.set({ "n", "i" }, "<F41>", jshell)
--vim.keymap.set({'n', 'i'}, '<F6>', ghc_compile)
vim.keymap.set({ "n", "i" }, "<F10>", python3_compile)
vim.keymap.set({ "n", "i" }, "<F34>", python3_run)
vim.keymap.set({ "n", "i" }, "<F46>", python3_run_interactive)
vim.keymap.set("n", "<S-h>", toggle_helpers)
vim.keymap.set("n", "<S-c>", toggle_color)
vim.keymap.set("n", "<S-b>", toggle_background)
vim.keymap.set("n", "<S-s>", toggle_scrolloff)
vim.keymap.set("n", "<S-w>", toggle_wrap)
vim.keymap.set("n", "<C-i>", open_in_GUI)
vim.keymap.set("n", "<S-t>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
--vim.keymap.set('i', '<C-h>', '<C-W>', {noremap=true})

vim.cmd(
	"noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>"
)
--vim.keymap.set("i", "<S-Space>", function()
--  local spaces = string.rep(" ", vim.o.shiftwidth)
--  vim.api.nvim_put({ spaces }, "c", true, true)
--end)

vim.g.temp = "/mnt/tmpfs/temp"
vim.g.temp_all = "/mnt/tmpfs/temp*"
vim.g.virtual_python = "/home/daa/vpyton2/bin/python3"

--enable_helpers = false
--enable_color = true
vim.g.enable_background = false

vim.o.number = false
vim.o.relativenumber = false
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "↪"
vim.o.smarttab = true
vim.o.colorcolumn = "0"
--vim.o.mouse = a

vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.softtabstop = 0

--vim.o.textwidth = 80
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99
--vim.o.backspace = indent,eol,start
--vim.o.showmode = false
vim.o.ruler = true
vim.o.laststatus = 1
vim.o.cmdheight = 0
vim.o.numberwidth = 4
vim.o.scrolloff = 0
vim.o.scroll = 1
--vim.o.sidescrolloff = 0
vim.o.lazyredraw = true
vim.o.showcmd = true
vim.o.list = false
vim.o.termguicolors = true
vim.o.foldcolumn = "0"

--vim.cmd("filetype plugin off")
vim.cmd("syntax on")
vim.cmd("highlight ExtraWhitespace guibg=red ctermbg=red")
vim.cmd("highlight VertSplit guifg=#ffffff guibg=NONE")
vim.cmd("highlight StatusLine guifg=#ffffff guibg=#000000")
vim.cmd("highlight StatusLineNC guifg=#ffffff guibg=#000000")
--vim.cmd("colorscheme catppuccin-mocha")
--vim.cmd("colorscheme tokyonight-night")
vim.cmd("colorscheme catppuccin-latte")
--vim.cmd('colorscheme koehler')
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("autocmd BufRead,BufNewFile * start")
--vim.cmd('set whichwrap=<,>,[,]')

-- use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- set cursor style for various modes
--vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve:hor20,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor-'

vim.api.nvim_create_autocmd("TermClose", {
	pattern = "*",
	callback = function(args)
		local bufnr = args.buf
		local exit_status = vim.b[bufnr].terminal_job_exit_status
		--if exit_status == 0 then
		--	vim.schedule(function()
		--		vim.api.nvim_buf_delete(bufnr, { force = true })
		--	end)
		--end
	end,
})

--filetype off
--filetype indent off
--filetype plugin off
--[[
require("catppuccin").setup({
	flavour = "mocha",
	highlight_overrides = {
		mocha = function(p)
			return {
				["@function"] = { fg = p.blue },
				["@function.call"] = { fg = p.sky },
				["@function.builtin"] = { fg = p.lavender },
				["@variable.parameter"] = { fg = p.maroon },
				["@property"] = { fg = p.teal },
				["@type"] = { fg = p.yellow },
				["@constructor"] = { fg = p.flamingo },
				["@keyword"] = { fg = p.peach },
				["@number"] = { fg = p.teal },
				["@boolean"] = { fg = p.peach },
				["@comment"] = { fg = p.overlay2, italic = true },
			}
		end,
	},
})
]]

require("auto-dark-mode").setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.cmd("colorscheme catppuccin-mocha")
	end,
	set_light_mode = function()
		vim.cmd("colorscheme catppuccin-latte")
	end,
})

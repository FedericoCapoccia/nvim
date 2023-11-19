local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 0,
	conceallevel = 0,
	hlsearch = true,
	ignorecase = false,
	mouse = "a",
	showmode = true,
	showtabline = 2,
	number = true,
	relativenumber = true,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	undofile = true,
	updatetime = 300,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 8,
    termguicolors = true,
}

for option, value in pairs(options) do
	vim.opt[option] = value 
end

-- Providers --
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0


vim.opt.shortmess:append "c"
vim.cmd [[set iskeyword+=-]]

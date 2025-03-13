local autocmd = vim.api.nvim_create_autocmd

-- Makefiles require hard tabs
autocmd("FileType", {
	pattern = "make",
	command = "setlocal noexpandtab softtabstop=0",
})

-- And so does NASM
autocmd("FileType", {
	pattern = "asm",
	command = "setlocal noexpandtab softtabstop=0 syntax=nasm",
})

autocmd("FileType", {
	pattern = { "java", "groovy" },
	command = "setlocal tabstop=4 shiftwidth=4",
})

-- Git commit line-length limit
autocmd("FileType", {
	pattern = "gitcommit",
	command = "setlocal textwidth=72",
})

-- Using Scheme highlighting for Racket
autocmd("BufReadPost", {
	pattern = { "*.rkt", "*.rktl", "*.rktd" },
	command = "set filetype=scheme",
})

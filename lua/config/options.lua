local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.encoding = "utf-8"
opt.visualbell = true
opt.scrolloff = 5
opt.fillchars = { eob = " " }
vim.g.floaterm_width = 0.95   -- 95% of screen width
vim.g.floaterm_height = 0.9   -- 90% of screen height


opt.laststatus = 3  -- for avante

if vim.fn.has("termguicolors") == 1 then
  opt.termguicolors = true
end


vim.diagnostic.config({
    virtual_text = {
        spacing = 2,
        prefix = "●", -- or "→", "✗", etc.
    },
})

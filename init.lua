-- Main configuration entry point
-- Load core configuration
require('config.options')
require('config.lazy')
require('config.theme')
require('config.autocmds')
require('config.keymaps')
require('config.lsp')
require('config.completion')
-- Telescope config is loaded by the plugin itself
require('config.commands')

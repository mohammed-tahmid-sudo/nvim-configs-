# Telescope Setup for Neovim

Telescope has been successfully added to your Neovim configuration with comprehensive keymaps and settings.

## Features Added

### Core Telescope Configuration
- **telescope.nvim**: Main fuzzy finder
- **telescope-fzf-native.nvim**: Fast native FZF sorting for better performance
- **nvim-web-devicons**: File icons in telescope pickers

### Telescope Pickers Configured
- **find_files**: Search for files in your project
- **live_grep**: Search for text across all files
- **buffers**: Switch between open buffers
- **oldfiles**: Access recently opened files
- **help_tags**: Search Neovim help documentation
- **keymaps**: Browse all available keymaps
- **commands**: Search available commands
- **grep_string**: Search for word under cursor

### Key Mappings

#### Quick Access (Direct)
- `Ctrl+p`: Find files
- `Ctrl+f`: Live grep (search in files)
- `Ctrl+b`: Switch buffers

#### Leader Key Mappings

**File Operations (`<leader>f`)**
- `<leader>ff`: Find files
- `<leader>fr`: Recent files
- `<leader>fn`: New file
- `<leader>fg`: Live grep
- `<leader>fw`: Find word under cursor

**Search Operations (`<leader>s`)**
- `<leader>sf`: Search files
- `<leader>sg`: Search by grep
- `<leader>sw`: Search word
- `<leader>sh`: Search help
- `<leader>sk`: Search keymaps
- `<leader>sc`: Search commands
- `<leader>sr`: Resume last search

**Buffer Operations (`<leader>b`)**
- `<leader>bb`: Switch buffer with telescope
- `<leader>bl`: List buffers
- `<leader>bn`: Next buffer
- `<leader>bp`: Previous buffer
- `<leader>bd`: Delete buffer

### Telescope Navigation

**In Insert Mode:**
- `Ctrl+k`: Move selection up
- `Ctrl+j`: Move selection down
- `Ctrl+q`: Send selected items to quickfix list
- `Esc`: Close telescope

**In Normal Mode:**
- `Ctrl+q`: Send selected items to quickfix list

### Custom Settings
- **Prompt**: 🔍 search prompt with nice arrow selection
- **File Filtering**: Ignores common directories like node_modules, .git, build, etc.
- **Themes**: 
  - `find_files`: Dropdown theme without preview
  - `live_grep`: Ivy theme with preview
  - `buffers`: Dropdown theme, starts in normal mode
- **Hidden Files**: Included in file searches
- **FZF Integration**: Fast native sorting enabled

## Usage Tips

1. **Finding Files**: Use `Ctrl+p` or `<leader>ff` to quickly open files
2. **Text Search**: Use `Ctrl+f` or `<leader>sg` to search for text across your project
3. **Buffer Switching**: Use `Ctrl+b` or `<leader>bb` for quick buffer switching
4. **Resume Search**: Use `<leader>sr` to continue your last telescope search
5. **Help**: Use `<leader>sh` to search through Neovim help documentation

## Troubleshooting

If telescope seems slow, make sure:
1. The FZF native extension is properly compiled
2. Run `:checkhealth telescope` in Neovim to verify setup
3. Restart Neovim after installation

Enjoy your enhanced Neovim experience with Telescope! 🚀


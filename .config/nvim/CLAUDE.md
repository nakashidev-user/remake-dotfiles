# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a personal Neovim configuration built on LazyVim framework:

- **Package Manager**: Lazy.nvim with LazyVim as the base distribution
- **Configuration Structure**: Modular Lua-based configuration following LazyVim conventions
- **Entry Point**: `init.lua` loads `config.lazy` which bootstraps the plugin system
- **Plugin Organization**: Plugins are organized in `lua/plugins/` by category (ai, coding, editor, ui, etc.)

## Core Configuration Files

- `lua/config/lazy.lua` - Plugin manager setup and LazyVim configuration
- `lua/config/options.lua` - Editor options and vim settings
- `lua/config/keymaps.lua` - Custom key bindings
- `lua/plugins/` - Plugin specifications and configurations

## Commonly Used Commands

### Code Formatting
```bash
# Format Lua code using stylua
stylua . --config-path=stylua.toml
```

### Plugin Management
```bash
# Start Neovim and use Lazy.nvim commands
nvim
:Lazy sync    # Update all plugins
:Lazy clean   # Remove unused plugins
:Lazy check   # Check for plugin updates
```

## Key Features & Plugins

### AI Integration
- **Claude Code**: Integrated via `lua/plugins/ai.lua` with keymaps `<leader>ac` (toggle), `<leader>as` (send to Claude)
- **toggleterm.nvim**: Full-screen floating terminal with Claude Code integration (`<C-n>` to toggle)

### Editor Enhancements
- **Telescope**: Fuzzy finder with custom keymaps (`;f` files, `;r` grep, `\\` buffers)
- **nvim-tree**: File explorer (`<C-o>` to toggle)
- **Tmux Integration**: Seamless navigation between tmux panes and Neovim

### UI Customization
- **Theme**: Solarized Osaka as primary colorscheme
- **Status Line**: Custom lualine configuration
- **Dashboard**: Custom "HELLO WORLD!" ASCII art welcome screen

## Development Workflow

### File Navigation
- `;f` - Find files (respects .gitignore)
- `;r` - Live grep search
- `sf` - File browser in current buffer directory
- `<C-o>` - Toggle file tree

### Terminal Integration
- `<C-n>` - Toggle full-screen floating terminal (optimized for Claude Code)
- `<C-\>` - Standard toggleterm mapping

### Window Management
- `ss` - Horizontal split
- `sv` - Vertical split
- `sh/sk/sj/sl` - Navigate between windows

## Custom Settings

- **Indentation**: 2 spaces for all files
- **Shell**: Fish shell configured as default
- **Line Numbers**: Enabled
- **Mouse**: Disabled for keyboard-focused workflow
- **Leader Key**: Space character

## ジャーナルログ

変更点を`./docs/`にMarkdown形式で格納してきたい。
`./docs/`ディレクトリが存在しない場合、作成してください。

## 保存形式

## Log: <task title>
- **Prompt**: <受け取った指示>
- **Issue**: <課題の内容>

### What I did: <やったことの要約>
...

### How I did it: <どうやって解決したか>
...

### What were challenging: <難しかったこと>
...

### Future work (optional)
- <今後の改善案など>

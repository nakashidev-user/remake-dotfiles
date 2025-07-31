# 個人用dotfiles

macOS開発環境の設定

## 構成

### エディタ
- **Neovim**: LazyVim基盤で使用
  - Package manager: Lazy.nvim
  - ベースディストリビューション: LazyVim
  - AI: Claude Code との連携
  - テーマ: Solarized Osaka

### ターミナル・シェル
- **Fish Shell**: モダンなシェル環境
  - 豊富なエイリアス設定
  - 開発ツール統合
  - カスタムスクリプト
- **WezTerm**: ターミナルエミュレータ
- **Tmux**: ターミナルマルチプレクサ
  - vim風キーバインド
  - Neovimとのシームレス連携

### ツール
- **Lazygit**: Git TUI
  - カスタムテーマ
- **Raycast**: macOS ランチャー
  - 拡張機能設定


### 必要なパッケージ
```bash
# 基本ツール
brew install fish neovim tmux lazygit eza fzf

# 開発言語
brew install node go python3 rust

# その他
brew install --cask wezterm raycast
```

## カスタマイズ

各設定ファイルは用途別に整理されています：

```
.config/
├── fish/           # Fish shell設定
├── nvim/           # Neovim設定
├── wezterm/        # WezTerm設定
├── lazygit/        # Lazygit設定
└── raycast/        # Raycast設定
```

## 開発ワークフロー

1. **コード編集**: Neovim + Claude Code
2. **ターミナル作業**: Fish + WezTerm + Tmux
3. **Git操作**: Lazygit
4. **アプリ起動**: Raycast(ショートカットキーでweztermを開く)

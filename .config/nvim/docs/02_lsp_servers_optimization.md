# Log: LSPサーバーの最適化

- **Prompt**: 使用していない言語のLSPサーバーを削除して軽量化
- **Issue**: 多数のLSPサーバーが設定されており、使用しない言語のサーバーがメモリとCPUリソースを消費している

## What I did: 不要なLSPサーバーと関連設定の削除

`lua/plugins/lsp.lua`から使用頻度の低い言語のLSPサーバーとフォーマッター設定を削除し、コア機能のみを残しました。

## How I did it: 具体的な変更内容

### 削除したLSPサーバー
- `elixirls`: Elixir言語サーバー（設定も含む）
- `cssls`: CSS言語サーバー
- `tailwindcss`: TailwindCSS言語サーバー
- `html`: HTML言語サーバー

### 削除したフォーマッター設定
- `["html.tpl"]`: HTML template files
- `["terraform"]`: Terraform files
- `["tf"]`: Terraform files
- `["elixir"]`: Elixir files
- `["css"]`: CSS files
- `["scss"]`: SCSS files

### 削除したMason ensure_installed
- `"selene"`: Lua linter
- `"luacheck"`: Lua linter
- `"shellcheck"`: Shell script linter
- `"shfmt"`: Shell script formatter
- `"tailwindcss-language-server"`: TailwindCSS server
- `"css-lsp"`: CSS language server

### 残したコア機能
- `lua_ls`: Lua language server（Neovim設定に必須）
- `tsserver`: TypeScript/JavaScript language server（Web開発）
- `eslint`: JavaScript/TypeScript linter
- `yamlls`: YAML language server（設定ファイル用）
- `stylua`: Lua formatter（Neovim設定に必須）
- `typescript-language-server`: TypeScript server（Mason install用）

## What were challenging: 削除判断の根拠

### 削除対象の選定基準
1. **使用頻度**: 日常的に使用しない言語のサーバーを削除
2. **必要性**: Neovim設定（Lua）とWeb開発（TS/JS）のみを残す
3. **リソース効率**: メモリとCPU使用量を最小化

### 保持理由
- **lua_ls**: Neovim設定ファイルの編集に必須
- **tsserver**: 現代の開発で頻繁に使用
- **eslint**: コード品質維持に重要
- **yamlls**: 設定ファイル（Docker、CI/CD等）で使用頻度が高い

### 削除による効果
- **メモリ使用量削減**: 不要なLSPサーバーの常駐メモリを削減
- **起動時間短縮**: 初期化するサーバー数の削減
- **設定の簡素化**: メンテナンスコストの削減

## Future work
- 必要に応じて特定のプロジェクトで言語サーバーを一時的に追加
- プロジェクト固有の`.nvim.lua`設定でLSPサーバーを動的に追加
- 使用頻度が高くなった言語については適宜追加を検討

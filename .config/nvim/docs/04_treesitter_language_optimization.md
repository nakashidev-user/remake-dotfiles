# Log: Treesitterの言語パーサー最適化

- **Prompt**: 使用していない言語パーサーを削除してストレージとメモリを節約
- **Issue**: 多数の言語パーサーが自動インストールされており、使用しない言語分のリソースを消費している

## What I did: 不要な言語パーサーの削除

`lua/plugins/treesitter.lua`の`ensure_installed`設定を最適化し、実際に使用する言語のみを残しました。

## How I did it: 具体的な変更内容

### 削除した言語パーサー
- `"astro"`: Astro framework
- `"cmake"`: CMake build system
- `"cpp"`: C++ language
- `"css"`: CSS stylesheets
- `"go"`: Go language
- `"graphql"`: GraphQL query language
- `"http"`: HTTP requests
- `"java"`: Java language
- `"php"`: PHP language
- `"rust"`: Rust language
- `"scss"`: SCSS stylesheets
- `"sql"`: SQL database language
- `"svelte"`: Svelte framework
- `"elixir"`: Elixir language (config関数内からも削除)
- `"heex"`: Phoenix LiveView templates
- `"eex"`: Elixir templates

### 残した言語パーサー
- `"lua"`: Neovim設定言語（必須）
- `"luadoc"`: Lua documentation
- `"javascript"`: JavaScript language
- `"typescript"`: TypeScript language
- `"json"`: JSON configuration files
- `"yaml"`: YAML configuration files
- `"markdown"`: Documentation files
- `"gitignore"`: Git ignore files
- `"fish"`: Fish shell（設定で使用）

### 変更したファイル
- `lua/plugins/treesitter.lua:7-17`: ensure_installedリストの最適化
- `lua/plugins/treesitter.lua:57`: Elixir関連の追加設定削除

## What were challenging: 最適化の判断基準

### 保持した言語の選定理由
1. **Lua系**: Neovim設定に必須
2. **JavaScript/TypeScript**: 現代のWeb開発で頻繁に使用
3. **JSON/YAML**: 設定ファイルで頻繁に使用
4. **Markdown**: ドキュメント作成で使用
5. **Git関連**: バージョン管理で使用
6. **Fish**: シェル設定で使用

### 削除した言語の判断基準
- **使用頻度**: 日常的に使用しない言語
- **プロジェクト依存**: 特定のプロジェクトでのみ使用する言語
- **学習コスト**: 現在使用していない言語

### 最適化による効果
- **ストレージ削減**: 不要な言語パーサーファイルの削除
- **メモリ削減**: パーサーの読み込みメモリ削減
- **起動時間短縮**: 初期化するパーサー数の削減
- **更新時間短縮**: TreeSitterの更新時間短縮

### 動的追加の仕組み
- 削除した言語でも、実際にファイルを開いた時にTreeSitterが自動的にパーサーをインストール
- 必要に応じて`:TSInstall <language>`コマンドで手動インストール可能

## Future work
- 新しい言語を学習する際は、必要に応じて`ensure_installed`に追加
- プロジェクト固有の言語パーサーは、プロジェクトローカルで管理
- 使用頻度の変化に応じて定期的に見直し
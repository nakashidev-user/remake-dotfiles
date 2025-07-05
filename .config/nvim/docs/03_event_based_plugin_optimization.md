# Log: イベントベースのプラグイン読み込み最適化

- **Prompt**: プラグインの読み込みタイミングを最適化して起動時間を短縮
- **Issue**: `event = "VeryLazy"`で読み込まれるプラグインが多く、使用しない場合でもメモリを消費している

## What I did: プラグインの読み込みトリガーを最適化

プラグインの読み込みを`event = "VeryLazy"`から`keys`や`cmd`ベースの読み込みに変更し、実際に使用する時のみ読み込むようにしました。

## How I did it: 具体的な変更内容

### 1. toggleterm.nvim の最適化
**変更前:**
```lua
{
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
```

**変更後:**
```lua
{
  "akinsho/toggleterm.nvim",
  keys = {
    { "<c-\\>", desc = "Toggle terminal" },
    { "<C-n>", desc = "Toggle Claude Code terminal" },
  },
```

### 2. neoscroll.nvim の最適化
**変更前:**
```lua
{
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  opts = {},
},
```

**変更後:**
```lua
{
  "karb94/neoscroll.nvim",
  keys = {
    { "<C-u>", desc = "Scroll up" },
    { "<C-d>", desc = "Scroll down" },
  },
  opts = {},
},
```

### 3. nvim-notify の最適化
**変更前:**
```lua
{
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    timeout = 3000,
  },
},
```

**変更後:**
```lua
{
  "rcarriga/nvim-notify",
  cmd = "Notify",
  opts = {
    timeout = 3000,
  },
},
```

### 4. bufferline.nvim の最適化
**変更前:**
```lua
{
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
```

**変更後:**
```lua
{
  "akinsho/bufferline.nvim",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
```

## What were challenging: 最適化の判断基準

### 読み込みタイミングの選択理由
1. **toggleterm.nvim**: キーマップが定義されているため、`keys`での読み込みが最適
2. **neoscroll.nvim**: スクロール操作時のみ必要なため、`keys`での読み込みが適切
3. **nvim-notify**: コマンド実行時のみ必要なため、`cmd`での読み込みが効率的
4. **bufferline.nvim**: タブ操作時のみ必要なため、`keys`での読み込みが適切

### 最適化による効果
- **起動時間短縮**: 初期読み込みプラグイン数の削減
- **メモリ効率**: 使用しない機能のメモリ使用量削減
- **レスポンス向上**: 必要な時のみ読み込むため、システムリソースの効率化

### 保持した設定
- `incline.nvim`: `event = "VeryLazy"`を保持（常時表示のUIコンポーネントのため）
- `noice.nvim`: デフォルトの読み込みタイミングを保持（コマンドラインUIのため）

## Future work
- 他のプラグインでも同様の最適化を検討
- 実際の使用パターンを監視して、さらなる最適化ポイントを特定
- プラグインの依存関係を考慮した読み込み順序の最適化
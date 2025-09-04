# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

これはAeroSpace（macOS用のタイル型ウィンドウマネージャー）の設定ディレクトリです。主要な設定ファイルは`aerospace.toml`で、ウィンドウの配置、キーバインド、ワークスペース管理などの動作を定義しています。

## Configuration Structure

- `aerospace.toml`: メイン設定ファイル
  - 起動時コマンド（borders、sketchybarの実行）
  - レイアウト設定（tiles/accordion）
  - ギャップとパディング設定
  - キーバインド（Altキーベースのvim風操作）
  - ワークスペース設定（1-9、A-Z）
  - サービスモード設定

## Key Configuration Areas

### Window Management
- デフォルトレイアウト: tiles
- ギャップ設定: inner 10px、outer 5px
- 特定モニター（KG251Q）で上部ギャップ40px

### Keybindings
- フォーカス移動: `alt-h/j/k/l` (vim風)
- ウィンドウ移動: `alt-shift-h/j/k/l`
- ワークスペース切り替え: `alt-1～9` および `alt-a～z`
- レイアウト切り替え: `alt-/` (tiles), `alt-,` (accordion)
- サービスモード: `alt-shift-;`

### External Dependencies
- borders: ウィンドウ境界表示
- sketchybar: ステータスバー

## Development Commands

設定の検証:
```bash
# AeroSpaceの設定をリロード
# サービスモード（alt-shift-;）でEscキーを押すか、以下を実行
aerospace reload-config
```

## Configuration Best Practices

- 設定変更後は必ずリロードして動作確認する
- キーバインドの競合を避けるため、macOSのシステムショートカットと重複しないよう注意
- ワークスペース名は用途に応じて適切に選択（数字は一般用途、文字は特定用途）
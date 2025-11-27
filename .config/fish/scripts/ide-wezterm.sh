#!/bin/bash

# set wezterm panes for ide

function getPaneId() {
  wezterm cli list --format json | jq "[.[] | select(.tab_title | contains(\"$1\"))] | first | .pane_id"
}

function getLastPaneId() {
  wezterm cli list --format json | jq '.[-1].pane_id'
}

if [ "$#" -eq 0 ]; then
  # デフォルト: 4ペイン構成
  # メインペインを右に分割 (60:40の比率)
  wezterm cli split-pane --right --percent 40
  
  # 左側ペインを下に分割 (70:30の比率)  
  wezterm cli split-pane --bottom --percent 30
  
  # 左下ペインを右に分割 (50:50の比率)
  wezterm cli split-pane --right --percent 50
  
  clear
else
  case $1 in
    0)
      # シンプルな2ペイン構成 (60:40の比率)
      wezterm cli split-pane --right --percent 40
      clear
      ;;
    1)
      # 4ペイン構成: 下分割 → 下を右分割 → 右を右分割
      wezterm cli split-pane --bottom --percent 30
      
      # 下ペインを右に分割 (70:30の比率)
      BOTTOM_PANE=$(getLastPaneId)
      wezterm cli split-pane --right --percent 30 --pane-id $BOTTOM_PANE
      
      # 右ペインをさらに右に分割 (50:50の比率)
      RIGHT_PANE=$(getLastPaneId)
      wezterm cli split-pane --right --percent 50 --pane-id $RIGHT_PANE
      
      clear
      ;;
    2)
      # 4ペイン構成: 右分割 → 左を下分割 → 右を下分割
      wezterm cli split-pane --right --percent 70
      
      # 左ペインを下に分割
      # 最初のペイン（左ペイン）のIDを取得する必要がある
      # weztermでは現在のペインを参照するのが困難なため、別のアプローチを使用
      LEFT_PANE=$(wezterm cli list --format json | jq '.[0].pane_id')
      wezterm cli split-pane --bottom --percent 50 --pane-id $LEFT_PANE
      
      # 右ペインを下に分割
      RIGHT_PANE=$(getLastPaneId)
      wezterm cli split-pane --bottom --percent 50 --pane-id $RIGHT_PANE
      
      clear
      ;;
    go)
      cd ~/go/src
      
      # 3ペイン構成: 下分割 → 右分割
      wezterm cli split-pane --bottom --percent 30
      
      # 下ペインを右に分割
      BOTTOM_PANE=$(getLastPaneId)
      wezterm cli split-pane --right --percent 50 --pane-id $BOTTOM_PANE
      
      clear
      ;;
    *)
      echo [ERROR] \"$1\" は設定されていない引数です。
      ;;
  esac
fi
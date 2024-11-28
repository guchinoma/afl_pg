# Build image
$ sh build_afl_pg
then make required software
(try to automatically set up using Dockerfile, but gave up, for make cannot work well)
after that we need to make afl(make distrib, make install), neovim(command 1, command 2).
see https://zenn.dev/chot/articles/72bc7dfbec3b33

~~~
$ cd AFLplusplus
$ make distrib && make install
$ cd .. && cd neovim
$ make CMAKE_BUILD_TYPE=RelWithDebInfo && make install
$ exec $SHELL -l
~~~

in file .config/nvim/init.lua, add code below to erase swapfile.

~~~
local opt = vim.opt
opt.swapfile = false
~~~

and write down in .tmux.conf file below

~~~
$nvim ~/.tmux.conf
~~~

~~~
# prefixキーをC-aに変更する
set -g prefix C-d

# デフォルトでprefix がC-b になっているので、そのキーバインドを解除する
unbind C-b

# | でペインを縦に分割する
bind | split-window -h

# - でペインを横に分割する
bind - split-window -v

# ウィンドウの一覧を表示します．
bind w choose-tree -Zw

# 次のペインに移動
bind Tab select-pane -t :.+

# キーバインドの一覧を表示します．リストはC-n，C-pで移動できます．
bind ? list-keys

# prefix + rで設定ファイルをリロードする。.tmux.conf を変更したらリロード！
bind r source-file ~/.tmux.conf \; display "Reloaded!"


### ここから下の説明は割愛 ###
# キーストロークのディレイを減らす
set -g escape-time 1

# ウィンドウのインデックスを1から始める
# set -g base-index 1

# ペインのインデックスを1から始める
# set -g pane-base-index 1

# ステータスバーを設定する
set -g status-interval 60

## ヴィジュアルノーティフィケーションを有効にする
set -g visual-activity on

## ステータスバーを上部に表示する
set -g status-position top

# ステータスバーの色を設定する
set -g status-bg "colour238"

# status line の文字色を指定する。
set -g status-fg "colour255"

setw -g mouse on

bind ^ split-window -h -c '#{pane_current_path}'

# - でペインを横に分割する
bind - split-window -v -c '#{pane_current_path}'
~~~

# Start
$ sh start_afl_pg

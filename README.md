# recent-projects
### jp
最近使用したプロジェクトを開くためのCUIランチャーです。基本的に、VSCodeでの使用を想定しています。  
このランチャーは、MacOSでの動作を想定しています。
### en
CUI Launcher for recently used a projects. Basically, it is assumed to be used with VSCode.  
This launcher expect to work on MacOS.

# Platform
### jp
以下の環境で動作確認しています。
- Ruby 3.2.2
- MacOS 13.5.2
### en
We have confirmed the operation in the following environment.
- Ruby 3.2.2
- MacOS 13.5.2

# How it works
### jp
- `recent-projects/src/yaml/registered.yaml`に`add`コマンドで書き込まれたVSCodeの`code`の絶対パスを読込み、指定されたプロジェクトフォルダを開きます。
- 一度、プロジェクトを開くと`recent-projects/src/yaml/history.yaml`に履歴が保存されます。この履歴は`list`コマンドでリスト表示することができます。
- `list`コマンドで表示される履歴のリストには`履歴ID`が載っています。この`履歴ID`を使ってプロジェクトを開くことができます。

### en
- Read the absolute path of `code` of VSCode written by `add` command to `recent-projects/src/yaml/registered.yaml` and open the specified project folder.
- Once you open the project, the history is saved in `recent-projects/src/yaml/history.yaml`. This history can be listed with the `list` command.
- The `list` command show the list of histories along with `history ID`. You can open the project using this `history ID`.

# Installation
### jp
ここでは、ユーザーのホームディレクトリにインストールしていますが、インストールディレクトリは任意の場所で良いです。
ただし、このREADMEではホームディレクトリに`recent-projects`をインストールしたものとして説明します。
```
cd ~
git clone https://github.com/3colorr/recent-projects.git
```
次にエイリアスを設定します。
エイリアスは`rp`出なくても良いですが、このREADMEでは`rp`を設定したものとして説明します。
```
echo 'alias rp="ruby ~/recent-projects/exec.rb"' >> .zshrc
```  
エイリアスの設定をしたくない場合は、`ruby ~/recent-project/exec.rb`を毎回入力してください。
```
ruby ~/recent-projects/exec.rb [コマンド]
```
### en
In this section, it is installed in the user's home directory, but the installation directory can be any location.
But in this README it is explained assuming that `recent-projects` is installed user's home directory.
```
cd ~
git clone https://github.com/3colorr/recent-projects.git
```
Next, you set up an alias.
The alias does not have to be `rp`, but in this README it is explained assuming that `rp` is set.
```
echo 'alias rp="ruby ~/recent-projects/exec.rb"' >> .zshrc
```  
If you do not want to the alias setting, you have to enter `ruby ~/recent-project/exec.rb` each time.
```
ruby ~/recent-projects/exec.rb [command]
```

# Uninstalling recent-projects
### jp
`recent-projects`フォルダを削除してください。
そして、`recent-projects/exec.rb`へのエイリアスを削除してください。
```
alias rp="ruby ~/recent-projects/exec.rb"
```  
### en
Delete `recent-projects` folder.
And delete an alias of `recent-projects/exec.rb`.
```
alias rp="ruby ~/recent-projects/exec.rb"
```  

# Quick Start
### jp
(例)VSCodeを使って`my-project`を開きます。そして、次の日に`my-project`を開き、作業を再開します
```
$rp add vscode /path/to/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code
$rp vscode /path/to/my-project

>>> 次の日...

$rp list
 1. my-project opened by vscode
  ---- /path/to/my-project
$rp 1
Open: /path/to/my-project
```
### en
(e.g.)We open `my-project` with VSCode. And the next day, we poen `my-project` with VSCode and work.
```
$rp add vscode /path/to/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code
$rp vscode /path/to/my-project

>>> The next day...

$rp list
 1. my-project opened by vscode
  ---- /path/to/my-project
$rp 1
Open: /path/to/my-project
```

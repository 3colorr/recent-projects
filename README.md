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
- Ruby 3.1.2
- MacOS 13.0.1
### en
We have confirmed the operation in the following environment.
- Ruby 3.1.2
- MacOS 13.0.1

# How it works
### jp
準備中
### en
Getting ready.

# Installation
### jp
ここでは、ユーザーのホームディレクトリにインストールしていますが、インストールディレクトリは任意の場所で良いです
```
cd ~
git clone https://github.com/3colorr/recent-projects.git
```
次にエイリアスを設定しますが、スキップしても良いです。
```
vi .zshrc
> alias rp="ruby ~/recent-projects/exec.rb"
```  
エイリアスの設定をスキップする場合は、`~/recent-project/exec.rb`を毎回入力してください。
```
ruby ~/recent-projects/exec.rb [コマンド]
```
### en
In this section, it is installed in the user's home directory, but the installation directory can be any location.
```
cd ~
git clone https://github.com/3colorr/recent-projects.git
```
Next, we will set up an alias, but you can skip it.
```
vi .zshrc
> alias rp="ruby ~/recent-projects/exec.rb"
```  
If you skip the alias setting, you have to enter "~/recent-project/exec.rb" each time.
```
ruby ~/recent-projects/exec.rb [コマンド]
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

docs/atoms_10_duckietown_meta/70_contrib/60_contributing_to_docs.zh-CN.md


# 如何贡献文档 {#contribute-to-docs status=ready}

## 文档位置

所有文档位于库 `duckietown/duckuments`.

文档由许多Markdown格式小的文件组成.

然后通过脚本编译输出:

* [PDF 符合印刷发布质量][master-pdf];
* [HTML 在线版本, 多页面][master-split];
* [HTML 在线版本, 单页面][master-html].

[master-pdf]: http://book.duckietown.org/master/duckiebook.pdf
[master-html]: http://book.duckietown.org/master/duckiebook.html
[master-split]: http://book.duckietown.org/master/duckiebook/index.html
<!-- * [HTML (single-page)][master-html]; -->

## 编辑链接

贡献文档的最简单的方法是单击标题右侧的“✎”图标。

便可以链接到Github上的“编辑”页面。在那里，一个人可以在几秒钟内做出编辑并提交。

## 安装文档系统{#installing-docs-system}

文档可以安装在任何地方。接下来，我们将假设文档系统是安装在 `~/duckuments`。

我们还会假设你已经设置好了一个带有公钥的Github帐户。

参见:[SSH基本配置](#ssh-local-configuration)。

参见:[创建密钥对](#howto-create-key-pair)。

参见:[在Github上添加公钥](#howto-add-pubkey-to-github)。

我们还将假设您已经在“~/duckietown”中安装了“duckietown/software”。

### 安装依赖(Ubuntu 16.04)

在Ubuntu 16.04, 假设已安装以下依赖包:

    $ sudo apt install libxml2-dev libxslt1-dev
    $ sudo apt install libffi6 libffi-dev
    $ sudo apt install python-dev python-numpy python-matplotlib
    $ sudo apt install virtualenv
    $ sudo apt install bibtex2html pdftk
    $ sudo apt install imagemagick

 


### 下载 `duckuments`库

下载 `duckietown/duckuments` 库到 `~/duckuments` 文件夹:

    $ git lfs clone --depth 100 git@github.com:duckietown/duckuments ~/duckuments

这里，注意我们使用 `git lfs clone`

它更快，因为它下载Git LFS文件是并行的。

如果失败，则说明你没有安装Git LFS。见[git-lfs](#git-lfs)

`--depth 100`命令意思是我们并不关心整个历史。




### 设置虚拟环境

接下来，我们将在`~/duckuments`中创建一个虚拟环境。

目录中。确保运行的是Python 2.7.x。目前不支持Python 3.x。

切换到目录:

    $ cd ~/duckuments

使用`virtualenv`创建虚拟环境:

    $ virtualenv --system-site-packages deploy

其他发行版: 可能需要使用 `venv` 代替 `virtualenv`.

激活虚拟环境:

    $ source ~/duckuments/deploy/bin/activate

### 设置 `mcdp` 外部库

确认在目录下:

    $ cd ~/duckuments

Clone  `mcdp` 外部库的`duckuments`分支.

    $ git clone -b duckuments git@github.com:AndreaCensi/mcdp

安装 `mcdp` 及依赖:

    $ cd ~/duckuments/mcdp
    $ python setup.py develop

注意: 如果出现权限错误, 可能是因为并没有正确激活虚拟环境.

其他发行版: 如果非Ubuntu 16, 则根据系统不同, 需要做安装以下依赖:

    $ pip install numpy matplotlib

还需要安装:

    $ pip install -U SystemCmd==2.0.0

## 编译文档 (updated Sep 12) {#compiling-master status=recently-updated }

<div class="check" markdown="1">

确保你已经部署并激活了虚拟环境。你可以通过检查哪些 `python` 是活动的进行检:

    $ which python
    /home/![user]/duckuments/deploy/bin/python

</div>

<!--
Then:

    $ cd ~/duckuments
    $ mkdir duckuments-dist

 This creates the directory `duckuments-dist`, which contains
the "live" website published by Github using the "Github Pages" mechanism at the URL `book.duckietown.org`.

<div class="check" markdown="1">

At this point, please make sure that you have these two `.git` folders:

    ~/duckuments/.git
    ~/duckuments/duckuments-dist/.git

</div> -->

编译master版本的文档, 运行:

    $ make master-clean master

打开文件观察结果

    ./duckuments-dist/master/duckiebook/index.html

如果想进行增量编译，你可以省略 `clean` 并只使用:

    $ make master

这将更快。然而，有时它可能会被混淆。
此时,运行 `make master-clean`.

### 只编译2017秋季版本 (introduced Sep 12) {#compiling-fall2017 status=recently-updated}

编译2017秋季版本, 运行:

    $ make fall2017-clean fall2017

打开文件观察结果

    ./duckuments-dist/master/duckiebook/index.html


增量编译，运行:

    $ make fall2017

### 单个文件编译 {#compile-single-file}

还可以选择编译单个文件。

运行:

    $ ./compile-single ![path to .md file]

这是查看编辑结果的最快方法，然而也有一些局限性:
- 链接到其他章节的链接将不会起作用
- 并不是所有的图像都能找到

## 编辑文档的工作流程 (updated Sep 12) {#workflow status=recently-updated}

这是基本的工作流程:
1. 在 `duckuments` 库中创建一个 `![yourname]-branch`   
1. 在 `![yourname]-branch` 分支里编辑Markdown文件  
2. 运行 `make master` 以确保它能够编译 
3. Commit Markdown文件，并push `![yourname]-branch`  分支  
4. pull request 
5. 给组 `duckietown/gardeners` 打标签 

参见:命令行中使用 [`hub`](#hub) 创建一个pull request.
 
## 报告问题

首先，请参见  <a href="#markduck-troubleshooting" class='name_number'></a> 
常见问题及其解决方法。

请使用 [the `duckuments` issue tracker][tracker] 文档来报告问题。

如果是紧急情况，请标签 (Andrea) ; 否则每隔几天就会以批处理模式处理。
 
[tracker]: https://github.com/duckietown/duckuments/issues

如果你生成的PDF有问题，请附上问题PDF。

如果你说“这发生在图3”，那就很难正确知道你所引用的数字，因为每次提交编号都是变化的。
 
如果你想要引用文本的特定部分，请将你的所有工作提交到你的分支上，
并使用以下命令获取提交的名称:
 

    $ git -C ~/duckuments rev-parse HEAD      # commit for duckuments
    $ git -C ~/duckuments/mcdp rev-parse HEAD # commit for mcdp

<!--
JT: this is a test to show how to edit the docs
-->


<!-- don't need to do it manually.

To deploy the documentation, jump into the `DUCKUMENTS/duckuments-dist` directory.

Run the command `git branch`. If the out does not say that you are on the branch `gh-pages`,
then one of the steps before was done incorrectly.

    $ cd $DUCKUMENTS/duckuments-dist
    $ git branch
    ...
    * gh-pages
    ...

Now, after triple checking that you are in the `gh-pages` branch, you can
use `git status` to see the files that were added or modified,
and simply use `git add`, `git commit` and `git push` to push the files
to Github. -->

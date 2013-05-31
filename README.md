vundle
======

my-vim-config based on vundle

- 下载配置    : `git clone https://github.com/darrenhp/vundle.git ~/.vim`
- 链接配置文件: `ln ~/.vim/vimrc ~/.vimrc`

- 安装Vundle：`git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
- 安装插件： `:BundleInstall`
- 更新插件： `:BundleInstall!`
- 卸载不在列表中的插件： `:BundleClean"`

cheatsheet
==========

###高效编辑

- `di"` 光标在""之间，则删除""之间的内容
- `yi(` 光标在()之间，则复制()之间的内容
- `vi[` 光标在[]之间，则选中[]之间的内容
- 以上三种可以自由组合搭配，效率奇高，i(nner)
- `dtx` 删除字符直到遇见光标之后的第一个`x`字符
- `ytx` 复制字符直到遇见光标之后的第一个`x`字符

###标记和宏(macro)

- `ma` 将当前位置标记为a，26个字母均可做标记，`mb`、`mc`等等；
- `'a` 跳转到a标记的位置；
- 这是一组很好的文档内标记方法，在文档中跳跃编辑时很有用；
- `qa` 将之后的所有键盘操作录制下来，直到再次在命令模式按下`q`，并存储在`a`中；
- `@a` 执行刚刚记录在`a`里面的键盘操作；
- `@@` 执行上一次的macro操作；

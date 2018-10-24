选择菜单脚本使用文档 (SelectMenu)
======

### 使用示例：文件引入方式
```bash
SelectMenuItems=("7.1" "5 6")
SelectMenuTitle="请选择 PHP 版本"
source SelectMenu.sh
```

### 使用示例：命令执行方式
```bash
bash SelectMenu.sh "请选择 PHP 版本" "7.1" "5 6"
```

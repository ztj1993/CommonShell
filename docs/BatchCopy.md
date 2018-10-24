批量复制脚本使用文档 (BatchCopy)
======

### 变量说明
- BatchCopyPaths：批量复制路径
  - 这是一个数组
  - 数组元素由源路径和目标路径组成
    - 这两个路径通过 `=>` 合并为一个字符串
    - 这两个路径对应 `cp` 命令的第一个和第二个参数
- SkipNotExist：跳过不存在的路径
  - 这个变量不能通过命令传递参数

### 使用示例：文件引入方式
```bash
BatchCopyPaths=(
    "BatchCopy.sh=>BatchCopy.sh.bak1"
    "BatchCopy.sh=>BatchCopy.sh.bak2"
)
source BatchCopy.sh
```

### 使用示例：命令执行方式
```bash
bash BatchCopy.sh "BatchCopy.sh=>BatchCopy.sh.bak1" "BatchCopy.sh=>BatchCopy.sh.bak2"
```

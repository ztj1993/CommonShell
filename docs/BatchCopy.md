批量复制脚本使用文档 (BatchCopy)
======

### 脚本参数
本脚本由一个脚本参数 `BatchCopyPaths`，本参数介绍如下：
- 这是一个数组
- 数组元素由源路径和目标路径组成
- 源路径和目标路径通过 `=>` 合并为一个字符串
- 源路径和目标路径对应 `cp` 命令的第一个和第二个参数
- SkipNotExist：跳过不存在的路径
  - 这个变量不能通过命令传递参数

### 返回说明
- 返回值为 0 时，表示全部复制成功
- 返回值为非 0 时
  - 表示有某项没有复制成功
  - 返回没有复制成功的索引
  - 索引由 1 计数

### 特殊参数
本脚本有一个特殊变量 `SkipNotExist`，这个变量只能全局定义；
如果变量值为 `yes` 时，将跳过所有的不存在路径(源路径和目标路径均检查)。

### 使用示例：文件引入方式
请注意这种引入方式，一旦发送错误，将导致整个脚本结束运行。
```bash
BatchCopyPaths=(
    "BatchCopy.sh=>BatchCopy.sh.bak1"
    "BatchCopy.sh=>BatchCopy.sh.bak2"
)
source BatchCopy.sh
echo $?
```

### 使用示例：命令执行方式
```bash
bash BatchCopy.sh "BatchCopy.sh=>BatchCopy.sh.bak1" "BatchCopy.sh=>BatchCopy.sh.bak2"
echo $?
```

用户提示并确认脚本使用文档 (UserConfirm)
======

### 说明
这是一个用户消息确认文本，支持多个确认项。

### 参数
- `<DefaultInput>[yes|no]` 默认输入
- `<TipsArr>[StringArray](tips tips...)` 提示消息文本数组

### 返回说明
- 返回值为 0 时，表示用户全部确认通过
- 返回值为非 0 时
  - 表示用户有某项没有确认通过
  - 返回没有确认通过的索引
  - 索引由 1 计数

### 特殊参数
本脚本有一个特殊变量 `SkipUserConfirm`，这个变量只能全局定义；
如果变量值为 `yes` 时，所有提示默认通过。

### 使用示例
```bash
bash UserConfirm.sh "yes" "请确认" "请再次确认"
echo $?
bash UserConfirm.sh "no" "请确认" "请再次确认"
echo $?
export SkipUserConfirm=yes
bash UserConfirm.sh "yes" "请确认" "请再次确认"
echo $?
```

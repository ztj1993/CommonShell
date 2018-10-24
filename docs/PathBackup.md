路径备份脚本使用文档 (TplEngine)
======

### 说明
这个脚本主要用于路径备份，比如配置文件的更改，具有历史记录功能。

### 生成的备份说明
- 

### 使用示例：文件所在目录下备份
```bash
bash PathBackup.sh "PathBackup.sh"
bash PathBackup.sh "PathBackup.sh"
```

### 使用示例：文件备份到指定的目录
```bash
bash PathBackup.sh "PathBackup.sh" /backup
bash PathBackup.sh "PathBackup.sh" /backup
```

### 使用示例：文件备份到指定目录下的指定文件名
```bash
bash PathBackup.sh "PathBackup.sh" /backup PB.sh
bash PathBackup.sh "PathBackup.sh" /backup PB.sh
```

### 使用示例：引入方式使用
```bash
OriginalPath="PathBackup.sh"
TargetPath="/backup"
PathAlias="PB.sh"
bash PathBackup.sh "PathBackup.sh" /backup/PB.sh
source PathBackup.sh
```

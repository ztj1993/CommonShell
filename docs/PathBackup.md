路径备份脚本使用文档 (TplEngine)
======

### 说明
这个脚本主要用于路径备份，比如配置文件的更改，具有历史记录功能。

### 脚本参数
- `<OriginalPath>(FilePath|DirPath|)` 要备份的文件或者目录，必须输入
- `<TargetPath|Optional>(DirPath)` 备份到的目录，可选，默认当前目录
- `<PathAlias|Optional>(FileName|DirName)` 路径别名，可选的，默认当前文件或者目录名称

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

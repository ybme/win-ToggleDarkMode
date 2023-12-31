## Q: 请给我一个简单的方式，可以一键切换win11的亮色和暗色模式

### A: 以下是一个简单的PowerShell脚本示例，它会检查当前的模式并将其切换到另一模式：

```
powershellCopy code# 定义注册表路径
$regPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$regName = "AppsUseLightTheme"

# 读取当前的亮色/暗色模式设置
$currentSetting = Get-ItemProperty -Path $regPath -Name $regName

# 切换模式
if ($currentSetting.$regName -eq 1) {
    # 当前为亮色模式，切换到暗色模式
    Set-ItemProperty -Path $regPath -Name $regName -Value 0
} else {
    # 当前为暗色模式，切换到亮色模式
    Set-ItemProperty -Path $regPath -Name $regName -Value 1
}
```

#### 使用方法：

1. 打开记事本或其他文本编辑器。
2. 将上面的脚本复制并粘贴到记事本中。
3. 保存文件为 `.ps1` 格式，例如 `ToggleDarkMode.ps1`。
4. 右键点击该文件并选择“使用 PowerShell 运行”。

#### 注意：

- 运行脚本时可能需要有管理员权限。
- 如果你的系统禁止运行脚本，你可能需要调整执行策略。可以使用命令 `Set-ExecutionPolicy RemoteSigned` 或 `Set-ExecutionPolicy Unrestricted` 来更改策略。
- 这个脚本只切换应用的亮色/暗色模式，不会影响系统的亮色/暗色模式。



## Q: 但是这个只能在命令框里面才能运行成功，我双击打开的是记事本，右键选择win shell运行没有效果



### A: 您遇到的情况是一个常见问题，原因在于 PowerShell 脚本的默认行为和系统安全策略。下面是一些可能的解决方法：

1. **更改默认程序**:

   - 更改 `.ps1` 文件的默认打开方式。右键点击文件，选择“打开方式”然后选择“选择其他应用”，在列表中找到 PowerShell，并勾选“始终使用此应用打开 .ps1 文件”。这样，双击时它会在 PowerShell 中打开而不是记事本。

2. **通过 PowerShell 运行**:

   - 手动打开 PowerShell，然后拖拽 `.ps1` 文件到 PowerShell 窗口中。这会自动填充文件的路径，然后按回车运行。

3. **创建快捷方式**:

   - 创建一个快捷方式来运行脚本。右键点击桌面或其他位置，选择“新建” -> “快捷方式”。

   - 在创建快捷方式的路径框中，输入以下内容（确保替换为您的脚本路径）:

     ```
     arduinoCopy code
     powershell.exe -ExecutionPolicy Bypass -File "S:\ToggleDarkMode.ps1"
     ```

   - 完成后，您可以双击这个快捷方式来运行脚本。

4. **更改执行策略**:

   - 您的系统可能限制了脚本的执行。要更改这个设置，请打开 PowerShell（以管理员身份），然后运行以下命令:

     ```
     powershellCopy code
     Set-ExecutionPolicy RemoteSigned
     ```

   - 这将允许运行本地脚本。但请注意，这可能会带来安全风险，因为它允许运行所有未签名的本地脚本。

5. **使用批处理文件作为中转**:

   - 创建一个批处理文件来运行 PowerShell 脚本。例如，创建一个名为 

     ```
     ToggleDarkMode.bat
     ```

      的文件，其内容如下：

     ```
     batchCopy code@echo off
     powershell.exe -ExecutionPolicy Bypass -File "S:\ToggleDarkMode.ps1"
     ```

   - 这样，您可以双击 `.bat` 文件来运行 PowerShell 脚本。

**_宏与本Readme文档均由GPT生成_**

# 设置运行效果时需要注意，Windows 颜色模式要为深色或者浅色，不要是自定义，不然运行之后效果不明显：
<img width="754" alt="image" src="https://github.com/ybme/win-ToggleDarkMode/assets/10464238/5932f910-0653-4d64-978d-4a9a048a5624">


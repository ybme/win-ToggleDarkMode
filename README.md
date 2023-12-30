# win-ToggleDarkMode
这个宏点击后可以切换windows 10或者 11 的 亮色和暗色模式，如果不成功请按以下步骤解决


1. **更改默认程序**:

   - 更改 `.ps1` 文件的默认打开方式。右键点击文件，选择“打开方式”然后选择“选择其他应用”，在列表中找到 PowerShell，并勾选“始终使用此应用打开 .ps1 文件”。它一般位于“C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe”。这样，双击时它会在 PowerShell 中打开而不是记事本。

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
  
**_宏与本Readme文档内容均由GPT生成_**

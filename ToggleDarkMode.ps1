# 定义注册表路径
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
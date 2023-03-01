#Варіант 19. Змінити дату і час створення файлів в каталозі.

Write-Host "Запуск сценарію."
Start-Sleep -Seconds 1

New-Item -ItemType Directory -Path "Лабораторні\Група\Михлик Денис\Командна стрічка\Прихована папка" -Force
New-Item -ItemType Directory -Path "Лабораторні\Група\Михлик Денис\Командна стрічка\Не прихована папка" -Force

Write-Host "Створення каталогу."
Start-Sleep -Seconds 1

Get-ChildItem -Path . -Recurse -Force | Where-Object { $_.Attributes -match "Directory"} | Format-Table -AutoSize

Write-Host "Виведення каталогу."
Start-Sleep -Seconds 3

Set-ItemProperty -Path "Лабораторні\Група\Михлик Денис\Командна стрічка\Прихована папка" -Name Attributes -Value "Hidden"
Write-Host "Приховав папку."
Start-Sleep -Seconds 1

xcopy /? > "Лабораторні\Група\Михлик Денис\Командна стрічка\Не прихована папка\copyhelp.txt"

Write-Host "Записав результат виконання команди до файлу copyhelp.txt."
Start-Sleep -Seconds 1

echo f | xcopy "Лабораторні\Група\Михлик Денис\Командна стрічка\Не прихована папка\copyhelp.txt" /y "Лабораторні\Група\Михлик Денис\Командна стрічка\Прихована папка\copied_copyhelp.txt"

Write-Host "Скопіював файл copyhelp.txt з перейменуванням на copied_copyhelp.txt."
Start-Sleep -Seconds 1

New-Item -ItemType Directory -Path "Лабораторні\Група\Михлик Денис\batch\Прихована папка" -Force
New-Item -ItemType Directory -Path "Лабораторні\Група\Михлик Денис\batch\Не прихована папка" -Force

Write-Host "Створення вітки batch у папці Михлик Денис."
Start-Sleep -Seconds 1

Get-ChildItem -Path . -Recurse -Force | Where-Object { $_.Attributes -match "Directory"} | Format-Table -AutoSize

Write-Host "Виведення каталогу."
Start-Sleep -Seconds 3

Set-ItemProperty -Path "Лабораторні\Група\Михлик Денис\batch\Прихована папка" -Name Attributes -Value "Hidden"
Write-Host "Приховав папку."
Start-Sleep -Seconds 1

xcopy /? > "Лабораторні\Група\Михлик Денис\batch\Не прихована папка\copyhelp.txt"
Copy-Item -Path "Лабораторні\Група\Михлик Денис\batch\Не прихована папка\copyhelp.txt" -Destination "Лабораторні\Група\Михлик Денис\batch\Прихована папка\copied_copyhelp.txt" -Force

Write-Host "Скопіював файл copyhelp.txt з перейменуванням на copied_copyhelp.txt."
Start-Sleep -Seconds 1

(Get-Item "Лабораторні\Група\Михлик Денис\Командна стрічка\Не прихована папка\copyhelp.txt").LastWriteTime = Get-Date
(Get-Item "Лабораторні\Група\Михлик Денис\Командна стрічка\Не прихована папка\copyhelp.txt").CreationTime = Get-Date
(Get-Item "Лабораторні\Група\Михлик Денис\Командна стрічка\Прихована папка\copied_copyhelp.txt").LastWriteTime = Get-Date
(Get-Item "Лабораторні\Група\Михлик Денис\Командна стрічка\Прихована папка\copied_copyhelp.txt").CreationTime = Get-Date

echo "Змінив дату створення файлів на поточний час в каталозі Командна стрічка."
Start-Sleep -Seconds 1

$setdatefile = Read-Host "Введіть дату та час (хх-хх-ххxx хх:xx:xx)"
(Get-Item "Лабораторні\Група\Михлик Денис\batch\Не прихована папка\copyhelp.txt").LastWriteTime = [datetime]::ParseExact($setdatefile, "dd-MM-yyyy HH:mm:ss", $null)
(Get-Item "Лабораторні\Група\Михлик Денис\batch\Не прихована папка\copyhelp.txt").CreationTime = [datetime]::ParseExact($setdatefile, "dd-MM-yyyy HH:mm:ss", $null)
(Get-Item "Лабораторні\Група\Михлик Денис\batch\Прихована папка\copied_copyhelp.txt").LastWriteTime = [datetime]::ParseExact($setdatefile, "dd-MM-yyyy HH:mm:ss", $null)
(Get-Item "Лабораторні\Група\Михлик Денис\batch\Прихована папка\copied_copyhelp.txt").CreationTime = [datetime]::ParseExact($setdatefile, "dd-MM-yyyy HH:mm:ss", $null)

echo "Змінив дату створення файлів в каталозі batch зі змінної."
Start-Sleep -Seconds 1

Read-Host "Для перегляду звіту натисніть Enter."

Start-Process -FilePath "Лаб3.docx" -Verb "Open" -Wait

Read-Host "Демонстрація лабораторної роботи завершена."
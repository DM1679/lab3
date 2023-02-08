:: Варіант 19. Змінити дату і час створення файлів в каталозі.
@echo off
chcp 65001

cls

echo:Запуск сценарію. & >nul timeout /t 1 /nobreak

mkdir "Лабораторні\Група\Михлик Денис\Командна стрічка\Прихована папка"
mkdir "Лабораторні\Група\Михлик Денис\Командна стрічка\Не прихована папка"

echo:Створення каталогу. & >nul timeout /t 1 /nobreak

tree /a /f

echo:Виведення каталогу. & >nul timeout /t 3 /nobreak

attrib +h "Лабораторні\Група\Михлик Денис\Командна стрічка\Прихована папка"

echo:Приховав папку. & >nul timeout /t 1 /nobreak

xcopy /? > "Лабораторні\Група\Михлик Денис\Командна стрічка\Не прихована папка/copyhelp.txt"

echo:Записав результат виконання команди до файлу copyhelp.txt. & >nul timeout /t 1 /nobreak

echo f | xcopy "Лабораторні\Група\Михлик Денис\Командна стрічка\Не прихована папка"\copyhelp.txt /y "Лабораторні\Група\Михлик Денис\Командна стрічка\Прихована папка"\copied_copyhelp.txt

echo:Скопіював файл copyhelp.txt з перейменуванням на copied_copyhelp.txt. & >nul timeout /t 1 /nobreak

mkdir "Лабораторні\Група\Михлик Денис\batch\Прихована папка"
mkdir "Лабораторні\Група\Михлик Денис\batch\Не прихована папка"

echo:Створення вітки batch у папці Михлик Денис. & >nul timeout /t 1 /nobreak

tree /a /f

echo:Виведення каталогу. & >nul timeout /t 3 /nobreak

attrib +h "Лабораторні\Група\Михлик Денис\batch\Прихована папка"

echo:Приховав папку. & >nul timeout /t 1 /nobreak

xcopy /? > "Лабораторні\Група\Михлик Денис\batch\Не прихована папка/copyhelp.txt"
echo f | xcopy "Лабораторні\Група\Михлик Денис\batch\Не прихована папка"\copyhelp.txt /y "Лабораторні\Група\Михлик Денис\batch\Прихована папка"\copied_copyhelp.txt

echo:Скопіював файл copyhelp.txt з перейменуванням на copied_copyhelp.txt. & >nul timeout /t 1 /nobreak

nircmd.exe setfiletime "Лабораторні\Група\Михлик Денис\Командна стрічка\Не прихована папка"\copyhelp.txt "now" "now"
nircmd.exe setfiletime "Лабораторні\Група\Михлик Денис\Командна стрічка\Прихована папка"\copied_copyhelp.txt "now" "now"

echo:Змінив дату створення файлів на поточний час в каталозі Командна стрічка. & >nul timeout /t 1 /nobreak

:: 16-06-2025 18:00:00

set /p setdatefile="Введіть дату та час (хх-хх-ххxx хх:xx:xx)-> "

nircmd.exe setfiletime "Лабораторні\Група\Михлик Денис\batch\Не прихована папка"\copyhelp.txt "%setdatefile%" "%setdatefile%"
nircmd.exe setfiletime "Лабораторні\Група\Михлик Денис\batch\Прихована папка"\copied_copyhelp.txt "%setdatefile%" "%setdatefile%"

echo:Змінив дату створення файлів в каталозі batch зі змінної. & >nul timeout /t 1 /nobreak

echo:Для перегляду звіту натисніть Enter. & >nul timeout /t 1 /nobreak

pause

start /high /wait Лаб3.docx

echo:Демонстрація лабораторної роботи завершена. & >nul timeout /t 1 /nobreak

pause
#������ 19. ������ ���� � ��� ��������� ����� � �������.

Write-Host "������ �������."
Start-Sleep -Seconds 1

New-Item -ItemType Directory -Path "����������\�����\������ �����\�������� ������\��������� �����" -Force
New-Item -ItemType Directory -Path "����������\�����\������ �����\�������� ������\�� ��������� �����" -Force

Write-Host "��������� ��������."
Start-Sleep -Seconds 1

Get-ChildItem -Path . -Recurse -Force | Where-Object { $_.Attributes -match "Directory"} | Format-Table -AutoSize

Write-Host "��������� ��������."
Start-Sleep -Seconds 3

Set-ItemProperty -Path "����������\�����\������ �����\�������� ������\��������� �����" -Name Attributes -Value "Hidden"
Write-Host "�������� �����."
Start-Sleep -Seconds 1

xcopy /? > "����������\�����\������ �����\�������� ������\�� ��������� �����\copyhelp.txt"

Write-Host "������� ��������� ��������� ������� �� ����� copyhelp.txt."
Start-Sleep -Seconds 1

echo f | xcopy "����������\�����\������ �����\�������� ������\�� ��������� �����\copyhelp.txt" /y "����������\�����\������ �����\�������� ������\��������� �����\copied_copyhelp.txt"

Write-Host "�������� ���� copyhelp.txt � ��������������� �� copied_copyhelp.txt."
Start-Sleep -Seconds 1

New-Item -ItemType Directory -Path "����������\�����\������ �����\batch\��������� �����" -Force
New-Item -ItemType Directory -Path "����������\�����\������ �����\batch\�� ��������� �����" -Force

Write-Host "��������� ���� batch � ����� ������ �����."
Start-Sleep -Seconds 1

Get-ChildItem -Path . -Recurse -Force | Where-Object { $_.Attributes -match "Directory"} | Format-Table -AutoSize

Write-Host "��������� ��������."
Start-Sleep -Seconds 3

Set-ItemProperty -Path "����������\�����\������ �����\batch\��������� �����" -Name Attributes -Value "Hidden"
Write-Host "�������� �����."
Start-Sleep -Seconds 1

xcopy /? > "����������\�����\������ �����\batch\�� ��������� �����\copyhelp.txt"
Copy-Item -Path "����������\�����\������ �����\batch\�� ��������� �����\copyhelp.txt" -Destination "����������\�����\������ �����\batch\��������� �����\copied_copyhelp.txt" -Force

Write-Host "�������� ���� copyhelp.txt � ��������������� �� copied_copyhelp.txt."
Start-Sleep -Seconds 1

(Get-Item "����������\�����\������ �����\�������� ������\�� ��������� �����\copyhelp.txt").LastWriteTime = Get-Date
(Get-Item "����������\�����\������ �����\�������� ������\�� ��������� �����\copyhelp.txt").CreationTime = Get-Date
(Get-Item "����������\�����\������ �����\�������� ������\��������� �����\copied_copyhelp.txt").LastWriteTime = Get-Date
(Get-Item "����������\�����\������ �����\�������� ������\��������� �����\copied_copyhelp.txt").CreationTime = Get-Date

echo "����� ���� ��������� ����� �� �������� ��� � ������� �������� ������."
Start-Sleep -Seconds 1

$setdatefile = Read-Host "������ ���� �� ��� (��-��-��xx ��:xx:xx)"
(Get-Item "����������\�����\������ �����\batch\�� ��������� �����\copyhelp.txt").LastWriteTime = [datetime]::ParseExact($setdatefile, "dd-MM-yyyy HH:mm:ss", $null)
(Get-Item "����������\�����\������ �����\batch\�� ��������� �����\copyhelp.txt").CreationTime = [datetime]::ParseExact($setdatefile, "dd-MM-yyyy HH:mm:ss", $null)
(Get-Item "����������\�����\������ �����\batch\��������� �����\copied_copyhelp.txt").LastWriteTime = [datetime]::ParseExact($setdatefile, "dd-MM-yyyy HH:mm:ss", $null)
(Get-Item "����������\�����\������ �����\batch\��������� �����\copied_copyhelp.txt").CreationTime = [datetime]::ParseExact($setdatefile, "dd-MM-yyyy HH:mm:ss", $null)

echo "����� ���� ��������� ����� � ������� batch � �����."
Start-Sleep -Seconds 1

Read-Host "��� ��������� ���� �������� Enter."

Start-Process -FilePath "���3.docx" -Verb "Open" -Wait

Read-Host "������������ ����������� ������ ���������."
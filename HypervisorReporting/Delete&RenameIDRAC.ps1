Remove-Item -Path C:\Users\kkala\Downloads\viewer.jnlp

Get-ChildItem -Path 'C:\Users\kkala\Downloads\' | Rename-Item -NewName {$_.name -replace "viewer.*","viewer.jnlp"}
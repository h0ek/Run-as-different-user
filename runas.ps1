function Show-Menu
{
     param (
           [string]$Title = 'Run as different user'
     )
     cls
     Write-Host "===================== $Title ====================="

     Write-Host "1: Press '1' Active Directory User And Computers (dsa.msc)"
     Write-Host "2: Press '2' Active Directory Administrative Center (dsac.exe)"
     Write-Host "3: Press '3' Custom App (Path to app)"
     Write-Host "Q: Press 'Q' to quit."
}
do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                cls
				$user = Read-Host -Prompt 'Enter username'
				$domain = Read-Host -Prompt 'Enter domain'
				runas /netonly /user:$user@$domain "mmc.exe dsa.msc"
           } '2' {
                cls
				$user = Read-Host -Prompt 'Enter username'
				$domain = Read-Host -Prompt 'Enter domain'
				runas /netonly /user:$user@$domain "dsac.exe"
		   } '3' {
                cls
				$user = Read-Host -Prompt 'Enter username'
				$domain = Read-Host -Prompt 'Enter domain'
				$path = Read-Host -Prompt 'Enter path'
				runas /netonly /user:$user@$domain "$path"
           }'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')

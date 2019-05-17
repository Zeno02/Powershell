  #Name: IIS_Install
	#Script URI: https://github.com/Zeno02/Powershell/Install_IIS.ps1
	#Description: Installeert IIS
	#Version: versie 1.0.2
	#Author: Zeno Schoen
	#Author URI: https://github.com/Zeno02

$choice = Read-Host "Weet u zeker dat u IIS wilt installeren? <Y yes> / <N No>"

if ($choice.ToLower() -eq "yes" -OR $choice.ToLower() -eq "y")
{

$OSInfo = (Get-ComputerInfo).OsProductType

if ($OSInfo.OsProductType() -eq "WorkStation")

{

Write-Host "Je kan IIS niet installeren op een werkstation."

}


Try {

Install-WindowsFeature  -name Web-Server  -IncludeManagementTools

}

Catch {


if( $Error = 1 ){
    $FailMailParams = @{
        To = 'email@gmail.com'
        From = 'email@gmail.com'
        Credential = New-Object System.Net.NetworkCredential("", "");
        Port = '587'
        SmtpServer = 'smtp.gmail.com'
        Subject = 'Script foutmelding'
        Body = 'Er is iets misgegaan met het script.'
        }

    Send-MailMessage @FailMailParams
    } else {
         $SuccessMailParams = @{
        To = 'email@gmail.com'
        From = 'email@gmail.com'
        Credential = New-Object System.Net.NetworkCredential("", "");
        Port = '587'
        SmtpServer = 'smtp.gmail.com'
        Subject = 'Script succesvol'
        Body = 'Het script is succesvol uitgevoerd.'
        }

         Send-MailMessage @SuccessMailParams
       }
}

}

  #Name: IIS_Install
	#Script URI: https://github.com/Zeno02/Powershell/PCINFO
	#Description: Installeert IIS
	#Version: versie 1.0.0
	#Author: Zeno Schoen
	#Author URI: https://github.com/Zeno02


Try {

Install-WindowsFeature   `  -IncludeAllSubFeature `  -IncludeManagementTools

}

Catch {


if( $Error = 1 ){
    $FailMailParams = @{
        To = 'email@gmail.com'
        From = 'email@gmail.com'
        Credential = New-Object System.Net.NetworkCredential("", "");
        Port = '587'
        SmtpServer = 'smtp.gmail.com'
        Subject = 'Script Errors Out'
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
        Subject = 'Success'
        Body = 'Het script is succesvol uitgevoerd.'
        }

         Send-MailMessage @SuccessMailParams
       }
}
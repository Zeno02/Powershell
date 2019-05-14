  #Name: IIS_Install
	#Script URI: https://github.com/Zeno02/Powershell/Install_IIS.ps1
	#Description: Installeert IIS
	#Version: versie 1.0.0
	#Author: Zeno Schoen
	#Author URI: https://github.com/Zeno02


Try {

Install-WindowsFeature -Name PFSV1 `  -IncludeAllSubFeature `  -IncludeManagementTools

}

Catch {

$From = "enter email here"
$To = "enter email here"
$Cc = ""
$Subject = "IIS Installatie"
$Body = "IIS is met success geïnstalleerd."
$SMTPServer = "smtp.office365.com"
$SMTPPort = "587"
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential (Get-Credential) –DeliveryNotificationOption OnSuccess

}

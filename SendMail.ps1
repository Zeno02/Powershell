$From = "example@example.com"
$To = "example@example.com"
$Cc = "example@example.com"
$Subject = "Enter subject here"
$Body = "Enter message here"
$SMTPServer = "Enter SMTP Server here"
$SMTPPort = "PortNumber"
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential (Get-Credential) –DeliveryNotificationOption OnSuccess
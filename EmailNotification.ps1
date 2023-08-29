# Email Notification Function part for the Simpe FIM PowerShell Script
# Made by Simon Jiang. https://github.com/thesimonjiang

# To make this part work, you must replace the $emailFrom, $emailTo, $smtpServer, and YOUR_SERVER_PORT with your own information.

# Email Alert for Changes in Folder Alpha

function EmailNotificationAlphaAdd () {
    # Email header and message
    $emailFrom = "YOUR_EMAIL_ADDRESS"
    $emailTo = "YOUR_EMAIL_ADDRESS"
    $emailSubject = "Alert! A New File Has Been Created in [Alpha] Folder!"
    $emailBody = "Attention Admin! A new file has been created in the monitored file directory! Please check the file log!"
    
    # SMTP server info and email credential
    $smtpServer = "YOUR_SMTP_SERVER"
    $smtpClient = New-Object Net.Mail.smtpClient($smtpServer, YOUR_SERVER_PORT)
    $smtpClient.EnableSsl = $true
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential("YOUR_EMAIL_LOGIN", "YOUR_PASSWORD")
    $smtpClient.Send($emailFrom, $emailTo, $emailSubject, $emailBody)
}

function EmailNotificationAlphaAltered () {
    # Email header and message
    $emailFrom = "YOUR_EMAIL_ADDRESS"
    $emailTo = "YOUR_EMAIL_ADDRESS"
    $emailSubject = "Alert! A File Has Been Altered in [Alpha] Folder!"
    $emailBody = "Attention Admin! A file has been altered in the monitored file directory! Please check the file log!"
    
    # SMTP server info and email credential
    $smtpServer = "YOUR_SMTP_SERVER"
    $smtpClient = New-Object Net.Mail.smtpClient($smtpServer, YOUR_SERVER_PORT)
    $smtpClient.EnableSsl = $true
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential("YOUR_EMAIL_LOGIN", "YOUR_PASSWORD")
    $smtpClient.Send($emailFrom, $emailTo, $emailSubject, $emailBody)
}

function EmailNotificationAlphaDeleted () {
    # Email header and message
    $emailFrom = "YOUR_EMAIL_ADDRESS"
    $emailTo = "YOUR_EMAIL_ADDRESS"
    $emailSubject = "Alert! A File Has Been Deleted in [Alpha] Folder!"
    $emailBody = "Attention Admin! A file has been deleted in the monitored file directory! Please check the file log!"
    
    # SMTP server info and email credential
    $smtpServer = "YOUR_SMTP_SERVER"
    $smtpClient = New-Object Net.Mail.smtpClient($smtpServer, YOUR_SERVER_PORT)
    $smtpClient.EnableSsl = $true
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential("YOUR_EMAIL_LOGIN", "YOUR_PASSWORD")
    $smtpClient.Send($emailFrom, $emailTo, $emailSubject, $emailBody)
}

# Email Alert for Changes in Folder Beta

function EmailNotificationBetaAdd () {
    # Email header and message
    $emailFrom = "YOUR_EMAIL_ADDRESS"
    $emailTo = "YOUR_EMAIL_ADDRESS"
    $emailSubject = "Alert! A New File Has Been Created in [Beta] Folder!"
    $emailBody = "Attention Admin! A new file has been created in the monitored file directory! Please check the file log!"
    
    # SMTP server info and email credential
    $smtpServer = "YOUR_SMTP_SERVER"
    $smtpClient = New-Object Net.Mail.smtpClient($smtpServer, YOUR_SERVER_PORT)
    $smtpClient.EnableSsl = $true
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential("YOUR_EMAIL_LOGIN", "YOUR_PASSWORD")
    $smtpClient.Send($emailFrom, $emailTo, $emailSubject, $emailBody)
}

function EmailNotificationBetaAltered () {
    # Email header and message
    $emailFrom = "YOUR_EMAIL_ADDRESS"
    $emailTo = "YOUR_EMAIL_ADDRESS"
    $emailSubject = "Alert! A File Has Been Altered in [Beta] Folder!"
    $emailBody = "Attention Admin! A file has been altered in the monitored file directory! Please check the file log!"
    
    # SMTP server info and email credential
    $smtpServer = "YOUR_SMTP_SERVER"
    $smtpClient = New-Object Net.Mail.smtpClient($smtpServer, YOUR_SERVER_PORT)
    $smtpClient.EnableSsl = $true
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential("YOUR_EMAIL_LOGIN", "YOUR_PASSWORD")
    $smtpClient.Send($emailFrom, $emailTo, $emailSubject, $emailBody)
}

function EmailNotificationBetaDeleted () {
    # Email header and message
    $emailFrom = "YOUR_EMAIL_ADDRESS"
    $emailTo = "YOUR_EMAIL_ADDRESS"
    $emailSubject = "Alert! A File Has Been Deleted in [Beta] Folder!"
    $emailBody = "Attention Admin! A file has been deleted in the monitored file directory! Please check the file log!"
    
    # SMTP server info and email credential
    $smtpServer = "YOUR_SMTP_SERVER"
    $smtpClient = New-Object Net.Mail.smtpClient($smtpServer, YOUR_SERVER_PORT)
    $smtpClient.EnableSsl = $true
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential("YOUR_EMAIL_LOGIN", "YOUR_PASSWORD")
    $smtpClient.Send($emailFrom, $emailTo, $emailSubject, $emailBody)
}
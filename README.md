# Site Change Notifier
This shell script was written with the intent to be used as a cronjob.  The script is intended to run wget on a website to create an original file to compare against a later wget.  It will then compare the two files and if there is a change, an email will be sent to the provided email address.
# Usage:
`./site-change-notifier.sh site.URL rcvr@email.address sender@email.address`

Three arguments are required.  

Argument 1 is the URL of the website you are monitoring.

Argument 2 is the email address where you plan to send the notification.

Argument 3 is the email address of the sender.

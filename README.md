# DscSolr
Quickly set up Solr on Windows Server 2016 in a matter of minutes.

Copy the three files in this repo to a fresh Windows Server 2016.

Open the containing folder with an Administrator PowerShell window.

Run `.\InstallSolr.ps1` and follow the prompts for variables. If you aren't sure what ot put for a particular variable, enter `!?` and help text will give you a description and example.

Anticipated execution time: 90 seconds

When complete, visit the DNS you supplied during install, and use either http or https depending on what you chose during installation, to confirm it is working properly.

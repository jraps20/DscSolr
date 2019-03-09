param(
    [ValidatePattern("[0-9]\.[0-9]{1,2}\.[0-9]{1,2}")]
    [parameter(Mandatory=$true,HelpMessage='Solr numbered version, e.g. 6.6.3, 5.0.0+ supported')]
    [String]$solrVersion,
    [parameter(Mandatory=$true,HelpMessage='Password used to secure Solr SSL certificate. Remember this for later')]
    [String]$solrSslPassword,
    [ValidateLength(4, 4)]
    [parameter(Mandatory=$true,HelpMessage='Port used for Solr connections, suggested value: 8983')]
	[String]$solrPort,
    [parameter(Mandatory=$true,HelpMessage='FQDN used to serve Solr web application, e.g. mysolr.com')]
	[String]$dns,
    [ValidateSet("true", "false")]
    [parameter(Mandatory=$true,HelpMessage='Whether to enable https/SSL for Solr. Not all versions support this. E.g. true or false')]
	[String]$useSSL,
    [ValidateSet("true", "false")]
    [parameter(Mandatory=$true,HelpMessage='For 6.6.2+, set to true to have Sitecore indexes and xDB indexes used a shared schema. Less than 6.6.2, set to false')]
	[String]$performSchemaUpdates
)

$useSSLBool = $false
switch($useSSL.ToLower()) {
    "true" { $useSSLBool = $true }
    default { $useSSLBool = $false }
}

$performSchemaUpdatesBool = $false
switch($performSchemaUpdates.ToLower()) {
    "true" { $performSchemaUpdatesBool = $true }
    default { $performSchemaUpdatesBool = $false }
}

. .\SolrServerConfig.ps1
SolrServerConfig -artifactsLocation $PSScriptRoot -solrVersion $solrVersion -solrSslPassword $solrSslPassword -solrPort $solrPort -dns $dns -useSSL $useSSLBool -performSchemaUpdates $performSchemaUpdatesBool
Start-DscConfiguration -Verbose -Force -Path $PSScriptRoot\SolrServerConfig -Wait
Remove-Item C:\Windows\System32\Configuration\Current.mof
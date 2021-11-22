##get-content D:\powershellScripts\ps1.txt

<#

$CLS = C:\"Personal Data"\tdf_enc_util_example\CLS.txt
foreach ($line in $CLS)
{
  (Get-Content $CLS) | 
  Foreach-Object {C:\"Personal Data"\tdf_enc_util_example\tdf_enc_util.exe  $line}

}


#>


<#

Get-Content -Path "C:\Personal Data\tdf_enc_util_example\CLS.txt" | ForEach-Object {
    Start-Process -FilePath "C:\Personal Data\tdf_enc_util_example\tdf_enc_util.exe" -ArgumentList "$_"
}

Get-Content -Path "C:\Personal Data\tdf_enc_util_example\CLS.txt" 
ForEach-Object {
    Start-Process -FilePath "C:\Personal Data\tdf_enc_util_example\tdf_enc_util.exe" -ArgumentList "$_"
}

#>




# vdsconfig.bat resource-export -name <name from file>

$RLI_HOME = (Get-ChildItem -Path Env:\RLI_HOME).value
$rootdse = Invoke-RestMethod -Uri http://localhost:8089/adap/rootdse?attributes=namingcontexts
$newrootdse = $rootdse.resources.attributes.namingContexts
$default = 'cn=config', 'cn=registry', 'cn=replicationjournal', 'cn=changelog', 'cn=masterdatacatalog', 'cn=system-registry', 'dv=company-hdfs-virtual-drive', 'dv=contextcatalog', 'dv=globalprofiles', 'dv=syncobjectcatalog', 'o=companydirectory', 'o=companyprofiles', 'o=examples', 'ou=AllProfiles'
foreach ($source in $newrootdse)
{
    if ($default -notcontains $source)
    {
        $RLI_HOME + "\bin\vdsconfig.bat" resource-export -name $source -path C:\exports\$source.zip
    }    
}
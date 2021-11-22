#Get-NetTCPConnection -state Listen

#Get-NetTCPConnection -State Listen | Select-Object -Property LocalPort, State | Sort-Object LocalPort

#Get-NetTCPConnection -State Listen |Select-Object -Property LocalPort, State, @{name='ProcessID';expression={(Get-Process -Id $_.OwningProcess). ID}}, @{name='ProcessName';expression={(Get-Process -Id $_.OwningProcess). Path}}



$LOCALPORT = Get-Content -Path D:\powershellScripts\portsbyVds.txt
Foreach ($PORTS in $LOCALPORT )
{
    echo "Checking VDS $PORTS "  
    $CONNECTIONS = Get-NetTCPConnection -State Listen |Select-Object -Property LocalPort, State, @{name='ProcessID';expression={(Get-Process -Id $_.OwningProcess). ID}}, @{name='ProcessName';expression={(Get-Process -Id $_.OwningProcess). Path}}
    
}



<#

$LOCALPORT = "135"
$CONNECTIONS = Get-NetTCPConnection -State Listen |Select-Object -Property LocalPort, State, @{name='ProcessID';expression={(Get-Process -Id $_.OwningProcess). ID}}, @{name='ProcessName';expression={(Get-Process -Id $_.OwningProcess). Path}}
Foreach ($I in $CONNECTIONS)
{
If ($I.LocalPort -eq $LOCALPORT)
{
$I
}
}


Foreach ($I in $CONNECTIONS)
        {
            echo "output for each port" $I 
            If ($I.LocalPort -eq $LOCALPORT)
            {
                echo $I
            }
        }

#>



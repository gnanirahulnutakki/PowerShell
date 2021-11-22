# Processor utilization
$Processor = (Get-WmiObject -ComputerName W-RLI19-GNutakki $Server -Class win32_processor -ErrorAction Stop | Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average
  
# Memory utilization
$ComputerMemory = Get-WmiObject -ComputerName W-RLI19-GNutakki $Server -Class win32_operatingsystem -ErrorAction Stop
$Memory = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory)*100)/ $ComputerMemory.TotalVisibleMemorySize)
$RoundMemory = [math]::Round($Memory, 2)
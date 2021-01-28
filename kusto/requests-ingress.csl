// NOT POWERSHELL, JUST WANT SOME HIGHLIGHTING
let MyLogs = ContainerLog
|join(KubePodInventory | where Name contains "nginx-ingress")//KubePodInventory Contains namespace information
on ContainerID
|where TimeGenerated1 > startofday(ago(7d))
| project TimeGenerated1 ,Namespace , LogEntrySource , ContainerID, ContainerID1, LogEntry
| where Namespace == "default";
MyLogs |
summarize event_count = count() by bin(TimeGenerated1, 1h)
| sort by TimeGenerated1 asc
| render barchart 




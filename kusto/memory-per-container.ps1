// NOT POWERSHELL
// Container memory 
// View container CPU averaged over 30 mins intervals. 
// To create an alert for this query, click '+ New alert rule'
//Select the Line chart display option: can we calculate percentage?
let threshold = 75000000; // choose a threshold 
Perf
| where ObjectName == "K8SContainer" and CounterName == "memoryRssBytes"
| summarize AvgUsedRssMemoryBytes = avg(CounterValue) by bin(TimeGenerated, 30m), InstanceName, _ResourceId
| where AvgUsedRssMemoryBytes > threshold 
| render timechart


// second attempt limit resources
// Container memory 
// View container CPU averaged over 30 mins intervals. 
// To create an alert for this query, click '+ New alert rule'
//Select the Line chart display option: can we calculate percentage?
let threshold = 175000000; // choose a threshold 
Perf
| where ObjectName == "K8SContainer" and CounterName == "memoryRssBytes"
| where InstanceName contains "/api" or InstanceName contains "/tripviewer" or InstanceName contains "/poi" or InstanceName contains "/userprofile" or InstanceName contains "/trips" or InstanceName contains "user-java"
| summarize AvgUsedRssMemoryBytes = avg(CounterValue) by bin(TimeGenerated, 30m), InstanceName, _ResourceId
| where AvgUsedRssMemoryBytes > threshold 
| render timechart
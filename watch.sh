netstat -ant | awk '{print $6}' | sort | uniq -c | sort -n

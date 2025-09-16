# Lock Files!

`#!/bin/bash`
This line is called a shebang and specifies the interpreter that should be used to execute the script, which is /bin/bash in this case.

`L="/var/run/my_cron_job.lock"`
This line assigns the path to the lock file to the variable L. The lock file will be located at /var/run/my_cron_job.lock. This is where the script checks for the existence of the lock file and creates it.

`if [ -e "$L" ]; then:` 
This is an if statement that checks whether the lock file (/var/run/my_cron_job.lock) exists. The -e test is used to check for the existence of a file. If the lock file exists, it means that another instance of the script is already running, and the script proceeds to the next lines.

`echo "another instance is running."`
If the lock file exists (indicating another instance is running), this line prints a message to the console, indicating that another instance of the script is already running.

`exit 1` 
After displaying the message, the script exits with a status code of 1, which typically indicates an error or failure. This is used to signal that the current instance of the script did not proceed further due to the lock file's presence.

`echo $$ > "$L"` 
If the lock file does not exist (indicating no other instance is running), this line creates the lock file (/var/run/my_cron_job.lock) and writes the process ID (PID) of the current instance of the script ($$) to it. This indicates that this instance of the script is currently running and holds the lock.


# Diff Testing!

See the `difftest.sh` for examples to compare the output of programs. This will really help with testing on A1.

Bash has tons of little tools to compare the contents of files and outputs of programs. Here were are using `cmp` with the `-s` flag:
```
cmp -s
```
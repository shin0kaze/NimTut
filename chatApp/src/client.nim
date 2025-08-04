import os, threadpool

echo "Chat application started"
if paramCount() == 0:
  quit "Specify address!"
let serverAddr = paramStr(1)
echo ("Connecting to ", serverAddr)
while true:
  let message = spawn stdin.readLine()
  echo ("Sending \"", ^message)
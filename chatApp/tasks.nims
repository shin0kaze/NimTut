# https://planetisrocks.blogspot.com/2023/04/using-nimscript-for-your-build-system.html
import strutils

task bd, "build and debug using localhost":
#    switch("define", "debug")
#    switch("o", "./chatApp/out/client.exe")
#    setCommand "c", "./chatApp/src/client.nim"
  let compileArgs = @["--define:release", "--o:./chatApp/out/client.exe"].join" "

  exec "nim compile " & compileArgs & " ./chatApp/src/client.nim"
  exec "./chatApp/out/client.exe localhost1"
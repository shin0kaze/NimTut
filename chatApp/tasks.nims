# https://planetisrocks.blogspot.com/2023/04/using-nimscript-for-your-build-system.html
import strutils

task bdl, "build and debug using localhost":
  let compileArgs = @[
    "--define:debug", 
    "--o:./chatApp/out/client.exe",
  ].join" "
  exec "nim compile " & compileArgs & " ./chatApp/src/client.nim"
  exec "./chatApp/out/client.exe localhost1"

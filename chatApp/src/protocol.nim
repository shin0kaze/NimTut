import json

type
  Message* = object
    case valid: bool
    of true:
      name*: string
      message*: string
    else:
      discard


proc parse*(data: string): Message =
  let dataJson = parseJson(data)
  result = Message(valid: true)
  result.name = dataJson{"name"}.getStr()
  result.message = dataJson{"message"}.getStr()
  if (result.name == ""): result = Message(valid: false)

proc encode*(name, message: string): string =
  result = $(%{
    "name": %name,
    "message": %message
  }) & "\c\l"


#region Tests

when isMainModule:

  block:
    let data = """{"name": "John", "message": "Hi!"}"""
    let parsed = parse(data)
    doAssert parsed.name == "John"
    doAssert parsed.message == "Hi!"
    echo("Positive test is passed")

  block:
    let data = """{}"""
    let parsed = parse(data)
    doAssert parsed.valid == false
    echo("Negative test is passed")

  block:
    let data = """wrong format"""
    try:
      discard parse(data)
      doAssert false
    except JsonParsingError:
      doAssert true
    except:
      doAssert false
    echo("Wrong format test is passed")
  block:
    let expected = """{"name":"dom","message":"hello"}""" & "\c\l"
    doAssert encode("dom", "hello") == expected
    echo("Encode test is passed")

#endregion

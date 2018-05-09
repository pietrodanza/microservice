include "console.iol"
include "dependencies.iol"

interface cInterface {
RequestResponse:
  identification(string)(string)
OneWay:
}

interface bInterface {
RequestResponse: identification(string)(string)
OneWay:
}

execution{concurrent}

inputPort bIn {
Location: "socket://localhost:8001"
Protocol: sodep
Interfaces: bInterface
}

outputPort cOut {
Location: JDEP_LOCATION_b_cOut
Protocol: sodep
Interfaces: cInterface
}

main
{

  [identification(request)(response){
    request = request + " B ";
    identification@cOut(request)(response);
    println@Console( request )()
  }]
}

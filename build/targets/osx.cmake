# this file may be used to select different target
# values are among ON or OFF 
# it includes MacOS Specific settings

set ( INCLUDE_EXECUTABLE  ON  CACHE STRING  "Include Faust compiler" FORCE )
set ( INCLUDE_STATIC      ON CACHE STRING  "Include static Faust library" FORCE )
set ( INCLUDE_DYNAMIC     ON CACHE STRING  "Include dynamic Faust library" FORCE )

set ( INCLUDE_OSC         ON  CACHE STRING  "Include Faust OSC static library" FORCE )
set ( INCLUDE_HTTP        ON  CACHE STRING  "Include Faust HTTPD static library" FORCE )

set ( OSCDYNAMIC          OFF CACHE STRING  "Include Faust OSC dynamic library" FORCE )
set ( HTTPDYNAMIC         OFF CACHE STRING  "Include Faust HTTP dynamic library" FORCE )

set ( INCLUDE_ITP         OFF  CACHE STRING  "Include Faust Machine library" FORCE )
set ( ITPDYNAMIC          OFF  CACHE STRING  "Include Faust Machine library" FORCE )

set ( UNIVERSAL 	      ON CACHE STRING  "Compiles and combines i386 and x86_64 architectures" FORCE )
set ( DEPLOYMENT_TARGET   ON  CACHE STRING  "Control MacOS deployment target settings" FORCE )
set ( DEPLOYMENT_TARGET_VERSION 10.11 CACHE STRING "Sets deployment target version (unused when DEPLOYMENT_TARGET is off)" FORCE )

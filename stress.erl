-module(stress).
-compile(export_all).

start(N)->
 io:format(" started ~p ~n",[N]),
 client_inet:start(100),
 io:format(" started ~p ~n",[N+100]), 
 timer:sleep(1000),
 start(N+100).
 
start()-> start(0). 
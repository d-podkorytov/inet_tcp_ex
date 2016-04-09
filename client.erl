-module(client).
-compile(export_all).

% or try use gen_tcp instead inet_tcp
ask() ->
 SomeHostInNet = "localhost", % to make it runnable on one machine
 {ok, Sock} = inet_tcp:connect(SomeHostInNet, 5678, 
 [binary, {packet, 0}]),
 ok = inet_tcp:send(Sock, "Some Data"),
 ok = inet_tcp:close(Sock).
 
loop()->
 ask(),
 loop(). 

% create background endless loops for N threads
create_threads(0)->ok;
create_threads(N)->
 Pid=spawn(fun()->loop() end),
 io:format(" created thread=~p ",[Pid]),
 create_threads(N-1).

start()-> create_threads(100). % create 100 parallel asks endless loops 
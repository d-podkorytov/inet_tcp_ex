-module(client).
-compile(export_all).

% or try use gen_tcp instead inet_tcp
ask() ->
 SomeHostInNet = "localhost", % to make it runnable on one machine
 Res = gen_tcp:connect(SomeHostInNet, 2525, 
 [binary, {packet, 0}]),
 %io:format("Res=~p ~n",[Res]),
 {ok, Sock} = Res,
 ok = gen_tcp:send(Sock, "Some Data"),
 ok = gen_tcp:close(Sock).
 
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
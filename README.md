# Just some tests for TCP in ERLANG for modules gen_tcp and inet_tcp.

## Compilation

1)Edit address, port in client.erl and query string

2)Compile it:
 erlc *.erl

## Using

3)Run erl

$erl

Inside it type:
1) client:start().

It create 100 parallel endless loops with asks by gen_tcp.

If need more, just repeat again client:start() in erl and join next 100 of loops
with asks.

Module client_inet do asks by inet_tcp, it should be faster relative
gen_ctp.

 Run it inside erl like for client module.

1> client_inet:start().



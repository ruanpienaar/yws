-module(yws).

-export([
    info/0
]).

-export([
    start/0,
    run/0
]).

info() ->
    io:format("~s", [os:cmd("curl -vvv http://localhost:8080")]).

start() ->
    {ok, spawn(?MODULE, run, [])}.

run() ->
    io:format("starting yaws on PORT 8080 ! ~n"),
    Id = "my_server",
    GconfList = [{logdir, "log/"},
                 %% {ebin_dir, ["/example1/ebin", "/example2/ebin"]},
                 {id, Id}],
    Docroot = code:priv_dir(yws),
    SconfList = [{docroot, Docroot},
                 {port, 8080},
                 {listen, {127,0,0,1}},
                 {appmods, [{"/", yws_appmod}]}],
    {ok, SCList, GC, ChildSpecs} =
        yaws_api:embedded_start_conf(Docroot, SconfList, GconfList, Id),
    [supervisor:start_child(yws_sup, Ch) || Ch <- ChildSpecs],
    ok = yaws_api:setconf(GC, SCList).
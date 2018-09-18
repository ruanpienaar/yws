-module(yws_app).

-behaviour(application).

%% Application callbacks
-export([
    start/0,
    start/2,
    stop/1
]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start() ->
    application:ensure_all_started(yws).

start(_StartType, _StartArgs) ->
    case yws_sup:start_link() of
        {ok,SupPid} ->
            {ok,SupPid};
        Err ->
            {stop, Err}
    end.

stop(_State) ->
    ok.
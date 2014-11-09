-module(yws_app).

-include_lib("yaws/include/yaws.hrl").

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->    
    case yws_sup:start_link() of 
        {ok,SupPid} ->
            {ok,SupPid};
        Err ->
            {stop,error} %% mmm what was this called again ?
    end.

stop(_State) ->
    ok.
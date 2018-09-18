-module(yws_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1,
         start_child/2
         ]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type),
    {I, {I, start, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

start_child(_,_) ->
    ok.

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok,{{one_for_all,0,1}, [
        ?CHILD(yws, worker)
    ]}}.
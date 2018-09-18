-module(yws_appmod).

-include_lib("yaws/include/yaws_api.hrl").

-export([
    box/1,
    out/1
]).

box(Str) ->
    {'div',[{class,"box"}],
     {pre,[],Str}}.

out(A) ->
    {ehtml,
     [{p,[],
       box(io_lib:format("A#arg.clisock : ~p ~n"
                         "A#arg.client_ip_port : ~p ~n"
                         "A#arg.headers : ~p ~n"
                         "A#arg.req : ~p ~n"
                         "A#arg.orig_req : ~p ~n"
                         "A#arg.clidata : ~p ~n"
                         "A#arg.server_path : ~p ~n"
                         "A#arg.querydata : ~p ~n"
                         "A#arg.appmoddata : ~p ~n"
                         "A#arg.docroot : ~p ~n"
                         "A#arg.docroot_mount : ~p ~n"
                         "A#arg.fullpath : ~p ~n"
                         "A#arg.cont : ~p ~n"
                         "A#arg.state : ~p ~n"
                         "A#arg.pid : ~p ~n"
                         "A#arg.opaque : ~p ~n"
                         "A#arg.appmod_prepath : ~p ~n"
                         "A#arg.prepath : ~p ~n"
                         "A#arg.pathinf : ~p ~n",
                         [ A#arg.clisock,
                           A#arg.client_ip_port,
                           A#arg.headers,
                           A#arg.req,
                           A#arg.orig_req,
                           A#arg.clidata,
                           A#arg.server_path,
                           A#arg.querydata,
                           A#arg.appmoddata,
                           A#arg.docroot,
                           A#arg.docroot_mount,
                           A#arg.fullpath,
                           A#arg.cont,
                           A#arg.state,
                           A#arg.pid,
                           A#arg.opaque,
                           A#arg.appmod_prepath,
                           A#arg.prepath,
                           A#arg.pathinfo
                         ]))}]
    }.
#!/bin/sh
set -x
cd `dirname $0`
exec erl -sname yws -config $PWD/sys.config -pa ebin -pa deps/*/ebin -boot start_sasl -setcookie yws -s yws_app start
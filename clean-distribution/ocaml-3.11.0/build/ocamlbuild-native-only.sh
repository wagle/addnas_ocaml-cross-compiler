#!/bin/sh
# $Id: ocamlbuild-native-only.sh,v 1.3.4.1 2008/10/23 15:29:11 ertai Exp $
set -e
cd `dirname $0`/..
. build/targets.sh
set -x
$OCAMLBUILD $@ native_stdlib_mixed_mode $OCAMLOPT_BYTE $OCAMLLEX_BYTE $OCAMLBUILD_NATIVE

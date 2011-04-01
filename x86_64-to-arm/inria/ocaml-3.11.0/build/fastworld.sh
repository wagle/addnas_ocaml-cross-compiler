#!/bin/sh
# $Id: fastworld.sh,v 1.3.4.1 2008/10/23 15:29:11 ertai Exp $
cd `dirname $0`
set -e
if [ -e ocamlbuild_mixed_mode ]; then
  echo ocamlbuild mixed mode detected
  echo 'please cleanup and re-launch (make clean ; ./build/distclean.sh)'
  exit 1
fi
./mkconfig.sh
./mkmyocamlbuild_config.sh
. ../config/config.sh
if [ "x$EXE" = "x.exe" ]; then
  ./boot-c-parts-windows.sh
else
  ./boot-c-parts.sh
fi
./boot.sh $@

cd ..
. build/targets.sh
OCAMLMKLIB_BYTE="tools/ocamlmklib.byte"
set -x
$OCAMLBUILD $@ -log _boot_fast_log \
  $STDLIB_BYTE $OCAMLOPT_BYTE $STDLIB_NATIVE \
  $OCAMLOPT_NATIVE $OCAMLMKLIB_BYTE $OTHERLIBS_UNIX_NATIVE $OCAMLBUILD_NATIVE

rm -f _build/myocamlbuild
boot/ocamlrun boot/myocamlbuild \
  -just-plugin -install-lib-dir _build/ocamlbuild \
  -ocamlopt "../_build/ocamlopt.opt -nostdlib -I boot -I stdlib -I $UNIXDIR"
cp _build/myocamlbuild boot/myocamlbuild.native

./boot/myocamlbuild.native $@ \
  $OCAMLC_NATIVE $TOPLEVEL $OTHERLIBS_BYTE $OTHERLIBS_NATIVE $OCAMLLEX_BYTE \
  $OCAMLLEX_NATIVE $TOOLS_BYTE $TOOLS_NATIVE $DEBUGGER  \
  $OCAMLDOC_BYTE $OCAMLDOC_NATIVE $OCAMLBUILD_BYTE $CAMLP4_BYTE $CAMLP4_NATIVE

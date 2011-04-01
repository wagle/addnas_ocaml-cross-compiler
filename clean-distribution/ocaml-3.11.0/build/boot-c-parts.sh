#!/bin/sh
# $Id: boot-c-parts.sh,v 1.2 2007/10/08 14:19:34 doligez Exp $
cd `dirname $0`/..
set -ex

# Create a bunch of symlinks to _build/boot
mkdir -p _build/boot
ln -sf ../../byterun/ocamlrun \
       ../../byterun/libcamlrun.a \
       ../../asmrun/libasmrun.a \
       ../../asmrun/libasmrunp.a \
       ../../yacc/ocamlyacc \
       ../../boot/ocamlc \
       ../../boot/ocamllex \
       ../../boot/ocamldep \
       _build/boot

[ -f boot/ocamlrun ] || ln -sf ../byterun/ocamlrun boot

(cd byterun && make)
(cd asmrun && make all meta.o dynlink.o)
(cd yacc && make)

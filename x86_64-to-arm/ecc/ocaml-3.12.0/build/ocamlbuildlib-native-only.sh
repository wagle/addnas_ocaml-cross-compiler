#!/bin/sh

#########################################################################
#                                                                       #
#                            Objective Caml                             #
#                                                                       #
#         Nicolas Pouillard, projet Gallium, INRIA Rocquencourt         #
#                                                                       #
#   Copyright 2008 Institut National de Recherche en Informatique et    #
#   en Automatique.  All rights reserved.  This file is distributed     #
#   under the terms of the GNU Library General Public License, with     #
#   the special exception on linking described in file LICENSE.         #
#                                                                       #
#########################################################################

# $Id: ocamlbuildlib-native-only.sh 10443 2010-05-20 09:44:25Z doligez $

set -e
cd `dirname $0`/..
. build/targets.sh
set -x
$OCAMLBUILD $@ native_stdlib_mixed_mode $OCAMLOPT_BYTE $OCAMLLEX_BYTE $OCAMLBUILDLIB_NATIVE

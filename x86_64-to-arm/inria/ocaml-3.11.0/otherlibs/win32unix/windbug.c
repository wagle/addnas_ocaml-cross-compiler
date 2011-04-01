/***********************************************************************/
/*                                                                     */
/*                           Objective Caml                            */
/*                                                                     */
/*  Contributed by Sylvain Le Gall for Lexifi                          */
/*                                                                     */
/*  Copyright 2008 Institut National de Recherche en Informatique et   */
/*  en Automatique.  All rights reserved.  This file is distributed    */
/*  under the terms of the GNU Library General Public License, with    */
/*  the special exception on linking described in file ../../LICENSE.  */
/*                                                                     */
/***********************************************************************/

/* $Id: windbug.c,v 1.2.2.2 2008/11/26 13:41:01 xleroy Exp $ */

#include <windows.h>
#include <stdio.h>
#include <stdarg.h>
#include "windbug.h"

#ifdef DBUG

static int dbug = 0;

void dbug_init (void)
{
  dbug = (getenv("OCAMLDBUG") != NULL);
}

void dbug_cleanup (void)
{
}

int dbug_test (void)
{
  return dbug;
}

void dbug_print(const char * fmt, ...)
{
  va_list ap;
  if (dbug) {
    va_start(ap, fmt);
    vfprintf(stderr, fmt, ap);
    fprintf(stderr, "\n");
    fflush(stderr);
    va_end(ap);
  }
}

#endif

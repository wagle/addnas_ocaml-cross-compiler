include ../support/Makefile.common

COMPFLAGS= -I ../support -I $(OTHERS)/win32unix -I $(OTHERS)/unix

all: labltkobjs

opt: labltkobjsx

include ./modules

LABLTKOBJS = $(WIDGETOBJS) tk.cmo labltk.cmo
LABLTKOBJSX = $(LABLTKOBJS:.cmo=.cmx)

labltkobjs: $(LABLTKOBJS)

labltkobjsx: $(LABLTKOBJSX)

install:
	if test -d $(INSTALLDIR); then : ; else mkdir $(INSTALLDIR); fi
	cp $(LABLTKOBJS:.cmo=.cmi) $(WIDGETOBJS:.cmo=.mli) $(INSTALLDIR)
	chmod 644 $(INSTALLDIR)/*.cmi

installopt:
	@if test -d $(INSTALLDIR); then : ; else mkdir $(INSTALLDIR); fi
	cp $(LABLTKOBJSX) $(INSTALLDIR)
	chmod 644 $(INSTALLDIR)/*.cmx

clean:
	$(MAKE) -f Makefile.gen clean

.SUFFIXES :
.SUFFIXES : .mli .ml .cmi .cmx .cmo .mlp

.mli.cmi:
	$(CAMLCOMP) $(COMPFLAGS) $<

.ml.cmo:
	$(CAMLCOMP) $(COMPFLAGS) $<

.ml.cmx:
	$(CAMLOPT) -c $(COMPFLAGS) $<

include .depend

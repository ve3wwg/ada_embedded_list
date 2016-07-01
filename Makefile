######################################################################
#  Makefile
######################################################################

include Makefile.incl

all:	tmain

tmain:: clean
	$(GNAT) -g -gnata $(INCL) tmain

clean:
	rm -f *.o *.ali core .errs.t
	rm -f t[0-9][0-9][0-9][0-9]

clobber: clean
	rm -f b~* *.ali *.a core* tmain

distclean: clobber

# End Makefile

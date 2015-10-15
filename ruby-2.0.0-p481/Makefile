SHELL = /bin/sh
NULLCMD = :
n=$(NULLCMD)
ECHO1 = $(V:1=@$n)
RUNCMD = $(SHELL)
CDPATH = .
CHDIR = cd -P
exec = exec
NULL = /dev/null
PATH_SEPARATOR = :

#### Start of system configuration section. ####

srcdir = .
top_srcdir = $(srcdir)
hdrdir = $(srcdir)/include
PLATFORM_DIR = 

CC = gcc
CPP = $(CC) -E
LD = ld
YACC = bison
PURIFY =
AUTOCONF = autoconf

MKFILES = Makefile
BASERUBY = ruby --disable=gems
TEST_RUNNABLE = yes
CROSS_COMPILING = no
DOXYGEN = 

prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
sbindir = ${exec_prefix}/sbin
libdir = ${exec_prefix}/lib
libexecdir = ${exec_prefix}/libexec
datarootdir = ${prefix}/share
datadir = ${datarootdir}
arch = i686-linux
sitearch = ${arch}
sitedir = ${rubylibprefix}/site_ruby
ruby_version = 2.0.0

TESTUI = console
TESTS =
INSTALLDOC = all
DOCTARGETS = rdoc nodoc

EXTOUT = .ext
arch_hdrdir = $(EXTOUT)/include/$(arch)
VPATH = $(arch_hdrdir)/ruby:$(hdrdir)/ruby:$(srcdir)/enc:$(srcdir)/missing

empty =
OUTFLAG = -o $(empty)
COUTFLAG = -o $(empty)
ARCH_FLAG = 
CFLAGS = ${cflags} $(ARCH_FLAG)
cflags =  ${optflags} ${debugflags} ${warnflags}
optflags = -O3 -fno-fast-math
debugflags = -ggdb3
warnflags = -Wall -Wextra -Wno-unused-parameter -Wno-parentheses -Wno-long-long -Wno-missing-field-initializers -Wunused-variable -Wpointer-arith -Wwrite-strings -Wdeclaration-after-statement -Wimplicit-function-declaration -ansi -std=iso9899:199409
INCFLAGS = -I. -I$(arch_hdrdir) -I$(hdrdir) -I$(srcdir)
XCFLAGS = -include ruby/config.h -include ruby/missing.h -D_FORTIFY_SOURCE=2 -fstack-protector -fno-strict-overflow -fvisibility=hidden -DRUBY_EXPORT -fPIE
CPPFLAGS =  $(DEFS) ${cppflags} $(INCFLAGS)
LDFLAGS =  $(CFLAGS) -L. -fstack-protector -rdynamic -Wl,-export-dynamic
EXTLDFLAGS = 
XLDFLAGS = -fstack-protector -pie $(EXTLDFLAGS)
EXTLIBS =
LIBS = -lpthread -lrt -ldl -lcrypt -lm  $(EXTLIBS)
MISSING =  ${LIBOBJDIR}strlcpy.o ${LIBOBJDIR}strlcat.o ${LIBOBJDIR}setproctitle.o ${LIBOBJDIR}addr2line.o 
LDSHARED = $(CC) -shared
DLDFLAGS =  $(XLDFLAGS) $(ARCH_FLAG)
SOLIBS = 
MAINLIBS = 
ARCHMINIOBJS = dmydln.o
DLNOBJ = dln.o
ENCOBJS = 
EXTOBJS = 
BUILTIN_ENCOBJS =  ascii.$(OBJEXT) us_ascii.$(OBJEXT) unicode.$(OBJEXT) utf_8.$(OBJEXT)
BUILTIN_TRANSSRCS =  newline.c
BUILTIN_TRANSOBJS =  newline.$(OBJEXT)
POSTLINK = :

RUBY_BASE_NAME=ruby
RUBY_PROGRAM_VERSION=2.0.0
RUBY_INSTALL_NAME=$(RUBY_BASE_NAME)
RUBY_SO_NAME=$(RUBY_BASE_NAME)
RUBY_RELEASE_DATE=2014-05-08
EXEEXT = 
LIBEXT = a
PROGRAM=$(RUBY_INSTALL_NAME)$(EXEEXT)
RUBY = $(RUBY_INSTALL_NAME)
MINIRUBY = ./miniruby$(EXEEXT) -I$(srcdir)/lib -I. -I$(EXTOUT)/common\
	$(MINIRUBYOPT)
# RUNRUBY_COMMAND:: runruby.rb or baseruby. do not append options directly
RUNRUBY_COMMAND = $(MINIRUBY) $(srcdir)/tool/runruby.rb --extout=$(EXTOUT) $(RUNRUBYOPT)
# RUNRUBY:: run ruby with RUN_OPTS which is passed to ruby
RUNRUBY = $(RUNRUBY_COMMAND) -- $(RUN_OPTS)
# RUNRUBY_DEBUGGER:: debugging option for runruby.rb
RUNRUBY_DEBUGGER = --debugger='gdb -x run.gdb --quiet --args'
XRUBY = $(RUNRUBY)
BTESTRUBY = $(MINIRUBY)\
	$(MINIRUBYOPT)
INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_SCRIPT = ${INSTALL}
INSTALL_PROGRAM = ${INSTALL}
XRUBY_LIBDIR = 
XRUBY_RUBYLIBDIR = 
XRUBY_RUBYHDRDIR = 

DEFAULT_PRELUDES = $(YES_GEM_PRELUDE)

#### End of system configuration section. ####

MAJOR=	2
MINOR=	0
TEENY=	0

LIBRUBY_A     = lib$(RUBY_SO_NAME)-static.a
LIBRUBY_SO    = lib$(RUBY_SO_NAME).so.$(MAJOR).$(MINOR).$(TEENY)
LIBRUBY_ALIASES= lib$(RUBY_SO_NAME).so
LIBRUBY	      = $(LIBRUBY_A)
LIBRUBYARG    = $(LIBRUBYARG_STATIC)
LIBRUBYARG_STATIC = -Wl,-R -Wl,$(libdir) -L$(libdir) -l$(RUBY_SO_NAME)-static
LIBRUBYARG_SHARED = -Wl,-R -Wl,$(libdir) -L$(libdir) 
LIBRUBY_RELATIVE = no
LIBRUBY_A_OBJS = $(OBJS)

THREAD_MODEL  = pthread

PREP          = miniruby$(EXEEXT)
ARCHFILE      = 
SETUP         =
EXTSTATIC     = 
SET_LC_MESSAGES = env LC_MESSAGES=C

MAKEDIRS      = /bin/mkdir -p
CP            = cp
MV            = mv
RM            = rm -f
RMDIR         = rmdir --ignore-fail-on-non-empty
RMDIRS        = rmdir --ignore-fail-on-non-empty -p
RMALL         = rm -fr
NM            = nm
AR            = ar
ARFLAGS       = rcu
RANLIB        = ranlib
AS            = as
ASFLAGS       =  $(INCFLAGS)
IFCHANGE      = $(srcdir)/tool/ifchange
SET_LC_MESSAGES = env LC_MESSAGES=C
OBJDUMP       = objdump
OBJCOPY       = :
VCS           = echo cannot
VCSUP         = $(VCS)
DTRACE        = 
DTRACE_EXT    = dmyh
DTRACE_OBJ   = 
DTRACE_GLOMMED_OBJ = 

OBJEXT        = o
ASMEXT        = S
DLEXT         = so
MANTYPE	      = doc
SYMBOL_PREFIX = 

INSTALLED_LIST= .installed.list

MKMAIN_CMD    = mkmain.sh

NEWLINE_C     = newline.c
MINIPRELUDE_C = miniprelude.c
RBCONFIG      = .rbconfig.time

SRC_FILE      = $<
OS_SRC_FILE   = $<
DEST_FILE     = $@
OS_DEST_FILE  = $@

MESSAGE_BEGIN = @for line in
MESSAGE_END = ; do echo "$$line"; done

configure_args =  '--prefix=/usr/local'
#### End of variables

.SUFFIXES: .inc .h .c .y .i .$(DTRACE_EXT)

all:

.DEFAULT: all

# Prevent GNU make v3 from overflowing arg limit on SysV.
.NOEXPORT:

miniruby$(EXEEXT):
		@-if test -f $@; then $(MV) -f $@ $@.old; $(RM) $@.old; fi
		$(ECHO) linking $@
		$(Q) $(PURIFY) $(CC) $(LDFLAGS) $(XLDFLAGS) $(NORMALMAINOBJ) $(MINIOBJS) $(COMMONOBJS) $(DMYEXT) $(DTRACE_OBJ) $(MAINLIBS) $(LIBS) $(OUTFLAG)$@

$(PROGRAM):
		@$(RM) $@
		$(ECHO) linking $@
		$(Q) $(PURIFY) $(CC) $(LDFLAGS) $(XLDFLAGS) $(MAINOBJ) $(EXTOBJS) $(LIBRUBYARG) $(MAINLIBS) $(LIBS) $(EXTLIBS) $(OUTFLAG)$@
		$(Q) $(POSTLINK)

# We must `rm' the library each time this rule is invoked because "updating" a
# MAB library on Apple/NeXT (see --enable-fat-binary in configure) is not
# supported.
$(LIBRUBY_A):
		@$(RM) $@
		$(ECHO) linking static-library $@
		$(Q) $(AR) $(ARFLAGS) $@ $(LIBRUBY_A_OBJS) $(DMYEXT)
		@-$(RANLIB) $@ 2> /dev/null || true
		$(ECHO) verifying static-library $@
		@$(PURIFY) $(CC) $(XLDFLAGS) $(MAINOBJ) $(LIBRUBY_A) $(MAINLIBS) $(EXTLIBS) $(LIBS) $(OUTFLAG)conftest$(EXEEXT) $(LDFLAGS)
		@$(RM) conftest$(EXEEXT) conftest.c

$(LIBRUBY_SO):
		@-$(PRE_LIBRUBY_UPDATE)
		$(ECHO) linking shared-library $@
		$(Q) $(LDSHARED) $(DLDFLAGS) $(OBJS) $(DLDOBJS) $(DTRACE_OBJ) $(SOLIBS) $(EXTSOLIBS) $(OUTFLAG)$@
		-$(Q) $(OBJCOPY) -w -L '$(SYMBOL_PREFIX)Init_*' -L '$(SYMBOL_PREFIX)*_threadptr_*' $@
		$(Q) $(POSTLINK)
		@-$(MINIRUBY) -e 'ARGV.each{|link| File.delete link if File.exist? link; \
						  File.symlink "$(LIBRUBY_SO)", link}' \
				$(LIBRUBY_ALIASES) || true
$(arch)-fake.rb: config.status $(srcdir)/template/fake.rb.in
		@./config.status --file=$@:$(srcdir)/template/fake.rb.in
		@chmod +x $@

ruby_pc = ruby-2.0.pc
$(ruby_pc):
		@./config.status --file=$@:$(srcdir)/template/ruby.pc.in

install-cross: $(arch)-fake.rb $(RBCONFIG) rbconfig.rb $(arch_hdrdir)/ruby/config.h \
	$(LIBRUBY_A) $(LIBRUBY_SO) $(ARCHFILE)
	$(ECHO) installing cross-compiling stuff
	$(Q) $(MAKEDIRS) $(XRUBY_RUBYLIBDIR)/$(arch) $(XRUBY_RUBYHDRDIR)/$(arch)/ruby
	$(Q) sed '/^\$$:\.unshift/q' $(arch)-fake.rb > fake.rb
	$(Q) $(BASERUBY) -p \
	-e '~/^\s*CONFIG\["LDFLAGS"\]/ and' \
	-e '$$_[/(?=\s*"$$)/] = %q[ #{(CONFIG["LIBPATHFLAG"]%File.dirname(__FILE__)).strip}]' \
	rbconfig.rb > fake-rbconfig.rb
	$(INSTALL_SCRIPT) fake.rb $(XRUBY_RUBYLIBDIR)/$(arch)/fake.rb
	$(INSTALL_SCRIPT) fake-rbconfig.rb $(XRUBY_RUBYLIBDIR)/$(arch)/rbconfig.rb
	@$(RM) fake.rb fake-rbconfig.rb
	$(INSTALL_DATA) $(arch_hdrdir)/ruby/config.h $(XRUBY_RUBYHDRDIR)/$(arch)/ruby
	$(INSTALL_DATA) $(top_srcdir)/include/ruby/win32.h $(XRUBY_RUBYHDRDIR)/ruby
	$(INSTALL_DATA) $(LIBRUBY) $(LIBRUBY_A) $(XRUBY_RUBYLIBDIR)/$(arch)
	$(INSTALL_PROGRAM) $(LIBRUBY_SO) $(XRUBY_RUBYLIBDIR)/$(arch)

Makefile:	$(srcdir)/Makefile.in $(srcdir)/enc/Makefile.in

$(MKFILES): config.status
		@[ -f Makefile ] && mv Makefile Makefile.old
		MAKE=$(MAKE) $(SHELL) ./config.status
		@cmp Makefile Makefile.old > /dev/null 2>&1 && echo Makefile unchanged && exit 0; \
		{ \
		    echo "all:; -@rm -f conftest.mk"; \
		    echo "conftest.mk: .force; @echo AUTO_REMAKE"; \
		    echo ".force:"; \
		} > conftest.mk || exit 1; \
		$(MAKE) -f conftest.mk | grep '^AUTO_REMAKE$$' >/dev/null 2>&1 || \
		{ echo "Makefile updated, restart."; exit 1; }

uncommon.mk: $(srcdir)/common.mk
		sed 's/{\$$([^(){}]*)[^{}]*}//g' $< > $@

.PHONY: reconfig
reconfig-args = $(srcdir)/configure $(configure_args)
config.status-args = ./config.status --recheck
reconfig-exec-0 = exec 3>&1; exit `exec 4>&1; { "$$@" 3>&- 4>&-; echo $$? 1>&4; } | fgrep -v '(cached)' 1>&3`
reconfig-exec-1 = set -x; "$$@"

reconfig config.status:	$(srcdir)/configure $(srcdir)/enc/Makefile.in \
			$(srcdir)/include/ruby/version.h
	@PWD= MINIRUBY="$(MINIRUBY)"; export MINIRUBY; \
	set $(SHELL) $($@-args); $(reconfig-exec-$(V))

$(srcdir)/configure: $(srcdir)/configure.in
	$(CHDIR) $(srcdir) && exec $(AUTOCONF)

incs: id.h
all-incs: probes.h

# Things which should be considered:
# * with gperf v.s. without gperf
# * committers may have various versions of gperf
# * ./configure v.s. ../ruby/configure
# * GNU make v.s. HP-UX make	# HP-UX make invokes the action if lex.c and keywords has same mtime.
# * svn checkout generate a file with mtime as current time
# * ext4 and XFS has a mtime with fractional part
lex.c: defs/keywords
	@\
	if cmp -s $(srcdir)/defs/lex.c.src $?; then \
	  [ $(Q) ] && echo copying $@ || set -x; \
	  $(CP) $(srcdir)/lex.c.blt $@; \
	else \
	  [ $(Q) ] && echo generating $@ || set -x; \
	  gperf -C -p -j1 -i 1 -g -o -t -N rb_reserved_word -k1,3,$$ $? > $@.tmp && \
	  $(MV) $@.tmp $@ && \
	  $(CP) $? $(srcdir)/defs/lex.c.src && \
	  $(CP) $@ $(srcdir)/lex.c.blt; \
	fi

NAME2CTYPE_OPTIONS = -7 -c -j1 -i1 -t -C -P -T -H uniname2ctype_hash -Q uniname2ctype_pool -N uniname2ctype_p

enc/unicode/name2ctype.h: enc/unicode/name2ctype.kwd
	$(MAKEDIRS) $(@D)
	@set +e; \
	if cmp -s $(?:.kwd=.src) $?; then \
	  set -x; \
	  $(CP) $(?:.kwd=.h.blt) $@; \
	else \
	  trap '$(RM) $@-1.h $@-2.h' 0 && \
	  set -x; \
	  sed '/^#ifdef USE_UNICODE_PROPERTIES/,/^#endif/d' $? | gperf $(NAME2CTYPE_OPTIONS) > $@-1.h && \
	  sed '/^#ifdef USE_UNICODE_PROPERTIES/d;/^#endif/d' $? | gperf $(NAME2CTYPE_OPTIONS) > $@-2.h && \
	  diff -DUSE_UNICODE_PROPERTIES $@-1.h $@-2.h > $@.tmp || :; \
	  $(MV) $@.tmp $@ && \
	  $(CP) $? $(?:.kwd=.src) && \
	  $(CP) $@ $(?:.kwd=.h.blt); \
	fi

.c.o:
	@$(ECHO) compiling $<
	$(Q) $(CC) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(COUTFLAG)$@ -c $<

.s.o:
	@$(ECHO) assembling $<
	$(Q) $(AS) $(ASFLAGS) -o $@ $<

.c.S:
	@$(ECHO) translating $<
	$(Q) $(CC) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(COUTFLAG)$@ -S $<

.c.i:
	@$(ECHO) preprocessing $<
	$(Q) $(CPP) $(warnflags) $(XCFLAGS) $(CPPFLAGS) $(COUTFLAG)$@ -E $< > $@

.d.h:
	@$(ECHO) translating probes $<
	$(Q) $(DTRACE) -o $@.tmp -h -C $(INCFLAGS) -s $<
	$(Q) sed -e 's/RUBY_/RUBY_DTRACE_/g' -e 's/PROBES_H_TMP/PROBES_H/g' -e 's/(char \*/(const char */g' -e 's/, char \*/, const char */g' $@.tmp > $@
	$(Q) $(RM) $@.tmp

.dmyh.h:
	@$(ECHO) copying dummy $(DEST_FILE)
	$(Q) $(CP) $(OS_SRC_FILE) $(OS_DEST_FILE)

probes.o: $(srcdir)/probes.d
	@$(ECHO) processing probes in object files
	$(Q) stamp="$*.stamp"; \
	  if test -f "$$stamp" -o -f "$@"; then \
	  $(RM) $(DTRACE_DEPENDENT_OBJS) "$$stamp"; \
	  for o in $(DTRACE_DEPENDENT_OBJS); do \
	    echo "rebuilding $$o which was modified by \"dtrace -G\""; \
	    $(MAKE) "$$o"; \
	  done; \
	fi; \
	touch "$$stamp"
	$(RM) $@
	$(Q) $(DTRACE) -G -C $(INCFLAGS) -s $(srcdir)/probes.d -o $@ $(DTRACE_DEPENDENT_OBJS)

# DTrace static library hacks described here:
# http://mail.opensolaris.org/pipermail/dtrace-discuss/2005-August/000207.html
ruby-glommed.$(OBJEXT):
	@$(ECHO) generating a glommed object with DTrace probes for static library
	$(Q) $(LD) -r -o $@ $(OBJS) $(DTRACE_OBJ)

clean-local::
	$(Q)$(RM) ext/extinit.c ext/extinit.$(OBJEXT) ext/ripper/y.output \
		enc/encinit.c enc/encinit.$(OBJEXT)
	-$(Q)$(RM) $(pkgconfig_DATA)

distclean-local::
	$(Q)$(RM) ext/config.cache $(RBCONFIG) Doxyfile
	-$(Q)$(RM) run.gdb
	-$(Q)$(RM) $(INSTALLED_LIST) $(arch_hdrdir)/ruby/config.h verconf.h
	-$(Q)$(RMDIRS) $(arch_hdrdir)/ruby 2> /dev/null || true

clean-ext distclean-ext realclean-ext::
	@cd ext 2>/dev/null || exit 0; set dummy `echo "${EXTS}" | tr , ' '`; shift; \
	test "$$#" = 0 && set .; \
	set dummy `\
	    find "$$@" -name Makefile -print | sed 's:^\./::;s:/Makefile$$:~:' | sort | sed 's:~$$::'; \
	`; shift; \
	cd ..; \
	for dir do \
	    echo $(@:-ext=)ing "$$dir"; \
	    (cd "ext/$$dir" && exec $(MAKE) $(MFLAGS) $(@:-ext=)) && \
	    case "$@" in \
	    *distclean-ext*|*realclean-ext*) \
		$(RMDIRS) "ext/$$dir" 2> /dev/null || true;; \
	    esac; \
	done
	-$(Q)$(RM) ext/extinit.$(OBJEXT)

distclean-ext realclean-ext::
	-$(Q)$(RM) ext/extinit.c
	-$(Q)$(RMDIR) ext 2> /dev/null || true

clean-extout:
	-$(Q)$(RMDIRS) $(EXTOUT) 2> /dev/null || true

clean-enc distclean-enc realclean-enc:
	@test -f "$(ENC_MK)" || exit 0; \
	echo $(@:-enc=ing) encodings; \
	exec $(MAKE) -f $(ENC_MK) $(MFLAGS) $(@:-enc=)

clean-rdoc distclean-rdoc realclean-rdoc:
	@echo $(@:-rdoc=ing) rdoc
	$(Q)$(RMALL) $(RDOCOUT)
clean-capi distclean-capi realclean-capi:
	@echo $(@:-capi=ing) capi
	$(Q)$(RMALL) $(CAPIOUT)

clean-platform:
	@$(RM) $(PLATFORM_D)
	-$(Q) $(RMDIR) $(PLATFORM_DIR) 2> /dev/null || true

ext/extinit.$(OBJEXT): ext/extinit.c $(SETUP)
	$(ECHO) compiling $@
	$(Q) $(CC) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(COUTFLAG)$@ -c ext/extinit.c

enc/encinit.$(OBJEXT): enc/encinit.c $(SETUP)

up::
	@$(CHDIR) "$(srcdir)" && LC_TIME=C exec $(VCSUP)

update-mspec:
	@$(CHDIR) $(srcdir); \
	if [ -d spec/mspec ]; then \
	  cd spec/mspec; \
	  echo updating mspec ...; \
	  exec git pull; \
	else \
	  echo retrieving mspec ...; \
	  exec git clone $(MSPEC_GIT_URL) spec/mspec; \
	fi

update-rubyspec: update-mspec
	@$(CHDIR) $(srcdir); \
	if [ -d spec/rubyspec ]; then \
	  cd spec/rubyspec; \
	  echo updating rubyspec ...; \
	  exec git pull; \
	else \
	  echo retrieving rubyspec ...; \
	  exec git clone $(RUBYSPEC_GIT_URL) spec/rubyspec; \
	fi

test-rubyspec-precheck:
	@if [ ! -d $(srcdir)/spec/rubyspec ]; then echo No rubyspec here.  make update-rubyspec first.; exit 1; fi

INSNS	= opt_sc.inc optinsn.inc optunifs.inc insns.inc insns_info.inc \
	  vmtc.inc vm.inc

$(INSNS): $(srcdir)/insns.def vm_opts.h \
	  $(srcdir)/defs/opt_operand.def $(srcdir)/defs/opt_insn_unif.def \
	  $(srcdir)/tool/instruction.rb $(srcdir)/tool/insns2vm.rb
	$(ECHO) generating $@
	$(Q) $(BASERUBY) -Ku $(srcdir)/tool/insns2vm.rb $(INSNS2VMOPT) $@

distclean-local::; @$(RM) GNUmakefile uncommon.mk

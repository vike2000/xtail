dnl Process this file with autoconf to produce a configure script.
AC_INIT
AC_CONFIG_SRCDIR([xtail.c])
AC_CONFIG_HEADERS([config.h])

dnl Checks for programs.
AC_PROG_INSTALL
AC_PROG_CC
if test "$GCC" = yes; then
    CFLAGS="-Wall $CFLAGS"
fi

dnl Checks for libraries.

dnl Checks for header files.
AC_HEADER_DIRENT
AC_CHECK_HEADERS(stdlib.h unistd.h termios.h)

dnl Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_TYPE_OFF_T
AC_STRUCT_TM

dnl Checks for library functions.
AC_CACHE_CHECK([return type of signal handlers],[ac_cv_type_signal],[AC_COMPILE_IFELSE(
[AC_LANG_PROGRAM([#include <sys/types.h>
#include <signal.h>
],
		 [return *(signal (0, 0)) (0) == 1;])],
		   [ac_cv_type_signal=int],
		   [ac_cv_type_signal=void])])
AC_DEFINE_UNQUOTED([RETSIGTYPE],[$ac_cv_type_signal],[Define as the return type of signal handlers
		    ('int' or 'void').])

AC_CHECK_FUNCS(difftime strerror)

AC_CONFIG_FILES([Makefile])
AC_OUTPUT

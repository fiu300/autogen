#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([helloworld], [1.0], [15118083560@163.com])
AM_INIT_AUTOMAKE(helloworld,1.0)

AC_CONFIG_SRCDIR([src/hello.c])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile
		src/Makefile])
#AC_CONFIG_MACRO_DIRS([m4])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.
AC_PROG_LIBTOOL

# Checks for header files.
AC_CHECK_HEADER([stddef.h string.h])
# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_TYPE_SIZE_T
# Checks for library functions.
AC_FUNC_REALLOC
AC_CHECK_FUNCS([memset socket])

AC_OUTPUT

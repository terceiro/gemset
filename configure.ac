AC_INIT(gemset, 0.1.0, terceiro@softwarelivre.org)
AM_INIT_AUTOMAKE([foreign])

AC_CHECK_PROG([HAVE_GEM], [gem], [yes], [no])
AS_IF([test "x$HAVE_GEM" = xno],
      [AC_MSG_FAILURE(Program 'gem' not found in your PATH. Get Rubygems at http://rubygems.org/ and install it!)]
      )

AC_CONFIG_FILES([Makefile test/Makefile])
AC_OUTPUT

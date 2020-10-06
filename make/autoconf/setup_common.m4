
AC_CANONICAL_BUILD
AC_CANONICAL_HOST

SRC_ROOT="$(pwd -L)"
AC_SUBST(SRC_ROOT)

CONF_NAME="${host_cpu}-${host_vendor}-${host_os}"
AC_SUBST(CONF_NAME)

BUILD_ROOT="$SRC_ROOT/build"
AC_SUBST(BUILD_ROOT)

OUTPUT_ROOT="$SRC_ROOT/build/${CONF_NAME}"
AC_SUBST(OUTPUT_ROOT)

mkdir -p "$OUTPUT_ROOT"

AC_CONFIG_FILES([$OUTPUT_ROOT/spec.gmk:$SRC_ROOT/make/autoconf/spec.gmk.in])
AC_CONFIG_FILES([$OUTPUT_ROOT/Makefile:$SRC_ROOT/make/autoconf/Makefile.in])

# Make sure config.status ends up in the build directory instead of the src root.
CONFIG_STATUS="$OUTPUT_ROOT/config.status"

function macos_help {
    echo "$@"
}

function linux_help {
    echo "$@"
}

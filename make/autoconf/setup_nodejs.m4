
export PATH=./node_modules/.bin:$PATH

######################################################
#
# NodeJS
#
AC_PATH_PROG(NODE, node, [x])
AC_SUBST(NODE)

if test x$NODE = x
then
    echo Command node not found, please install.
    echo sudo apt install nodejs
    echo brew install node
    exit 1
fi

NODE_VERSION="$($NODE -v)"
AC_SUBST(NODE_VERSION)

######################################################
#
# npm, usually part of nodejs install above.
#
AC_PATH_PROG(REAL_NPM, npm, [x])
AC_SUBST(REAL_NPM)

if test x$REAL_NPM = x
then
    echo Command npm not found, please install.
    echo sudo apt install nodejs
    echo brew install node
    exit 1
fi

REAL_NPM_FLAGS="--quiet --silent --no-fund --no-progress --no-audit"
AC_SUBST(REAL_NPM_FLAGS)

REAL_NPM_VERSION="$($REAL_NPM -v)"
AC_SUBST(REAL_NPM_VERSION)

######################################################
#
# npx, usually part of nodejs install above.
#
AC_PATH_PROG(REAL_NPX, npx, [x])
AC_SUBST(REAL_NPX)

if test x$REAL_NPX = x
then
    echo Command npx not found, please install.
    echo sudo apt install nodejs
    echo brew install node
    exit 1
fi

REAL_NPX_FLAGS=""
AC_SUBST(REAL_NPX_FLAGS)

REAL_NPX_VERSION="$($REAL_NPX -v)"
AC_SUBST(REAL_NPX_VERSION)

######################################################
#
# pnpm must be installed using npm.
#
AC_PATH_PROG(REAL_PNPM, pnpm, [x])
AC_SUBST(REAL_PNPM)

if test x$REAL_PNPM = x
then
    echo Command pnpm not found, please install.
    echo sudo npm install -g pnpm
    exit 1
fi

REAL_PNPM_FLAGS="--silent"
AC_SUBST(REAL_PNPM_FLAGS)

REAL_PNPM_VERSION="$($REAL_PNPM -v)"
AC_SUBST(REAL_PNPM_VERSION)

######################################################
#
# pnpx, usually part of pnpm install above.
#
AC_PATH_PROG(REAL_PNPX, pnpx, [x])
AC_SUBST(REAL_PNPX)

if test x$REAL_PNPX = x
then
    echo Command pnpx not found, please install.
    echo sudo npm install -g pnpm
    exit 1
fi

REAL_PNPX_FLAGS="--silent"
AC_SUBST(REAL_PNPX_FLAGS)

REAL_PNPX_VERSION="$($REAL_PNPX -v)"
AC_SUBST(REAL_PNPX_VERSION)

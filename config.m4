dnl lines starting with "dnl" are comments

PHP_ARG_ENABLE(riak, whether to enable Riak extension, [  --enable-riak   Enable Riak extension])

if test "$PHP_RIAK" != "no"; then

  AC_DEFINE(PHP_SESSION,1,[riak session])

  dnl this defines the extension
  PHP_NEW_EXTENSION(riak, php_riak.c \
    ht_utils.c \
    riak_session.c \
    Riak/connection.c \
    Riak/bucket.c \
    Riak/object.c \
    Riak/exceptions.c \
    Riak/bucket_properties.c \
    Riak/pool.c \
    Riak/link.c \
    Riak/pool_info.c \
    Riak/MapReduce/mapreduce.c \
    Riak/MapReduce/mr_phase.c \
    Riak/MapReduce/mr_functions.c \
    Riak/MapReduce/mr_inputs.c \
    Riak/MapReduce/mr_output.c \ 
    Riak/search.c \
    Riak/streaming.c \
    Riak/req_inputs.c \
    Riak/req_outputs.c \
    riack/src/riack_sock.c \
    riack/src/riack.c \
    riack/src/riack_kv.c \
    riack/src/riack_search.c \
    riack/src/riack_msg.c \
    riack/src/riack_mem.c \
    riack/src/riack_helpers.c \
    riack/src/protocol/riak_msg_codes.c \
    riack/src/protocol/riak_search.pb-c.c \
    riack/src/protocol/riak.pb-c.c \
    riack/src/protocol/riak_kv.pb-c.c \
    riack/src/google/protobuf-c/protobuf-c.c, $ext_shared)

  PHP_ADD_BUILD_DIR([$ext_builddir/riack/src], 1)
  PHP_ADD_INCLUDE([$ext_builddir/riack/src])
  PHP_ADD_INCLUDE([$ext_srcdir/riack/src])

  PHP_ADD_BUILD_DIR([$ext_builddir/riack/src/protocol], 1)
  PHP_ADD_INCLUDE([$ext_builddir/riack/src/protocol])
  PHP_ADD_INCLUDE([$ext_srcdir/riack/src/protocol])

  PHP_ADD_BUILD_DIR([$ext_builddir/riack/src/google/protobuf-c], 1)
  PHP_ADD_INCLUDE([$ext_builddir/riack/src/google/protobuf-c])
  PHP_ADD_INCLUDE([$ext_srcdir/riack/src/google/protobuf-c])

  dnl this is boilerplate to make the extension work on OS X
  case $build_os in
  darwin1*.*.*)
    AC_MSG_CHECKING([whether to compile for recent osx architectures])
    CFLAGS="$CFLAGS -arch i386 -arch x86_64 -mmacosx-version-min=10.5"
    AC_MSG_RESULT([yes])
    ;;
  darwin*)
    AC_MSG_CHECKING([whether to compile for every osx architecture ever])
    CFLAGS="$CFLAGS -arch i386 -arch x86_64 -arch ppc -arch ppc64"
    AC_MSG_RESULT([yes])
    ;;
  esac
fi

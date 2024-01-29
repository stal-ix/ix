{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/AppImage/AppImageKit
{% endblock %}

{% block git_commit %}
701b711f42250584b65a88f6427006b1d160164d
{% endblock %}

{% block git_sha %}
1db0a4f783bcba385df5486652bbca8658005fd139be91a0af83aec497eb7490
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/glib
lib/cairo
lib/gcrypt
lib/gpg/me
lib/kernel
lib/archive
lib/openssl
lib/squashfs/fuse/patched
{% endblock %}

{% block bld_tool %}
bin/xxd
bld/auto
bld/make
bld/fake/binutils
bld/fake(tool_name=wget)
bld/fake(tool_name=desktop-file-validate)
{% endblock %}

{% block cpp_defines %}
__END_DECLS=
__BEGIN_DECLS=
_GNU_SOURCE=1
LOAD_LIBRARY=
{% endblock %}

{% block setup %}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block cmake_flags %}
USE_SYSTEM_XZ=ON
USE_SYSTEM_SQUASHFUSE=ON
USE_SYSTEM_LIBARCHIVE=ON
USE_SYSTEM_MKSQUASHFS=ON
{% endblock %}

{% block patch %}
(
cat - src/runtime.c << EOF
#include <stdlib.h>
#include "../lib/libappimage/include/appimage/appimage.h"
EOF
) | sed -e 's|squashfuse_dlopen.h|squashfuse.h|' > _
mv _ src/runtime.c
{% endblock %}

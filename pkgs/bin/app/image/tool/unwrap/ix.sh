{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/AppImage/AppImageKit
{% endblock %}

{% block git_commit %}
701b711f42250584b65a88f6427006b1d160164d
{% endblock %}

{% block git_sha %}
cee7579d205ce4014952fdf634742113900da1d93f3b1a554baaed08f3f3c747
{% endblock %}

{% block git_version %}
v2
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
lib/argp/standalone
lib/squashfs/fuse/patched
{% endblock %}

{% block bld_tool %}
bin/xxd
bld/auto
bld/make
bld/bash
bld/shebangs
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

{% block setup_target_flags %}
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
AUXILIARY_FILES_DESTINATION=
{% endblock %}

{% block patch %}
fix_shebangs src/embed-magic-bytes-in-file.sh
(
cat - src/runtime.c << EOF
#include <stdlib.h>
#include "../lib/libappimage/include/appimage/appimage.h"
EOF
) | sed -e 's|squashfuse_dlopen.h|squashfuse.h|' > _
mv _ src/runtime.c
{% endblock %}

{% block install %}
{{super()}}
cp ${tmp}/obj/src/runtime ${out}/bin/
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/rizinorg/rizin/releases/download/v0.4.0/rizin-src-v0.4.0.tar.xz
sha:09eba8684fe813cf42a716b59a86d3d65afce013d7e8b275e145e849d3366b5a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/uv
lib/lz4
lib/zip
lib/linux
lib/magic
lib/xxhash
lib/openssl
lib/cap/stone
{% endblock %}

{% block meson_flags %}
blob=true
static_runtime=true
enable_tests=false
enable_rz_test=false
use_sys_capstone=enabled
use_sys_magic=enabled
use_sys_libzip=enabled
use_sys_zlib=enabled
use_sys_lz4=enabled
use_sys_xxhash=enabled
use_sys_openssl=enabled
use_sys_libuv=enabled
{% endblock %}

{% block meson_strip_wrap %}
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|include <capstone.h>|include <capstone/capstone.h>|' -i "${l}"
done
{% endblock %}

{% block c_rename_symbol %}
buffer_init
{% endblock %}

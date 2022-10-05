{% extends '//bin/cmake/t/ix.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v3.24.1.tar.gz
sha:fe7fd2eb0ecee1c0ad829bca77ac7b516fdb7a982e862fc47ef8df54e714dbc3
{% endblock %}

{% block bld_libs %}
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% if linux %}
bld/boot/7/lib/linux
{% endif %}
bld/boot/7/lib/cxx
{% endblock %}

{% block bld_deps %}
bld/boot/7/samurai
bld/boot/6/env/std
{% endblock %}

{% block run_deps %}
bld/boot/7/samurai
{% endblock %}

{% block cmake_binary %}
Bootstrap.cmk/cmake
{% endblock %}

{% block patch %}
sed -e 's|# Run bootstrap CMake|exit 0;|' -i bootstrap
sed -e 's|.*define.*HAS_INTEL.*||' -i Utilities/cmlibrhash/librhash/byte_order.h
{{super()}}
{% endblock %}

{% block cpp_defines %}
ZSTD_NO_INTRINSICS=1
{% endblock %}

{% block cmake_flags %}
CMAKE_USE_OPENSSL=OFF
CMAKE_BOOTSTRAP=1
{% endblock %}

{% block configure %}
sh bootstrap \
    --prefix=${out}   \
    --generator=Ninja \
    --parallel=${make_thrs}
{{super()}}
{% endblock %}

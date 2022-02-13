{% extends '//bin/cmake/mix.sh' %}

{% block bld_libs %}
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% if linux %}
boot/7/lib/linux
{% endif %}
boot/7/lib/cxx
{% endblock %}

{% block bld_deps %}
boot/7/samurai
boot/6/env/std
{% endblock %}

{% block run_deps %}
boot/7/samurai
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
BUILD_TESTING=OFF
CMAKE_BOOTSTRAP=1
{% endblock %}

{% block configure %}
sh bootstrap \
    --prefix=${out}   \
    --generator=Ninja \
    --parallel=${make_thrs}
{{super()}}
{% endblock %}

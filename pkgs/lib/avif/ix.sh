{% extends '//lib/avif/t/ix.sh' %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/libavif.pc
sed -e 's|LINK_ONLY:Threads::Threads|LINK_ONLY:c|' -i ${out}/lib/cmake/libavif/libavif-config.cmake
{% endblock %}

{% block cmake_flags %}
{{super()}}
# hack to install cmake/ files
VCPKG_TARGET_TRIPLET=ON
AVIF_BUILD_APPS=OFF
{% endblock %}

{% block test %}
test -d ${out}/lib/cmake/libavif
{% endblock %}

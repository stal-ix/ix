{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KDE/kimageformats/archive/refs/tags/v5.112.0.tar.gz
sha:e2d0b190b09e84de6cb01bf2282b808790f87d188d6b48be476a89d469dc83a1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/heif
lib/avif
lib/k/ecm
lib/openexr
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}

{% block cmake_flags %}
KIMAGEFORMATS_HEIF=ON
{% endblock %}

{% block install %}
{{super()}}
find ${out}/lib/plugins -name '*.a' -type f | while read l; do
    cp ${l} ${out}/lib/
done
{% endblock %}

{% block cpp_defines %}
QT_STATICPLUGIN
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.14.2.tar.gz
sha:e9c88e75e3b7fad9df32e42d28646752de2679df57efddfb3f63cd25110ce9d9
{% endblock %}

{% block lib_deps %}
lib/c
lib/aom
lib/x265
lib/de265
lib/dav1d
lib/svt/av1
{% endblock %}

{% block cmake_flags %}
ENABLE_PLUGIN_LOADING=OFF
WITH_RAV1E_PLUGIN=OFF
WITH_SvtEnc_PLUGIN=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*Libs.*stdc.*||' -i ${out}/lib/pkgconfig/libheif.pc
{% endblock %}

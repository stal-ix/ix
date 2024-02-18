{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/glog/archive/refs/tags/v0.7.0.tar.gz
sha:375106b5976231b92e66879c1a92ce062923b9ae573c42b56ba28b112ee4cc11
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gflags
lib/execinfo
{% endblock %}

{% block cmake_flags %}
WITH_PKGCONFIG=ON
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*/bin.*||' -i ${out}/lib/pkgconfig/libglog.pc
{% endblock %}

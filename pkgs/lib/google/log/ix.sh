{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/glog/archive/refs/tags/v0.7.1.tar.gz
sha:00e4a87e87b7e7612f519a41e491f16623b12423620006f59f5688bfd8d13b08
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

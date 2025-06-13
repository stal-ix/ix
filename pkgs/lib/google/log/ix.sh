{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glog
{% endblock %}

{% block version %}
0.7.1
{% endblock %}

{% block fetch %}
https://github.com/google/glog/archive/refs/tags/v{{self.version().strip()}}.tar.gz
00e4a87e87b7e7612f519a41e491f16623b12423620006f59f5688bfd8d13b08
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

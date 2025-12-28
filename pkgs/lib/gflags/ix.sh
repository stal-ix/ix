{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
gflags
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://github.com/gflags/gflags/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f619a51371f41c0ad6837b2a98af9d4643b3371015d873887f7e8d3237320b2f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/gflags.pc
{% endblock %}

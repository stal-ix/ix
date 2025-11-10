{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
robin-map
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{% block fetch %}
https://github.com/Tessil/robin-map/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0e3f53a377fdcdc5f9fed7a4c0d4f99e82bbb64175233bd13427fef9a771f4a1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}

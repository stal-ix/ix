{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
KDSingleApplication
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block fetch %}
https://github.com/KDAB/KDSingleApplication/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e3254ce9dc5ecf6d61ef83264bc61d486a307f0e3c9ed1bb2176f068cdbcbe09
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/qt/6
{% endblock %}

{% block cmake_flags %}
KDSingleApplication_QT6=true
KDSingleApplication_STATIC=true
KDSingleApplication_EXAMPLES=false
{% endblock %}

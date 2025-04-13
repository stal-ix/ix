{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libclipboard
{% endblock %}

{% block version %}
1.1
{% endblock %}

{% block fetch %}
https://github.com/jtanx/libclipboard/archive/refs/tags/v{{self.version().strip()}}.tar.gz
md5:bddc22070b6804ed63994af49b778b70
{% endblock %}

{% block lib_deps %}
lib/c
lib/darwin/framework/AppKit
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

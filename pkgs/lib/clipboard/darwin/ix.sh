{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libclipboard
{% endblock %}

{% block version %}
1.1
{% endblock %}

{% block fetch %}
https://github.com/jtanx/libclipboard/archive/refs/tags/v{{self.version().strip()}}.tar.gz
253f34a770be7ad9193be890b395dd2256119c9e3aa66e157bd465960515d47a
{% endblock %}

{% block lib_deps %}
lib/c
lib/darwin/framework/AppKit
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

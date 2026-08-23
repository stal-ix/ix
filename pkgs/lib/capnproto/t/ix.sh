{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
capnproto
{% endblock %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://github.com/capnproto/capnproto/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d5ebdf858e9885c33d4b3f765006d68bd66e9b002bf4d607ff4317ef9c1aac6a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

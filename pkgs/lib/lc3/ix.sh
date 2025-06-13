{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
liblc3
{% endblock %}

{% block version %}
1.1.1
{% endblock %}

{% block fetch %}
https://github.com/google/liblc3/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b65e38943708529efd04a87dd1a9f16a9856ed6199d082b18e7d42fb5c59486e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

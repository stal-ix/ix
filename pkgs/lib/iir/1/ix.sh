{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
iir1
{% endblock %}

{% block version %}
1.11.1
{% endblock %}

{% block fetch %}
https://github.com/berndporr/iir1/archive/refs/tags/{{self.version().strip()}}.tar.gz
ee3ffd1c8b7d406cd5610d537a9e033d93e00f5db208ea0341f0dbd0472e486a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

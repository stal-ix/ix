{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprwire
{% endblock %}

{% block version %}
0.3.1
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprwire/archive/refs/tags/v{{self.version().strip()}}.tar.gz
92a673d40ae6a7d66fbcd0a34ec071e026e17eaeeb0040c3375e4b2a80dba737
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/ffi
lib/hypr/utils
{% endblock %}

{% block bld_libs %}
lib/pugixml
{% endblock %}

{% block strip_pc %}
{% endblock %}

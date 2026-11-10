{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprcursor
{% endblock %}

{% block version %}
0.1.14
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprcursor/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f835995a1225ab169723d5e4e7510e31231dbb3048c4da6de6f6a51794e4cb38
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/zip
lib/cairo
lib/hypr/lang
lib/toml/plus/plus
{% endblock %}

{% block bld_libs %}
lib/hypr/rsvg
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

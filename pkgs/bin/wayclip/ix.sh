{% extends '//die/c/make.sh' %}

{% block pkg_name %}
wayclip
{% endblock %}

{% block version %}
0.5
{% endblock %}

{% block fetch %}
https://github.com/noocsharp/wayclip/archive/refs/tags/{{self.version().strip()}}.tar.gz
a73a6f59bf974f5ad5eafe5ce16921083fca05b5b1ddc979023c082be8dc23e6
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% extends '//die/c/make.sh' %}

{% block version %}
0.4.2
{% endblock %}

{% block fetch %}
https://github.com/noocsharp/wayclip/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:2a557e5bc713fdc64da5d957001f05330afbc88b2c59bef056623cfd2809816d
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

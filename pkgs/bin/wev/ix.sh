{% extends '//die/c/make.sh' %}

{% block version %}
1.1.0
{% endblock %}

{% block pkg_name %}
wev
{% endblock %}

{% block fetch %}
https://git.sr.ht/~sircmpwn/wev/archive/{{self.version().strip()}}.tar.gz
sha:89b8d9bc756631795ee91c99a0d5b0877c9f5c3acfe81f77a2b69ecfc15daf16
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/pkg/config
bld/wayland
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/emersion/slurp/archive/refs/tags/v1.4.0.tar.gz
sha:a332bd40168eb73361ea811eae01d6d1210f9eadb0a486e2dd7a03efb81a3772
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/kernel
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/emersion/slurp/archive/refs/tags/v1.3.2.tar.gz
md5:05e2d6c212b165897458a8aeec82d6db
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bin/scdoc
bin/wayland/protocols
{% endblock %}

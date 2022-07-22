{% extends '//die/c/meson.sh' %}

{# need vala #}

{% block fetch %}
https://github.com/misterdanb/avizo/archive/refs/tags/1.2.1.tar.gz
sha:efd4763db7c802d22e8939dac909d4886f5967aefbfc3fd526735da2a814b91b
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

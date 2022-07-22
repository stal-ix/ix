{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-1.4.1.tar.gz
sha:3b86670dd91441708dedc32bc7f684a034232fd4a9bb209f53276c9783e9d40e
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/wayland
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml2
lib/wayland
{% endblock %}

{% block run_data %}
aux/xkeyboard/config
{% endblock %}

{% block meson_flags %}
enable-x11=false
enable-docs=false
xkb-config-root="${XKB_CONFIG}"
{% endblock %}

{% block c_rename_symbol %}
parse_string
{% endblock %}

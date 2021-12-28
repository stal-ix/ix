{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-1.3.1.tar.gz
dc423f8072d20964ea6c05708a647803
{% endblock %}

{% block bld_tool %}
dev/lang/flex
dev/lang/bison/3/8
lib/wayland/protocols
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml2
lib/wayland
{% endblock %}

{% block run_data %}
lib/xkbcommon/config
{% endblock %}

{% block meson_flags %}
-Denable-x11=false
-Denable-docs=false
-Dxkb-config-root=${XKB_CONFIG}
{% endblock %}

{% block c_rename_symbol %}
parse_string
{% endblock %}

{% extends '//die/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~leon_plickat/lavalauncher/archive/v2.1.1.tar.gz
sha:951edb0e00a118cd57d54349349d4898cfc18c6208a7c4d7f6e892eec1497c3b
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

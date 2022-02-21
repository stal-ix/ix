{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/swaylock/archive/refs/tags/1.5.tar.gz
sha:37b9c70e5698e8872b0b964a7454ecdb0f1a9e06b686eecf2b6c54f7f64a3f42
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/cairo
lib/wayland
lib/xkbcommon
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bin/wayland/protocols
{% endblock %}

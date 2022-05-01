{% extends '//mix/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~exec64/imv/archive/v4.3.1.tar.gz
sha:88d16885017b74b594ddd6a03ef20294a6cc053f04ccc2e1edef69f3515f7999
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/heif
lib/mesa
lib/inih
lib/cairo
lib/pango
lib/ns/gif
lib/wayland
lib/xkbcommon
lib/freeimage
lib/jpeg/turbo
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

{% block meson_flags %}
windows=wayland
{% endblock %}

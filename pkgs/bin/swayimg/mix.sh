{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/d53bcd1a33e472e15dd958b742b2d6841d32bf3b.zip
sha:3fd762cd4e21f6635dfcfb75e13466246fc2e39ca434d77253fb241812949dfd
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/jxl
lib/tiff
lib/webp
lib/jpeg
lib/avif
lib/cairo
lib/giflib
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

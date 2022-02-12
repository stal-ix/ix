{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v1.5.tar.gz
sha:633c5a89f571ad296fb1a8737a49132a637158b0c1522bf40fea05cf8fc54db7
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
lib/wayland/protocols
{% endblock %}

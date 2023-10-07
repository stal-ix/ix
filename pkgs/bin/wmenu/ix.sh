{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~adnano/wmenu/archive/0.1.4.tar.gz
sha:b5a97a96936d076dce7275e3762d3959b4c99b6038bc33a7258195316a672799
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/pango
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

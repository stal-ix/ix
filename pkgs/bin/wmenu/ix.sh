{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~adnano/wmenu/archive/0.1.6.tar.gz
sha:0684739e6339ffad6562338a4bf67e29bf18688d1a9b0ddf31b693a64d29efac
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/pango
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.10.2.tar.gz
b875ed196bc624c78e7b35967675a813
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/fcft/mix.sh
lib/linux/mix.sh
lib/tllist/mix.sh
lib/pixman/mix.sh
lib/wayland/mix.sh
lib/freetype/mix.sh
lib/xkbcommon/mix.sh
lib/fontconfig/mix.sh
{% endblock %}

{% block bld_tool %}
lib/curses/n/mix.sh
dev/doc/scdoc/mix.sh
lib/wayland/protocols/mix.sh
{% endblock %}

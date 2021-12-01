{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/1.6.1.tar.gz
0bff81d89e9f9236cf00d46119ae4442
{% endblock %}

{% block bld_libs %}
lib/wlroots/mix.sh
lib/wayland/mix.sh
lib/wayland/protocols/mix.sh
lib/pcre/mix.sh
lib/json/c/mix.sh
lib/cairo/mix.sh
lib/pango/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-w -Dlist_insert=sway_list_insert ${CPPFLAGS}"
{% endblock %}

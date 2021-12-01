{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-1.3.1.tar.gz
dc423f8072d20964ea6c05708a647803
{% endblock %}

{% block bld_tool %}
dev/lang/flex/mix.sh
dev/lang/bison/3/8/mix.sh
{% endblock %}

{% block lib_deps %}
lib/xml2/mix.sh
lib/wayland/mix.sh
lib/wayland/protocols/mix.sh
{% endblock %}

{% block meson_flags %}
-Denable-x11=false
-Denable-docs=false
{% endblock %}

{% block install %}
{{super()}}

mkdir ${out}/share/X11 && cp -R test/data ${out}/share/X11/xkb
{% endblock %}

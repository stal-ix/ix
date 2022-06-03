{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/freedesktop/xkeyboard-config/archive/refs/tags/xkeyboard-config-2.36.tar.gz
sha:d047af43c9da3843fdb40139d5f23ac75041bed16c28e24a31447b27a269cf66
{% endblock %}

{% block bld_tool %}
bld/gettext
bin/xsltproc
bin/intltool
{% endblock %}

{% block env %}
export XKB_CONFIG="${out}/share/X11/xkb"
{% endblock %}

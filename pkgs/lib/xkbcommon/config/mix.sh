{% extends '//mix/autorehell.sh' %}

{% block fetch %}
http://www.x.org/releases/individual/data/xkeyboard-config/xkeyboard-config-2.24.tar.bz2
74c4bdf52382127cb5802c3f2ab441e0
{% endblock %}

{% block make_no_thrs %}{% endblock %}

{% block autoreconf %}
NOCONFIGURE=1 sh autogen.sh
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/gettext
bin/xsltproc
lib/intl/tool
bin/auto/conf/xorg
{% endblock %}

{% block configure_flags %}
--disable-runtime-deps
{% endblock %}

{% block env %}
export XKB_CONFIG="${out}/share/X11/xkb"
{% endblock %}

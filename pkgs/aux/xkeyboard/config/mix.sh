{% extends '//mix/autorehell.sh' %}

{% block fetch %}
http://www.x.org/releases/individual/data/xkeyboard-config/xkeyboard-config-2.24.tar.bz2
74c4bdf52382127cb5802c3f2ab441e0
{% endblock %}

{% block make_no_thrs %}{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/gettext
bin/xsltproc
bin/intltool
bin/auto/conf/xorg
{% endblock %}

{% block setup %}
export XKB_CONFIG="${out}/share/xkb"
{% endblock %}

{% block configure_flags %}
--with-xkb-base="${XKB_CONFIG}"
--disable-runtime-deps
{% endblock %}

{% block env %}
export XKB_CONFIG="${XKB_CONFIG}"
{% endblock %}

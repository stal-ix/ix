{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/tmux/tmux/releases/download/3.5/tmux-3.5.tar.gz
sha:2fe01942e7e7d93f524a22f2c883822c06bc258a4d61dba4b407353d7081950f
{% endblock %}

{% block bld_libs %}
lib/c
lib/event
lib/curses
lib/bsd/init
lib/utf8/proc
lib/bsd/overlay
{% endblock %}

{% block cpp_defines %}
LIBBSD_NETBSD_VIS=1
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}

{% block configure_flags %}
--enable-utf8proc
{% endblock %}

{% block enable_static %}
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|.*define.*BSD.*||' -i compat.h
{% endblock %}

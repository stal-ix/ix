{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/tmux/tmux/releases/download/3.4/tmux-3.4.tar.gz
sha:551ab8dea0bf505c0ad6b7bb35ef567cdde0ccb84357df142c254f35a23e19aa
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

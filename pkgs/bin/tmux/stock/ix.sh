{% extends '//die/c/autorehell.sh' %}

{% block version %}
3.7c
{% endblock %}

{% block pkg_name %}
tmux
{% endblock %}

{% block fetch %}
https://github.com/tmux/tmux/archive/refs/tags/{{self.version().strip()}}.tar.gz
5e7b0f533b66e5633e2b72a9d483f9534a343ab7011eb2621b6309dfba553daa
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

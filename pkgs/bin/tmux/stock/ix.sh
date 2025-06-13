{% extends '//die/c/autorehell.sh' %}

{% block version %}
3.5a
{% endblock %}

{% block pkg_name %}
tmux
{% endblock %}

{% block fetch %}
https://github.com/tmux/tmux/archive/refs/tags/{{self.version().strip()}}.tar.gz
49e68b41dec0bf408990160ee12fa29b06dee8f74c1f0b4b71c9d2a1477dd910
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

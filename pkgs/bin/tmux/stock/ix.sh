{% extends '//die/c/autorehell.sh' %}

{% block version %}
3.8
{% endblock %}

{% block pkg_name %}
tmux
{% endblock %}

{% block fetch %}
https://github.com/tmux/tmux/archive/refs/tags/{{self.version().strip()}}.tar.gz
f873f9379c9cf30d3d66b642a955118c4fbb0019d046d13e6012340811e5dcb7
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

{% block patch %}
sed -i 's/^int[[:space:]]*optreset;/__attribute__((weak)) int optreset;/' compat/getopt_long.c
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|.*define.*BSD.*||' -i compat.h
{% endblock %}

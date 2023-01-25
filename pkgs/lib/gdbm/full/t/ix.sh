{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz
sha:37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/gettext
{% endblock %}

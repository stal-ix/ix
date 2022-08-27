{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/fetchmail/branch_6.4/fetchmail-6.4.33.tar.xz
sha:82954ebd26c77906463ce20adca45cbcf8068957441e17941bd3052a5c15432e
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/gettext
{% endblock %}

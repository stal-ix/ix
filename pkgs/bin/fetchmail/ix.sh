{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/fetchmail/branch_6.4/fetchmail-6.4.30.tar.xz
sha:35824c20aa1d8d97e3f1611fef49b9f7f68396f7cbc4d3a807fed27ae9ea445a
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/byacc
bld/gettext
{% endblock %}

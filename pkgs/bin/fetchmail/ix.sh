{% extends '//die/c/autorehell.sh' %}

{% block version %}
6.4.36
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/fetchmail/branch_6.4/fetchmail-{{self.version().strip()}}.tar.xz
sha:700d433838d3e29e304452aec56b21874f538ec24113fdcbb25139c5f2edc23a
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

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/fetchmail/branch_6.4/fetchmail-6.4.34.tar.xz
sha:c3bdded1b5ce236960bd1ceeee3f3257220ed99c3eec84a5d76bb5618e3258d4
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

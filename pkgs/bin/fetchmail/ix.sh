{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/fetchmail/branch_6.4/fetchmail-6.4.32.tar.xz
sha:3ee7444665606ad06fb5f7b15f91e3173b845bc98b646b1a4514a46aa48b7228
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

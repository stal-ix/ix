{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/fenrus75/powertop/archive/refs/tags/v2.15.tar.gz
sha:e58ab3fd7b8ff5f4dd0d17f11848817e7d83c0a6918145ac81de03b5dccf8f49
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/kernel
lib/curses
lib/pciutils
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/auto/archive
{% endblock %}

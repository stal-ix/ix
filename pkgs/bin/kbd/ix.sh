{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/utils/kbd/kbd-2.5.1.tar.xz
sha:ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/linux
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/flex
bld/bison
bld/gettext
{% endblock %}

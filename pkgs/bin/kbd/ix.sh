{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/utils/kbd/kbd-2.5.0.tar.xz
sha:ad95964a4dede55f9239dd63b455fa4498cf3db3a0075ccd1d65a9f0e622a0fd
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

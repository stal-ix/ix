{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/utils/kbd/kbd-2.6.0.tar.xz
sha:9c159433db5df8ef31d86b42f5b09d32311bdda2ed35107fb1926243da60b28a
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/flex
bld/bison
bld/gettext
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/utils/kbd/kbd-2.6.1.tar.xz
sha:2eb6c6c972be9589bab733275bf020beb5f644d5f9439737920e701af6cf3485
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

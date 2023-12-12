{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/utils/kbd/kbd-2.6.4.tar.xz
sha:519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926
{% endblock %}

{% block conf_ver %}
2/71
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

{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz
2703828579552a5a6749fadfb1bf305d
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/pcre/2
lib/gnutls
lib/metalink
{% endblock %}

{% block bld_tool %}
bin/gettext
bin/auto/conf/archive
{% endblock %}

{% block patch %}
cat lib/xalloc-die.c      \
    | grep -v 'memory ex' \
    > _ && mv _ lib/xalloc-die.c
{% endblock %}

{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz
2703828579552a5a6749fadfb1bf305d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/psl
lib/intl
lib/pcre/2
lib/gnutls
lib/c-ares
lib/metalink
lib/unistring
{% endblock %}

{% block bld_tool %}
bin/gettext
bin/auto/conf/archive
{% endblock %}

{% block configure_flags %}
--with-cares
{% endblock %}

{% block patch %}
sed -e 's|.*memory ex.*||' -i lib/xalloc-die.c
{% endblock %}

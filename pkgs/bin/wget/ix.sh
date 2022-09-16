{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz
sha:1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3
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
lib/shim/gnu
lib/unistring
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/auto/archive
{% endblock %}

{% block configure_flags %}
--with-cares
{% endblock %}

{% block patch %}
sed -e 's|.*error.*exh.*||' -i lib/xalloc-die.c
{% endblock %}

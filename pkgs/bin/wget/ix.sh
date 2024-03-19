{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.lz
sha:57a107151e4ef94fdf94affecfac598963f372f13293ed9c74032105390b36ee
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/psl
lib/intl
lib/pcre/2
lib/gnutls
lib/c/ares
lib/metalink
lib/shim/gnu
lib/unistring
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/auto/archive
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block cpp_includes %}
${PWD}/lib
{% endblock %}

{% block c_rename_symbol %}
# conflicts with gnutls
glthread_once_multithreaded
{% endblock %}

{% block configure_flags %}
--with-cares
# fix wgetrc in /etc
--sysconfdir=${out}/share/wget
{% endblock %}

{% block patch %}
sed -e 's|.*error.*exh.*||' -i lib/xalloc-die.c
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|\[\[__maybe_unused__\]\]||g' -i src/config.h
{% endblock %}

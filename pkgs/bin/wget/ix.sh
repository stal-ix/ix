{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
wget
{% endblock %}

{% block version %}
1.25.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget-{{self.version().strip()}}.tar.lz
19225cc756b0a088fc81148dc6a40a0c8f329af7fd8483f1c7b2fe50f4e08a1f
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

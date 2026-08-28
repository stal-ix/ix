{% extends '//die/c/autohell.sh' %}

{% block fetch %}
{% include '//lib/intl/gnu/t/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
{% if darwin %}
lib/iconv
{% endif %}
lib/shim/gnu
{% endblock %}

{% block bld_tool %}
bld/gzip
bin/gperf
bld/byacc
{% endblock %}

{% block configure_flags %}
--disable-c++
--disable-nls
--disable-java
--disable-csharp
--without-git
--without-cvs
--without-xz
--disable-curses
--with-included-gettext
{% endblock %}

{% block make_flags %}
{{super()}}
BISON_LOCALEDIR_c_make=\\\"${out}/share/locale\\\"
{% endblock %}

{% block c_flags %}
{{super()}}
-Wno-incompatible-function-pointer-types
{% endblock %}

{% block install %}
{{super()}}
# gettext 0.25 stopped installing its m4 macros (iconv.m4, gettext.m4, ...)
# into share/aclocal, keeping them only in the autopoint archive. Downstream
# autoreconf needs them on ACLOCAL_PATH (AM_ICONV, AM_GNU_GETTEXT), so put
# them back.
cp ${out}/share/gettext/m4/*.m4 ${out}/share/aclocal/
{% endblock %}

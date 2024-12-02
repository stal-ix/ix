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

{% block install %}
{{super()}}
find ${out}/share -type f | while read l; do
    sed -e 's|0.22|0.23|' -i ${l}
done
{% endblock %}

{% block c_flags %}
{{super()}}
-Wno-incompatible-function-pointer-types
{% endblock %}

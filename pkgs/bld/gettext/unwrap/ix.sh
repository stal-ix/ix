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

{% block setup_target_flags %}
{{super()}}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
{% endblock %}

{% extends '//lib/intl/gnu/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/iconv
lib/obstack
{% endblock %}

{% block unpack %}
{{super()}}
sed -e 's|/usr/bin/file|file|' -i build-aux/ltmain.sh
sed -e 's|/usr/bin/file|file|' -i libtextstyle/build-aux/ltmain.sh
cd libtextstyle
{% endblock %}

{% block autoreconf %}
sh ./autogen.sh --skip-gnulib
{% endblock %}

{% block env %}
export COFLAGS="--with-libtextstyle-prefix=${out} \${COFLAGS}"
{% endblock %}

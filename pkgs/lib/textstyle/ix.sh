{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
{% include '//bin/gettext/unwrap/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
lib/obstack
{% endblock %}

{% block unpack %}
{{super()}}
cd libtextstyle
{% endblock %}

{% block autoreconf %}
sh ./autogen.sh --skip-gnulib
{% endblock %}

{% block env %}
export COFLAGS="--with-libtextstyle-prefix=${out} \${COFLAGS}"
{% endblock %}

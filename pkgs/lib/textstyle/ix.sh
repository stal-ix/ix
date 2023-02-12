{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
sha:c77d0da3102aec9c07f43671e60611ebff89a996ef159497ce8e59d075786b12
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

{% block env %}
export COFLAGS="--with-libtextstyle-prefix=${out} \${COFLAGS}"
{% endblock %}

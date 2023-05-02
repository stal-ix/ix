{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/cpio/cpio-2.14.tar.bz2
sha:fcdc15d60f7267a6fc7efcd6b9db7b6c8966c4f2fbbb964c24d41336fd3f2c12
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/obstack
{% endblock %}

{% block bld_tool %}
bld/bison
bld/gettext
{% endblock %}

{% block setup %}
export ac_cv_rettype_minor=int
export ac_cv_rettype_major=int
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}

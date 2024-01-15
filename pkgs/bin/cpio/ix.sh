{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.bz2
sha:937610b97c329a1ec9268553fb780037bcfff0dcffe9725ebc4fd9c1aa9075db
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

{% block configure %}
{{super()}}
sed -e 's|\[\[__maybe_unused__\]\]||' -i config.h
{% endblock %}

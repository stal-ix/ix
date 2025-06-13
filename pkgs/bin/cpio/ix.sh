{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
cpio
{% endblock %}

{% block version %}
2.15
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/cpio/cpio-{{self.version().strip()}}.tar.bz2
937610b97c329a1ec9268553fb780037bcfff0dcffe9725ebc4fd9c1aa9075db
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

{% block setup_target_flags %}
export ac_cv_rettype_minor=int
export ac_cv_rettype_major=int
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|\[\[__maybe_unused__\]\]||' -i config.h
{% endblock %}

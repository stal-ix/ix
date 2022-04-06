{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.bz2
sha:eab5bdc5ae1df285c59f2a4f140a98fc33678a0bf61bdba67d9436ae26b46f6d
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/bison
bld/gettext
{% endblock %}

{% block setup %}
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}

{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
# md5 28b1cd4c94a74428723ed966c38cf479
{% endblock %}

{% block deps %}
# lib lib/iconv/mix.sh
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block postunpack %}
cd libtextstyle
{% endblock %}

{% block env %}
export COFLAGS="--with-libtextstyle-prefix=${out} \${COFLAGS}"
{% endblock %}

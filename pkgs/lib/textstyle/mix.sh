{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
28b1cd4c94a74428723ed966c38cf479
{% endblock %}

{% block lib_deps %}
lib/iconv/mix.sh
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}

{% block postunpack %}
cd libtextstyle
{% endblock %}

{% block env %}
export COFLAGS="--with-libtextstyle-prefix=${out} \${COFLAGS}"
{% endblock %}

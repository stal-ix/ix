{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
# md5 28b1cd4c94a74428723ed966c38cf479
{% endblock %}

{% block deps %}
# lib lib/iconv
# bld dev/build/make env/std
{% endblock %}

{% block postunpack %}
cd libtextstyle
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -ltextstyle \${LDFLAGS}"
export COFLAGS="--with-libtextstyle-prefix=${out} \${COFLAGS}"
{% endblock %}

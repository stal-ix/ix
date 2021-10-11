{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.16.tar.gz
# md5 7d2a800b952942bb2880efb00cfd524c
{% endblock %}

{% block deps %}
# bld env/c boot/final/env/tools
{% endblock %}

{% block postinstall %}
rm ${out}/lib/libcharset.a
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -liconv \${LDFLAGS}"
export COFLAGS="--with-libiconv-prefix=${out} --with-iconv=${out} \${COFLAGS}"
{% endblock %}

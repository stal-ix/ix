{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.16.tar.gz
# md5 7d2a800b952942bb2880efb00cfd524c
{% endblock %}

{% block bld_deps %}
env/std/0/mix.sh
{% endblock %}

{% block postinstall %}
rm ${out}/lib/libcharset.a
{% endblock %}

{% block env %}
export COFLAGS="--with-libiconv-prefix=${out} --with-iconv=${out} \${COFLAGS}"
{% endblock %}

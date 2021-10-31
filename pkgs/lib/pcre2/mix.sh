{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.pcre.org/pub/pcre/pcre2-10.36.tar.gz
# md5 a5d9aa7d18b61b0226696510e60c9582
{% endblock %}

{% block deps %}
# bld lib/z/mix.sh
# bld lib/bzip2/mix.sh
# bld env/c/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block coflags %}
--enable-pcre2grep-libz
--enable-pcre2grep-libbz2
--enable-newline-is-anycrlf
--enable-utf8
--enable-jit
--enable-c++
{% endblock %}

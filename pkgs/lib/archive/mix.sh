{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.5.2.tar.gz
94961a3227552a7b9b617a97f3471beb
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/lz4
lib/lzo
lib/zstd
lib/bzip2
lib/iconv
lib/expat
{% endblock %}

{% block configure_flags %}
--without-xml2
{% endblock %}

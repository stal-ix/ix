{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.5.2.tar.gz
94961a3227552a7b9b617a97f3471beb
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/lz4
lib/zstd
lib/bzip2
lib/iconv
lib/expat
{% endblock %}

{% block bld_libs %}
{% if bin %}
lib/intl
{% endif %}
{% endblock %}

{% block bld_tool %}
lib/magic/mix.sh
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block configure_flags %}
--without-xml2
{% endblock %}

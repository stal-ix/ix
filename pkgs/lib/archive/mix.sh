{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.5.2.tar.gz
94961a3227552a7b9b617a97f3471beb
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/xz/mix.sh
lib/lz4/mix.sh
lib/intl/mix.sh
lib/zstd/mix.sh
lib/bzip2/mix.sh
lib/iconv/mix.sh
lib/expat/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1.16.3/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block configure_flags %}
--without-xml2
{% endblock %}

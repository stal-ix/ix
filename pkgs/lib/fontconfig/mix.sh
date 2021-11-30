{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.13.94.tar.xz
ab06ff17524de3f1ddd3c97ed8a02f8d
{% endblock %}

{% block bld_tool %}
tool/compress/gzip/mix.sh
gnu/tar/mix.sh
gnu/gettext/mix.sh
dev/tool/gperf/mix.sh
dev/build/python/mix.sh
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block lib_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
lib/expat/mix.sh
lib/json/c/mix.sh
lib/freetype/mix.sh
{% endblock %}

{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/mauke/unibilium/archive/refs/tags/v2.0.0.tar.gz
a89b8ef6e752cc76098e1863ff4b5457
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/perl/mix.sh
tool/compress/gzip/mix.sh
dev/build/auto/libtool/mix.sh
{% endblock %}

{% block run_data %}
lib/curses/n/mix.sh
{% endblock %}

{% block make_flags %}
TERMINFO_DIRS="\"${TERMINFO}\""
{% endblock %}

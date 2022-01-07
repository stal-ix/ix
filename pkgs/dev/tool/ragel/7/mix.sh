{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/adrian-thurston/ragel/archive/refs/tags/7.0.4.tar.gz
04bfa8473ea5a8bbab3d607a07103aea
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

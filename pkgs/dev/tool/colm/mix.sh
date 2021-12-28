{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/adrian-thurston/colm/archive/refs/tags/0.14.7.tar.gz
213a9ddf207c5732f04941852ca8db62
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
gnu/tar
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

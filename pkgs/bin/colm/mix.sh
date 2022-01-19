{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/adrian-thurston/colm/archive/refs/tags/0.14.7.tar.gz
213a9ddf207c5732f04941852ca8db62
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bin/tar
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

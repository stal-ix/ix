{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/adrian-thurston/colm/archive/refs/tags/0.14.7.tar.gz
213a9ddf207c5732f04941852ca8db62
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/c++/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1/16/mix.sh
{% endblock %}

{% block setup_tools %}
ln -s $(which bsdtar) tar
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

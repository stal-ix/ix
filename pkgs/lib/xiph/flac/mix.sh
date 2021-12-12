{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/xiph/flac/archive/refs/tags/1.3.3.tar.gz
40de811000d510b9c65d5f1d1f53f26d
{% endblock %}

{% block bld_tool %}
gnu/gettext/mix.sh
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1/16/mix.sh
{% endblock %}

{% block setup_tools %}
ln -s $(which xgettext) gettext
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

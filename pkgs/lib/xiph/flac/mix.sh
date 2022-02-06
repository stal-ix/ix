{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/xiph/flac/archive/refs/tags/1.3.3.tar.gz
40de811000d510b9c65d5f1d1f53f26d
{% endblock %}

{% block bld_tool %}
bin/gettext
{% endblock %}

{% block setup_tools %}
ln -s $(which xgettext) gettext
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

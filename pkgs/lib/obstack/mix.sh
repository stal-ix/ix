{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/void-linux/musl-obstack/archive/refs/tags/v1.2.2.tar.gz
edee8cb45ca351de5759b85f2aca0f3b
{% endblock %}

{% block bld_tool %}
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

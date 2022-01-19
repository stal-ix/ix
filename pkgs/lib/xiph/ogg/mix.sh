{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://gitlab.xiph.org/xiph/ogg/-/archive/v1.3.5/ogg-v1.3.5.tar.bz2
b1221346a0ed6b6369f8c69a2800050b
{% endblock %}

{% block bld_tool %}
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

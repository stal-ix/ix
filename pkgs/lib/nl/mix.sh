{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-3.5.0.tar.gz
sha:352133ec9545da76f77e70ccb48c9d7e5324d67f6474744647a7ed382b5e05fa
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bin/flex
bin/bison/3/6
{% endblock %}

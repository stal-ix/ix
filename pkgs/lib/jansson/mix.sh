{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/akheron/jansson/archive/refs/tags/v2.14.tar.gz
bc78f39c7cd7fab1dd5fc4a2c3be1661
{% endblock %}

{% block bld_tool %}
lib/magic
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/akheron/jansson/archive/refs/tags/v2.14.tar.gz
bc78f39c7cd7fab1dd5fc4a2c3be1661
{% endblock %}

{% block bld_tool %}
lib/magic/mix.sh
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1/16/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

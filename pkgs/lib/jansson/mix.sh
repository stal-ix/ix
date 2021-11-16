{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/akheron/jansson/archive/refs/tags/v2.14.tar.gz
bc78f39c7cd7fab1dd5fc4a2c3be1661
{% endblock %}

{% block bld_tool %}
gnu/file/mix.sh
dev/build/autoconf/2.69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block autoreconf %}
autoreconf -i
{% endblock %}

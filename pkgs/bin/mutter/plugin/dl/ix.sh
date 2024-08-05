{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
bin/mutter/plugin
{% endblock %}

{% block export_libs %}
libdefault.a
{% endblock %}

{% block export_lib %}
default
{% endblock %}

{% block env %}
export PLUGIN=${out}/lib/reg.o
{% endblock %}

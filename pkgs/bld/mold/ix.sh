{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mold
{% endblock %}

{% block ind_deps %}
bld/mold/lib
{% endblock %}

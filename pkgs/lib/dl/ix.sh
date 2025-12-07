{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
{{dl_for}}
{% endblock %}

{% block export_libs %}
lib{{dl_lib}}.a
{% endblock %}

{% block export_lib %}
{{dl_lib}}
{% endblock %}

{% extends '//lib/wlroots/16/ix.sh' %}

{% block fetch %}
{% include '//bin/hypr/land/stock/ver.sh' %}
{% endblock %}

{% block step_unpack %}
{{super()}}
cd subprojects/wlroots
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/display/info
{% endblock %}

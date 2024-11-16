{% extends '//die/env.sh' %}

{% block env %}
export TARGET_PLATFORM={{target.gnu.three}}
{% endblock %}

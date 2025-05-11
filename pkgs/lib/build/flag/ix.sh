{% extends '//die/env.sh' %}

{% block env %}
export {{flag}}="{{flags}} ${{flag}}"
{% endblock %}

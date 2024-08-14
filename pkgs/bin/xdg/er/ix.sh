{% extends '//die/fix/wrapper.sh' %}

{% block wrapper %}
{{prefix}}
{% endblock %}

{% block wrapper_env %}
export PATH="__realm__/bin:\${PATH}"
export XDG_DATA_DIRS="__realm__/share:\${XDG_DATA_DIRS}"
{% endblock %}

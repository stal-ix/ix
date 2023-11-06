{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if py_extra_modules %}
{{'\n'.join(py_extra_modules.split(':'))}}
{% endif %}
{% endblock %}

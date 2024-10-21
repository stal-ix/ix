{% extends 'ix1.sh' %}

{% block script_functions %}
{{super()}}
{% include 'functions.sh' %}
{% endblock %}

{% block unpack %}
unpack_f
{% endblock %}

{% block step_setup %}
step_setup_f
{% endblock %}

{% block step_install %}
step_install_f
{% endblock %}

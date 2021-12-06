{% extends 'base.sh' %}


{% block step_unpack %}
{% block unpack %}
{% endblock %}
{% endblock %}


{% block step_patch %}
{% block prepatch %}
{% endblock %}

{% block patch %}
{% endblock %}
{% endblock %}


{% block step_setup %}
{% block setup %}
{% endblock %}
{% endblock %}


{% block step_configure %}
{% block configure %}
{% endblock %}
{% endblock %}


{% block step_build %}
{% block prebuild %}
{% endblock %}

{% block build %}
{% endblock %}
{% endblock %}


{% block step_test %}
{% block test %}
{% endblock %}
{% endblock %}


{% block step_install %}
{% block install %}
{% endblock %}

{% block postinstall %}
{% endblock %}

{% block prepare_env %}
{% endblock %}
{% endblock %}

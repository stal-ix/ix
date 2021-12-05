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

{% block postpatch %}
{% endblock %}
{% endblock %}


{% block step_setup %}
{% block template_setup %}
{% endblock %}

{% block setup %}
{% endblock %}
{% endblock %}


{% block step_configure %}
{% block preconf %}
{% endblock %}

(
    set -eu

{% block configure %}
{% endblock %}

{% block postconf %}
{% endblock %}
)
{% endblock %}


{% block step_build %}
{% block prebuild %}
{% endblock %}

{% block build %}
{% endblock %}

{% block postbuild %}
{% endblock %}
{% endblock %}


{% block step_test %}
{% block pretest %}
{% endblock %}

{% block test %}
{% endblock %}

{% block posttest %}
{% endblock %}
{% endblock %}


{% block step_install %}
{% block preinstall %}
{% endblock %}

{% block install %}
{% endblock %}

{% block postinstall %}
{% endblock %}

{% block prepare_env %}
{% endblock %}
{% endblock %}

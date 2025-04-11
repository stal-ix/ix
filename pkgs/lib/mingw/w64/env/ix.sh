{% extends '//die/env.sh' %}

{% block env %}
export gl_cv_func_strcasecmp_works=y
export TARGET_PLATFORM={{target.gnu.three}}
{% endblock %}

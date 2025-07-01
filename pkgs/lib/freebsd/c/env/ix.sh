{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-lc -lm ${LDFLAGS}"
export gl_cv_func_strcasecmp_works=y
{% endblock %}

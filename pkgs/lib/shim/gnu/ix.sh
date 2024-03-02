{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
error.h
error.c
{% if linux %}
sched.h
sched.c
qsort_r.h
qsort_r.c
ieee754.h
ieee754.c
{% endif %}
{% endblock %}

{% block env %}
export ac_cv_lib_error_at_line=yes
export gl_cv_func_working_error=yes
{% endblock %}

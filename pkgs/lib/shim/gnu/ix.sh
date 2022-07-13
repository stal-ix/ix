{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
sched.h
sched.c
error.h
error.c
qsort_r.h
qsort_r.c
string.h
string.c
ieee754.h
ieee754.c
{% endblock %}

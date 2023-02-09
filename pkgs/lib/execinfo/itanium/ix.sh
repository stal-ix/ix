{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/execinfo/format
{% endblock %}

{% block sources %}
backtrace.cpp
{% endblock %}

{% block env %}
export ac_cv_func_backtrace=yes
export ac_cv_func_backtrace_symbols_fd=yes
{% endblock %}

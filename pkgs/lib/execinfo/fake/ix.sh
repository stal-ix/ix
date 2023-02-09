{% extends '//die/inline/library.sh' %}

{% block sources %}
execinfo.c
execinfo.h
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv *.a libexecinfo.a
{% endblock %}

{% block env %}
export ac_cv_func_backtrace=yes
export ac_cv_func_backtrace_symbols_fd=yes
{% endblock %}

{% extends '//bin/coreutils/9/0/mix.sh' %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block setup %}
export ac_cv_func_reallocarray=no
export CPPFLAGS="-O0 -g ${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
exit 1
{% endblock %}

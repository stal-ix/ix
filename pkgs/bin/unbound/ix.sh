{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/hiredis
lib/ng/http/2
{% endblock %}

{% block setup %}
export ac_cv_func_ev_loop=no
export ac_cv_func_ev_default_loop=no
{{super()}}
{% endblock %}

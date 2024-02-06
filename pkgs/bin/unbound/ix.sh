{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/sodium
lib/hiredis
lib/ng/http/2
lib/protobuf/c
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-dnstap
--enable-dnscrypt
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/protoc/c
{% endblock %}

{% block setup_target_flags %}
export ac_cv_func_ev_loop=no
export ac_cv_func_ev_default_loop=no
{{super()}}
{% endblock %}

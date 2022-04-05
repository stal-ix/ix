{% extends '//lib/curl/t/mix.sh' %}

{% block bld_tool %}
bin/groff
{{super()}}
{% endblock %}

{% block run_data %}
aux/ca-bundle
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-ca-bundle="${CA_BUNDLE}"
--enable-manual
{% endblock %}

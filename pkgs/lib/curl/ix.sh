{% extends '//lib/curl/t/ix.sh' %}

{% block bld_tool %}
bin/groff
{{super()}}
{% endblock %}

{% block use_data %}
aux/ca-bundle
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-ca-bundle="${CA_BUNDLE}"
--enable-manual
{% endblock %}

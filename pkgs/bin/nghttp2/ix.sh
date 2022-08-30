{% extends '//lib/ng/http/2/t/ix.sh' %}

{% block bld_libs %}
lib/xml/2
lib/boost
lib/jansson
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-app
--enable-hpack-tools
{% endblock %}

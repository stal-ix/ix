{% extends '//lib/mingw/64/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd mingw-w64-headers
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-sdk=all
{% endblock %}

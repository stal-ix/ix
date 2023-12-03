{% extends '//lib/mingw/64/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd mingw-w64-libraries/libmangle
{% endblock %}

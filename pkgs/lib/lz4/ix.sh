{% extends 't/ix.sh' %}

{% block unpack %}
{{super()}}
cd lib
{% endblock %}

{% block make_flags %}
{{super()}}
BUILD_SHARED=no
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|liblz4: .*|liblz4: |' -i Makefile
{% endblock %}

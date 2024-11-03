{% extends '//lib/openssl/3/ix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/lib*
{% endblock %}

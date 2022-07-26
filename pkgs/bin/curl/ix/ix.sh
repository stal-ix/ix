{% extends '//lib/curl/lite/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/mbedtls/3
{% endblock %}

{% block build_flags %}
{{super()}}
compress
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/share
rm ${out}/bin/curl-config
{% endblock %}

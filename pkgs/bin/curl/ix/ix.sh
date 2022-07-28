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
cd ${out}
rm -r share
rm bin/curl-config
mv bin old
mkdir bin
mv old bin/bin_ix
{% endblock %}

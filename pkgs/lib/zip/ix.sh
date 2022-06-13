{% extends '//lib/zip/t/ix.sh' %}

{% block install %}
{{super()}}
sed -e 's|.*bin.*||' -i ${out}/lib/pkgconfig/libzip.pc
{% endblock %}

{% extends '//bin/minio/client/ix.sh' %}

{% block install %}
{{super()}}
mv ${out}/bin/mc ${out}/bin/minio-client
{% endblock %}

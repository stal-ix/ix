{% extends '//die/go/build.sh' %}

{% block version %}
1.3.0
{% endblock %}

{% block go_url %}
https://github.com/minio/console/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
8585d73d45ca42b4c2bea76e5e067306d7fb36a9e04a3c31515e4627df0b7084
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/console
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp console ${out}/bin/minio-console
{% endblock %}

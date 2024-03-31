{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/johnkerl/miller/archive/refs/tags/v6.11.0.tar.gz
{% endblock %}

{% block go_sha %}
c4bb6a2091ff8c4acd5a2a584267f6bb794108bce19c23a12d1067d6d686941d
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/mlr
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp mlr ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}

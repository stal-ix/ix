{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v2.0.11.tar.gz
{% endblock %}

{% block go_sha %}
6fcfb485439ef712704186c02e40eaa5a8225cd28c59fa4cfe4da30a489a17e9
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp micro ${out}/bin/
{% endblock %}

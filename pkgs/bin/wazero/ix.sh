{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.7.2.tar.gz
{% endblock %}

{% block go_sha %}
6fa334664443f90c851a6a610905f17d80d8b86994b450c4b942cb79ac4006de
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}

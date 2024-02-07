{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/mvdan/sh/archive/refs/tags/v3.5.1.tar.gz
{% endblock %}

{% block go_sha %}
409758272e8b4a34168f5bdf69e4d1f6d00b5ba1a972b7e021488dd6bce4c1f5
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gosh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gosh ${out}/bin/
{% endblock %}

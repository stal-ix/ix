{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/umputun/reproxy/archive/refs/tags/v1.1.1.tar.gz
{% endblock %}

{% block go_sha %}
feb955efcad106ee7040627f1b3173cee5908681cad7d3e188a1e89d51187a7b
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp app ${out}/bin/reproxy
{% endblock %}

{% block go_version %}
v3
{% endblock %}

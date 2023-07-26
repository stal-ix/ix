{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.24.0.tar.gz
{% endblock %}

{% block go_sha %}
a7475fbe074ae40d807e253419d182859f875513dea7726996f2707aecf9aa8c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}

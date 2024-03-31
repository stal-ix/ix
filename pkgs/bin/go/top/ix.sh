{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/xxxserxxx/gotop/archive/refs/tags/v4.2.0.tar.gz
{% endblock %}

{% block go_sha %}
f3e38a9d9ee7bdca0bb2a233b90a0cb3ecb8b975965a8d16293c74ead0aa0b5f
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.16|go 1.21|' -i go.mod
export GOSUMDB=off
go mod tidy -compat=1.21
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gotop
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gotop ${out}/bin/
{% endblock %}

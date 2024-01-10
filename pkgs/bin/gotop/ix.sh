{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/xxxserxxx/gotop/archive/refs/tags/v4.2.0.tar.gz
{% endblock %}

{% block go_sha %}
4be827b38e898ab1c1609f85ff9146d4350cb4d0a7818d2b1e54e678b7360d36
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

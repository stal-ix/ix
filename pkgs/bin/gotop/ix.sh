{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/xxxserxxx/gotop/archive/refs/tags/v4.2.0.tar.gz
{% endblock %}

{% block go_sha %}
9ff20cfc28a30f0cc6cef7284f0057897f99831e5db7407b998192dfb4635cfd
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

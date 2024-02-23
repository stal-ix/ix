{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://git.sr.ht/~delthas/senpai/archive/v0.3.0.tar.gz
{% endblock %}

{% block go_sha %}
4b33500025f18781e8aedd82d86941a52fcac7e3b977f61b656a8f79810ceedf
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.16|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/senpai
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp senpai ${out}/bin/
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/antonmedv/walk/archive/refs/tags/v1.10.0.tar.gz
{% endblock %}

{% block go_sha %}
5e18fa998bdd91ea51478e96683ece132f9577df22b0419f0a6082c115f155be
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp walk ${out}/bin/
{% endblock %}

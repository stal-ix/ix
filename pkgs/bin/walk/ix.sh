{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/antonmedv/walk/archive/refs/tags/v1.7.0.tar.gz
{% endblock %}

{% block go_sha %}
f355ec5b6658ee862885a279fe10dba5105af03403c4497e7241253d74f98b21
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp walk ${out}/bin/
{% endblock %}

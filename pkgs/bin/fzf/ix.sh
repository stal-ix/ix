{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.44.0.tar.gz
{% endblock %}

{% block go_sha %}
fe3cff5291dba58f4fb6deff73b92d52f989afcd224eeb94544f3b5ec0e60b4a
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

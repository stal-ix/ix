{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.51.0.tar.gz
{% endblock %}

{% block go_sha %}
e6fc143b97406c74143d1b4160c0d3448e1d1ecc5ce82fc75692f33d565ba2ec
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

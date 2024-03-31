{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.48.1.tar.gz
{% endblock %}

{% block go_sha %}
203d9a2c4a6a54ba63c2fbcfca83a211712808632dc1a5a61eabb4464addbf73
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}

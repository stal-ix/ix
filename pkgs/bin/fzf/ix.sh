{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v0.54.3.tar.gz
{% endblock %}

{% block go_sha %}
fa4978fe96bf5f11b4354242231eebdd5cc315e4d5be4d05b1b1816e0170de88
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

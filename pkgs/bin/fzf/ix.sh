{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.53.0.tar.gz
{% endblock %}

{% block go_sha %}
0203a2e7cfe93f5177e699b5ca7119e52c88c5cc432614384cc365892a2b0ff9
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.52.1.tar.gz
{% endblock %}

{% block go_sha %}
63daf2f5df458e284cb2f3f82829e3ef66a6e385269345695de21f1e9ccc137a
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.47.0.tar.gz
{% endblock %}

{% block go_sha %}
517603ac0ae91a83546ff6d2f5d1bffde90815c36b397fc4e7059c99e9f880dd
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

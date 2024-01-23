{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.46.0.tar.gz
{% endblock %}

{% block go_sha %}
ceeec5cc3211974859ca539e4c6c81f6fd1ca173446843c51cc24e4bfd23ae62
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

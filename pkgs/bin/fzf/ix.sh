{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.50.0.tar.gz
{% endblock %}

{% block go_sha %}
45941924bbaeb412182b2661b354f40cf91a9baaf5203e4b354233f1d9f0b7af
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

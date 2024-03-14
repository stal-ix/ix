{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.48.0.tar.gz
{% endblock %}

{% block go_sha %}
a011c1b8514f10a043e5cdd35845f84edd14e19ced3ebefb9938c01c72e3ea83
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

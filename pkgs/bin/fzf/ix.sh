{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.46.1.tar.gz
{% endblock %}

{% block go_sha %}
f0fef9ed0127e98628c60ccf50a23cfb343af7a95fcdaeea159df0fcf1b92e61
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.46.1.tar.gz
{% endblock %}

{% block go_sha %}
105db08aadfc52aed59a42cdc008b70491e5d6459d2afae4bdad9829d2feaaaf
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

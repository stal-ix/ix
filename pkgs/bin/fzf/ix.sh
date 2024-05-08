{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.52.0.tar.gz
{% endblock %}

{% block go_sha %}
5713d441a8e2f1e0618886f1681b94a1bc2e8fa6104207d7f194c4830f2ba004
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

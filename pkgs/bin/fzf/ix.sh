{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.48.1.tar.gz
{% endblock %}

{% block go_sha %}
d2b0efc1b39fc9bf8d24efe129fccbc1e7f1eda65f26d2cec888d9a936251968
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

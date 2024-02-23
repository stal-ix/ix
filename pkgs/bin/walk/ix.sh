{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/antonmedv/walk/archive/refs/tags/v1.7.0.tar.gz
{% endblock %}

{% block go_sha %}
d35f2922eb0cf2fc477ed88b1fba87641abb24313ca0c727b336602b10a2c104
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp walk ${out}/bin/
{% endblock %}

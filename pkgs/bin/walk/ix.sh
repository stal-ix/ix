{% extends '//die/go/build.sh' %}

{% block pkg_name %}
walk
{% endblock %}

{% block version %}
1.13.0
{% endblock %}

{% block go_url %}
https://github.com/antonmedv/walk/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
488d50b60dfda1573a61e6d224c2f74296936203b02f6d319cb6718cd5907c7a
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp walk ${out}/bin/
{% endblock %}

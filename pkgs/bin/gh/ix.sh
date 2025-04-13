{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cli
{% endblock %}

{% block version %}
2.14.4
{% endblock %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4390612d4739b90b539d713d6c566fa79f5641d7b5e5d30d4686e85136c6b8c3
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gh ${out}/bin/
{% endblock %}

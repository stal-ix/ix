{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v2.14.4.tar.gz
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

{% block go_version %}
v3
{% endblock %}

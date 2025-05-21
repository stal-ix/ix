{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cli
{% endblock %}

{% block version %}
2.73.0
{% endblock %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5a4944ba4c07708a17e41f7a53570e27c68c369aa7c75ad73d709e3b72e9db30
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gh ${out}/bin/
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cli
{% endblock %}

{% block version %}
2.72.0
{% endblock %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7bbb19666829c409dc6e1e2ed8d2d4d13d741b8191b4d0b51467b2bdaa4c9e02
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

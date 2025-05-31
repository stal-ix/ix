{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cli
{% endblock %}

{% block version %}
2.74.0
{% endblock %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
120a500b906653e3f530009c6f3311365a698e61373c9063764de036fad99dd2
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

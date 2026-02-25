{% extends '//die/go/build.sh' %}

{% block pkg_name %}
esbuild
{% endblock %}

{% block version %}
0.27.3
{% endblock %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
66f3a7b811b8b6568547b98bc37218224aa2c14ad5b2e2999edda9a9fef40740
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block go_bins %}
esbuild
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

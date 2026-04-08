{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gojq
{% endblock %}

{% block version %}
0.12.9
{% endblock %}

{% block go_url %}
https://github.com/itchyny/gojq/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f2c445a6e6df34239abe13b2180c8827e6f934a146ccc2ded4f0b81a7fcc56ea
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gojq
{% endblock %}

{% block go_bins %}
gojq
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

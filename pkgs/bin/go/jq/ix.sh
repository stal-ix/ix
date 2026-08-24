{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gojq
{% endblock %}

{% block version %}
0.12.19
{% endblock %}

{% block go_url %}
https://github.com/itchyny/gojq/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b110bfe7b8d9da89bcf085b68251c44d50201ff9f169842ef6d110f6ab24d201
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gojq
{% endblock %}

{% block go_bins %}
gojq
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

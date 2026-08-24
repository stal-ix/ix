{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dyff
{% endblock %}

{% block version %}
1.12.0
{% endblock %}

{% block go_url %}
https://github.com/homeport/dyff/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b110bfe7b8d9da89bcf085b68251c44d50201ff9f169842ef6d110f6ab24d201
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/dyff
{% endblock %}

{% block go_bins %}
dyff
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

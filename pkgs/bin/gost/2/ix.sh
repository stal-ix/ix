{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gost
{% endblock %}

{% block version %}
3.2.6
{% endblock %}

{% block go_url %}
https://github.com/ginuerzh/gost/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b110bfe7b8d9da89bcf085b68251c44d50201ff9f169842ef6d110f6ab24d201
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/gost
{% endblock %}

{% block go_bins %}
gost
{% endblock %}

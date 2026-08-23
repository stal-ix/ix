{% extends '//die/go/build.sh' %}

{% block pkg_name %}
circumflex
{% endblock %}

{% block version %}
5.0
{% endblock %}

{% block go_url %}
https://github.com/bensadeh/circumflex/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b110bfe7b8d9da89bcf085b68251c44d50201ff9f169842ef6d110f6ab24d201
{% endblock %}

{% block go_bins %}
clx
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

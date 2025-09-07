{% extends '//die/go/build.sh' %}

{% block pkg_name %}
forgejo
{% endblock %}

{% block version %}
12.0.3
{% endblock %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b1deff9ef69e82f992940a0fee698360baf6cd49f2aac5891393cbc0d61ecc88
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
forgejo.org
{% endblock %}

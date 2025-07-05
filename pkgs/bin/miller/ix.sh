{% extends '//die/go/build.sh' %}

{% block pkg_name %}
miller
{% endblock %}

{% block version %}
6.14.0
{% endblock %}

{% block go_url %}
https://github.com/johnkerl/miller/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3656a7169ea0f6c68cf9bfe05548257c59255515fdeb4d2c91e09cf6baf828a1
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/mlr
{% endblock %}

{% block go_bins %}
mlr
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

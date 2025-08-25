{% extends '//die/go/build.sh' %}

{% block pkg_name %}
miller
{% endblock %}

{% block version %}
6.15.0
{% endblock %}

{% block go_url %}
https://github.com/johnkerl/miller/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
02c7004abbb2a9f780bbc17233a0b3d020f7cde5e489248a04020338e3bab427
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

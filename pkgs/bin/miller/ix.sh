{% extends '//die/go/build.sh' %}

{% block pkg_name %}
miller
{% endblock %}

{% block version %}
6.22.0
{% endblock %}

{% block go_url %}
https://github.com/johnkerl/miller/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5a3a2914fb8b78fa2f65708b726e5e06b653759848a41f09081a868b24c58942
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/mlr
{% endblock %}

{% block go_bins %}
mlr
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

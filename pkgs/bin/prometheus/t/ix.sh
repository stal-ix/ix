{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.15.0
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
de7a6bcbfaa70876422b93e0d0f525ed02d9ed972125bba7b6d8d8180cad07d0
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}

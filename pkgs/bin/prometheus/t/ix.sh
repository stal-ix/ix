{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.4.0
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ada4a2d4497a014311300a4d214e54b4ed768fe791fca3d9a38b8fbfaf6e8f3e
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

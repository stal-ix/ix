{% extends '//die/go/build.sh' %}

{% block pkg_name %}
loki
{% endblock %}

{% block version %}
3.3.2
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/grafana/loki/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0d627da1eee2ba29a9a8e1744771734b2599cb7a14438b197cf2418f79d9d4d5
{% endblock %}

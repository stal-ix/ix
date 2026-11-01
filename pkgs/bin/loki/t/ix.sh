{% extends '//die/go/build.sh' %}

{% block pkg_name %}
loki
{% endblock %}

{% block version %}
3.7.9
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_url %}
https://github.com/grafana/loki/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
91bfd498f42c3a8f880e1804152ee40fa732bb0ffde62f090d6598484bdb9adc
{% endblock %}

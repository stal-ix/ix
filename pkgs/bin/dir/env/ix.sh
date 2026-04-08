{% extends '//die/go/build.sh' %}

{% block pkg_name %}
direnv
{% endblock %}

{% block version %}
2.37.1
{% endblock %}

{% block go_url %}
https://github.com/direnv/direnv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
635d92a1d4fe60d539d6604792006b765ce61f67ba894f8acbf6f41f1352a8e2
{% endblock %}

{% block go_bins %}
direnv
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

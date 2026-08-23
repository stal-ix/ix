{% extends '//die/go/build.sh' %}

{% block pkg_name %}
bluetuith
{% endblock %}

{% block version %}
0.2.7
{% endblock %}

{% block go_url %}
https://github.com/darkhz/bluetuith/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
9586383c1703dd4e12e81f5f68e5144481aed8fb0526ee046dc3a80558d0f0dc
{% endblock %}

{% block go_bins %}
bluetuith
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

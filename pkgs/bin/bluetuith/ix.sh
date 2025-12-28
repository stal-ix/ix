{% extends '//die/go/build.sh' %}

{% block pkg_name %}
bluetuith
{% endblock %}

{% block version %}
0.2.6
{% endblock %}

{% block go_url %}
https://github.com/darkhz/bluetuith/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e07d584a653b852f28466a9b5250a9e61bb35daab6b8fc7fed95ca14fd8b3a26
{% endblock %}

{% block go_bins %}
bluetuith
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

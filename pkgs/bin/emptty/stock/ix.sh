{% extends '//die/go/build.sh' %}

{% block pkg_name %}
emptty
{% endblock %}

{% block version %}
0.16.1
{% endblock %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
c1ac5f28c3314207b30237b64c137dd66c6044f1aaeab9cf1ccb923100f29154
{% endblock %}

{% block go_tags %}
nopam
noxlib
noutmp
{% endblock %}

{% block go_bins %}
emptty
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

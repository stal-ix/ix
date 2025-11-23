{% extends '//die/go/build.sh' %}

{% block pkg_name %}
forgejo
{% endblock %}

{% block version %}
13.0.3
{% endblock %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7182837a51e1b6d7764a08d4ffa5f120839da39ce88dba44ad594d62bbc5c0ab
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_bins %}
forgejo.org
{% endblock %}

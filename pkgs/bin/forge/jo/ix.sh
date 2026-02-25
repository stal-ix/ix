{% extends '//die/go/build.sh' %}

{% block pkg_name %}
forgejo
{% endblock %}

{% block version %}
14.0.2
{% endblock %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4018e4f1a8b067696f742adda6080aa8a0b8c2d78ab7149bc6dc48b66093d6ac
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_bins %}
forgejo.org
{% endblock %}

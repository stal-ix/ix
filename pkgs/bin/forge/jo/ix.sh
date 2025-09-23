{% extends '//die/go/build.sh' %}

{% block pkg_name %}
forgejo
{% endblock %}

{% block version %}
12.0.4
{% endblock %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
45e9724c431a9a1ab7b19d78c9f47fd8351e56dacc89bab3824681e167aa673e
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
forgejo.org
{% endblock %}

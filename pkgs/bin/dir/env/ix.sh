{% extends '//die/go/build.sh' %}

{% block pkg_name %}
direnv
{% endblock %}

{% block version %}
2.38.1
{% endblock %}

{% block go_url %}
https://github.com/direnv/direnv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
130dffa4ded56e61acf60f9a3b698be8399269fc9717f01a2d9eddc616e3779e
{% endblock %}

{% block go_bins %}
direnv
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

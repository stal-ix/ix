{% extends '//die/go/build.sh' %}

{% block pkg_name %}
fzf
{% endblock %}

{% block version %}
0.67.0
{% endblock %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ec3da2eb2d0cfec96f06914d896e16de425cc25e5244b9379b17b8224da2f44c
{% endblock %}

{% block go_bins %}
fzf
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block pkg_name %}
fzf
{% endblock %}

{% block version %}
0.66.0
{% endblock %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ebef6000557c6c2e80b194e4740884cab713401e5add898dd4a153d7e912417c
{% endblock %}

{% block go_bins %}
fzf
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

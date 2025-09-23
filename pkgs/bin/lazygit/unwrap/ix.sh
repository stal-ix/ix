{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazygit
{% endblock %}

{% block version %}
0.55.1
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2daa9a1dfd7a706dc2d60dfb2d7a722c025b2da60de19a06165dad2cb7b44be2
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
lazygit
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazydocker
{% endblock %}

{% block version %}
0.25.2
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazydocker/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
529412c6a40e3b78f1091d2326ba9d54930da2cf789f6df73d6b345a452bf7f1
{% endblock %}

{% block go_bins %}
lazydocker
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

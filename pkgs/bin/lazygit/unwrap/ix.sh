{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazygit
{% endblock %}

{% block version %}
0.66.3
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f126566abdc2f37cf9b5e5f71e3e1e34f10abc35738d06798f7237e8201ab28d
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_bins %}
lazygit
{% endblock %}

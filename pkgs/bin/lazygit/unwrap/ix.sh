{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazygit
{% endblock %}

{% block version %}
0.57.0
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b1f751db52253fe1887afcd237e72e8c8f46432b139956dab3f563428c843284
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_bins %}
lazygit
{% endblock %}

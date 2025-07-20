{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gitea
{% endblock %}

{% block version %}
1.24.3
{% endblock %}

{% block go_url %}
https://github.com/go-gitea/gitea/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
871dbb475a4ac31e5b68515dcb0d28bc34229964fdce8c8092d785f32d9c8262
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
gitea
{% endblock %}

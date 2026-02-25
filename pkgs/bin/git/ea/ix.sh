{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gitea
{% endblock %}

{% block version %}
1.25.4
{% endblock %}

{% block go_url %}
https://github.com/go-gitea/gitea/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
06425b36c940d6ce0ed74f00c701a4ba8990c298b74d45a4d57d3a156690083b
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_bins %}
gitea
{% endblock %}

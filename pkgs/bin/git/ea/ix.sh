{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gitea
{% endblock %}

{% block version %}
1.24.6
{% endblock %}

{% block go_url %}
https://github.com/go-gitea/gitea/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
198d9d172445f94c1cc9f42b8121ef19b8d9a6490044e6d12bbfc502dd9ae189
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
gitea
{% endblock %}

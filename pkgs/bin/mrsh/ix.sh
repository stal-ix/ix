{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/emersion/mrsh
{% endblock %}

{% block git_commit %}
cd3c3a48055ab4085d83f149ff4b4feba40b40cb
{% endblock %}

{% block git_sha %}
02d9ee23f7034f17428944cfd78ea1e45cf7de565552aba8e4a452679ee381c3
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}

{% block patch %}
sed -e 's|elif host_machine.*|elif 1 == 1|' -i meson.build
{% endblock %}

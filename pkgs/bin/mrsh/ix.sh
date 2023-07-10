{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/emersion/mrsh
{% endblock %}

{% block git_commit %}
cd3c3a48055ab4085d83f149ff4b4feba40b40cb
{% endblock %}

{% block git_sha %}
ad4a9985d1f93ed25397a3814d7bea582241377e8cbfe44293b4855680b012b2
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}

{% block patch %}
sed -e 's|elif host_machine.*|elif 1 == 1|' -i meson.build
{% endblock %}

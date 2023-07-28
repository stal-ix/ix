{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/emersion/mrsh
{% endblock %}

{% block git_commit %}
cd3c3a48055ab4085d83f149ff4b4feba40b40cb
{% endblock %}

{% block git_sha %}
b363a4a507834005ba2e8442d863bba20a89fb016d6e0c204e4018ee706bf1c5
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}

{% block patch %}
sed -e 's|elif host_machine.*|elif 1 == 1|' -i meson.build
{% endblock %}

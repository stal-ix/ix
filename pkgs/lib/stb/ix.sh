{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/nothings/stb
{% endblock %}

{% block git_commit %}
af1a5bc352164740c1cc1354942b1c6b72eacb8a
{% endblock %}

{% block git_sha %}
7b8d46fde24955cd4610acb74f97414fa4e82036adacd70e0c45bb4e7e48047c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/include
cp *.h ${out}/include/
{% endblock %}

{% block git_version %}
v3
{% endblock %}

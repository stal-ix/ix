{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/nothings/stb
{% endblock %}

{% block git_commit %}
af1a5bc352164740c1cc1354942b1c6b72eacb8a
{% endblock %}

{% block git_sha %}
21b5dd9af86ffaf44f3170021fb53504fe35da08bf376964bfd5eeb812af7ed6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/include
cp *.h ${out}/include/
{% endblock %}

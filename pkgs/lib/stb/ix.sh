{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/nothings/stb
{% endblock %}

{% block git_commit %}
af1a5bc352164740c1cc1354942b1c6b72eacb8a
{% endblock %}

{% block git_sha %}
3377a8ecbbe88f66fa12441db7a1dbd3879ef74279e3363d1c13d0f43de82ca8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/include
cp *.h ${out}/include/
{% endblock %}

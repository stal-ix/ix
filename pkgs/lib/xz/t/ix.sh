{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.4.2.tar.xz
sha:3ee13d0f40148625306b90f9622f8c9660b8082884051b0cfe46f18492f88955
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

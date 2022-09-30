{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.2.7.tar.xz
sha:8712e9acb0b6b49a97d443458a3067dc5c08a025e02dc5f773176c51dd7cfc69
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

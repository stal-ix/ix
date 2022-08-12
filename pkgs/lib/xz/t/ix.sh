{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.2.6.tar.xz
sha:e076ba3439cb7cfc45b908c869f51a8c89f3c9ee9ee982fde28849c015e723a7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

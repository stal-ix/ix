{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.4.4.tar.xz
sha:705d0d96e94e1840e64dec75fc8d5832d34f6649833bec1ced9c3e08cf88132e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
{% if wasi %}
--enable-threads=no
{% endif %}
{% endblock %}

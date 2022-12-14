{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.4.0.tar.xz
sha:5f260e3b43f75cf43ca43d107dd18209f7d516782956a74ddd53288e02a83a31
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

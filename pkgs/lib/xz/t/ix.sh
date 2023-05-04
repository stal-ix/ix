{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.4.3.tar.xz
sha:92177bef62c3824b4badc524f8abcce54a20b7dbcfb84cde0a2eb8b49159518c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

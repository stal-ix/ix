{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/c-util/c-ini/archive/refs/tags/v1.1.0.tar.gz
sha:df01f3e2bd20a3857d9b9d7e4d13c6bf6cda69580ca110e7e41f14ad5423c950
{% endblock %}

{% block lib_deps %}
lib/c/util/utf8
lib/c/util/list
lib/c/util/rbtree
lib/c/util/stdaux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}


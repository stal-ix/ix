{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
graphene
{% endblock %}

{% block version %}
1.10.8
{% endblock %}

{% block fetch %}
https://github.com/ebassi/graphene/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:922dc109d2dc5dc56617a29bd716c79dd84db31721a8493a13a5f79109a4a4ed
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

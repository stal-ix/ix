{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
inih
{% endblock %}

{% block version %}
61
{% endblock %}

{% block fetch %}
https://github.com/benhoyt/inih/archive/refs/tags/r{{self.version().strip()}}.tar.gz
7caf26a2202a4ca689df3fe4175dfa74e0faa18fcca07331bba934fd0ecb8f12
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

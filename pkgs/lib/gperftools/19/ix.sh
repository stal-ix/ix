{% extends '//lib/gperftools/16/ix.sh' %}

{% block version %}
2.19.3
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-{{self.version().strip()}}/gperftools-{{self.version().strip()}}.tar.gz
7c8112efa6f7afb51d3ef0f4d5f307f16e8acd670bc63a88abf8260775d3eead
{% endblock %}

{% block lib_deps %}
lib/tcmalloc/headers
lib/c++/dispatch
lib/reallocarray/impl
lib/build/w/include/next
{% endblock %}

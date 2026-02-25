{% extends '//lib/gperftools/16/ix.sh' %}

{% block version %}
2.18
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-{{self.version().strip()}}/gperftools-{{self.version().strip()}}.tar.gz
a64c8873b63ebf631a5fc05af7f81f3ddf550c3bde37245e10311c7ae7a0c718
{% endblock %}

{% block lib_deps %}
lib/tcmalloc/headers
lib/c++/dispatch
lib/reallocarray/impl
lib/build/w/include/next
{% endblock %}

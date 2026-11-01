{% extends '//lib/gperftools/16/ix.sh' %}

{% block version %}
2.19.2
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-{{self.version().strip()}}/gperftools-{{self.version().strip()}}.tar.gz
48a127fa4cf2cf9f2764dddd9340f158245f53b9fe6ab4fbf007ecaf304d8e1a
{% endblock %}

{% block lib_deps %}
lib/tcmalloc/headers
lib/c++/dispatch
lib/reallocarray/impl
lib/build/w/include/next
{% endblock %}

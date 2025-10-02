{% extends '//lib/gperftools/16/ix.sh' %}

{% block version %}
2.17.2
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-{{self.version().strip()}}/gperftools-{{self.version().strip()}}.tar.gz
bb172a54312f623b53d8b94cab040248c559decdb87574ed873e80b516e6e8eb
{% endblock %}

{% block lib_deps %}
lib/tcmalloc/headers
lib/c++/dispatch
lib/reallocarray/impl
lib/build/w/include/next
{% endblock %}

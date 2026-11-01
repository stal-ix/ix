{% extends '//lib/gperftools/16/ix.sh' %}

{% block version %}
2.18.1
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-{{self.version().strip()}}/gperftools-{{self.version().strip()}}.tar.gz
d18d919175f9e4d740ace6b52f0f4f91284160c454e91b36ffd6456282a02206
{% endblock %}

{% block lib_deps %}
lib/tcmalloc/headers
lib/c++/dispatch
lib/reallocarray/impl
lib/build/w/include/next
{% endblock %}

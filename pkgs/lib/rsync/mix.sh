{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/librsync/librsync/releases/download/v2.3.2/librsync-2.3.2.tar.gz
sha:ef8ce23df38d5076d25510baa2cabedffbe0af460d887d86c2413a1c2b0c676f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

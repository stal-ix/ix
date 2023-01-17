{% extends '//lib/svgren/t/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/agg/archive/refs/tags/2.8.17.tar.gz
sha:40a8d18682f29e11e29eff3d7cc5fab079c35578420191608be049bc9994b45f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

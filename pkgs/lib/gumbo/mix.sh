{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/google/gumbo-parser/archive/refs/tags/v0.10.1.tar.gz
sha:28463053d44a5dfbc4b77bcf49c8cee119338ffa636cc17fc3378421d714efad
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

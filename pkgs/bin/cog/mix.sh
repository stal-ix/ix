{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/Igalia/cog/archive/refs/tags/0.12.4.tar.gz
sha:6ded83243466081d6c12e7cafda3807cf94b4e90859d3112d8211b325c6c5cbc
{% endblock %}

{% block bld_libs %}
lib/c
lib/wpe
lib/webkit
lib/soup/2
{% endblock %}

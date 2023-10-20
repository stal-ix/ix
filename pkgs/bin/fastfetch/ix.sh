{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.1.2.tar.gz
sha:62b02c7e48cb328c4381e7d4af4b23a7c74a2879eeea53525b8c45cc0e79e65f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

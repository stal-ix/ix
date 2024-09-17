{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/e2tools/e2tools/archive/refs/tags/v0.1.2.tar.gz
sha:7e18f382a713da28c6cf1b7b20eead4e0d34a61c8b6ccefb76c42ab71e7b70e4
{% endblock %}

{% block bld_libs %}
lib/c
lib/e2fsprogs
{% endblock %}

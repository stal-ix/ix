{% extends '//lib/svgren/t/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/utki/archive/refs/tags/1.1.187.tar.gz
sha:3a0f0c8d952cb0a32078b9a6d6c2d222fc98edb0ddbc56d73bf6bec1e061d89b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

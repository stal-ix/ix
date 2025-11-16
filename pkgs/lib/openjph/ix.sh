{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/aous72/OpenJPH/archive/refs/tags/0.25.2.tar.gz
ae5f09562cb811cb2fb881c5eb74583e18db941848cfa3c35787e2580f3defc6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

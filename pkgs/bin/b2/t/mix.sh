{% extends '//mix/c_std.sh' %}

{% block fetch %}
https://github.com/bfgroup/b2/archive/refs/tags/4.9.1.tar.gz
sha:81e49dc85e956c3e708bdd02fcfe0b9f406fca8edca54c75c94ebd6c322ed587
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}

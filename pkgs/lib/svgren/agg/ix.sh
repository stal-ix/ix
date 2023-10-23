{% extends '//lib/svgren/t/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/agg/archive/refs/tags/2.8.22.tar.gz
sha:532363aa9040a4b197ece95eea92fc0c1ce20ff385823735bc0c17ef60e1b01c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

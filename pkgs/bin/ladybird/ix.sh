{% extends '//die/c/cmake.sh' %}

{# WIP #}

{% block fetch %}
https://github.com/SerenityOS/ladybird/archive/1ea60e77f22d766a910905b0c1e513c0d9687f25.zip
sha:953fca6b81409aad4648d453686b83e036ea3365ec8d7eb40619f8dbe37b0198
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

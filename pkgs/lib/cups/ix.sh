{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/apple/cups/archive/refs/tags/v2.3.6.tar.gz
3a96912fc88f62c5d8ac9b251bf0652f1cbe7e69cde16919103aea39f31a1a84
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

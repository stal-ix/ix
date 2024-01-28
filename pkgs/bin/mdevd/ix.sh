{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/skarnet/mdevd/archive/refs/tags/v0.1.6.3.tar.gz
sha:97a0481d95a9f76ed810d39ccfb57c41b3f4b4ddeb1796f94743c474719ded24
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/skalibs
{% endblock %}

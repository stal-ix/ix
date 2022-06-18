{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/openSUSE/catatonit/archive/refs/tags/v0.1.7.tar.gz
sha:e22bc72ebc23762dad8f5d2ed9d5ab1aaad567bdd54422f1d1da775277a93296
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

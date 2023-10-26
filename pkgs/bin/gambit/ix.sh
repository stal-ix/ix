{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/gambit/gambit/archive/refs/tags/v4.9.5.tar.gz
sha:758da7b4afe6411e9c4fed14b0cc5ada39b5f1393c1edd4d3dd9c9a06127c310
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

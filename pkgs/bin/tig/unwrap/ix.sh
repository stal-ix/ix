{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/jonas/tig/archive/refs/tags/tig-2.5.7.tar.gz
sha:60a1acfda3238df28dfbe309adc1892a8c9b35138c738f1567c6c3c65c81fb72
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

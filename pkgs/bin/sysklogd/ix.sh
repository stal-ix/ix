{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v2.4.0.tar.gz
sha:acba0862486ecfbbe5a9d488893b89ff166d60cf355cb9f6e8d39c8ce94561cd
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

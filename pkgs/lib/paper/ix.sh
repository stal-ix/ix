{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/rrthomas/libpaper/releases/download/v2.2.3/libpaper-2.2.3.tar.gz
sha:610912042e1f16d44738c2edf9886b9b1e3f5cd6e358ebacf6a62236ac4f0ee6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/p-gen/smenu/archive/refs/tags/v1.2.0.tar.gz
sha:3683b1fbcc09972c229dbd110bde9679a454cfaa76a4c3497139662c11eb60fa
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/magiblot/tvision/archive/c36e190174463ece471bdd1c06959fb8dc343c3c.zip
9c20bbe1511fe6d8b470f528467e2f27
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
lib/curses/mix.sh
{% endblock %}

{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/magiblot/tvision/archive/c36e190174463ece471bdd1c06959fb8dc343c3c.zip
# md5 9c20bbe1511fe6d8b470f528467e2f27
{% endblock %}

{% block deps %}
# lib lib/cxx/package.sh
# lib {{'lib/linux/package.sh' | linux}}
# lib lib/curses/any
# bld dev/build/cmake/package.sh
# bld env/std/package.sh
{% endblock %}

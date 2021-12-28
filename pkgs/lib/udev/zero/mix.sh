{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/illiliti/libudev-zero/archive/938b959402552483f010401051eb800c04607a41.zip
de426bde2fef6f8a6fef2d089d0bf58a
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block patch %}
cat Makefile \
    | sed -e 's|libudev.so.1 libudev.a|libudev.a|' \
    | grep -v 'cp.*libudev.so.1' \
    | grep -v 'ln.*libudev.so.1' \
    > _ && mv _ Makefile
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

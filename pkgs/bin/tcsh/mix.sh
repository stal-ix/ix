{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.24.01.tar.gz
sha:5659a1b973b1f947e36238cb17a00210ac4cff3b496f8f851acd77172ab91d7e
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}

{% block cpp_defines %}
SYSMALLOC
{% endblock %}

{% block patch %}
sed -e 's|.*undef SYS.*||' -i config_f.h
{% endblock %}

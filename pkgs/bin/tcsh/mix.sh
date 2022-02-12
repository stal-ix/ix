{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.23.02.tar.gz
sha:c03f80405136731b3091da735a81cdd848008510324ab325f235aff709e446eb
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

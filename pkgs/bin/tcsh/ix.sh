{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.24.02.tar.gz
sha:6691e15af0719575cad91ce9212c77a754f6c89f0a1f70454625e5e21ba0bdad
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

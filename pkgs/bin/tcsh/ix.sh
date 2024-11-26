{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.24.14.tar.gz
sha:36880f258a63fc11fe72a65098b585ebc4ecdee24388b8ebec97e6ae8e485318
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}

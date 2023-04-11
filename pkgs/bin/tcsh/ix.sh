{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.24.08.tar.gz
sha:d07f1bc164faa6faf63dcf4f30d73eb8149df6de6f9ebfe7b47256234a6366ab
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}

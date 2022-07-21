{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-4.6/joe-4.6.tar.gz/download
sha:495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

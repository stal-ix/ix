{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://invisible-island.net/archives/dialog/dialog-1.3-20240101.tgz
sha:9419eb52b95837312a76ccb26002c5d624fab53abde0859f1c7364179dc0ebad
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

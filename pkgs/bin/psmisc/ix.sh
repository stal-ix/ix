{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/psmisc/psmisc/-/archive/v23.6/psmisc-v23.6.tar.bz2
sha:91573ca0a1a50bd491b7c3cbe400126b0dadef9a2e328030d6469bb2448e0794
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/curses
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

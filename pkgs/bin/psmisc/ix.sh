{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
psmisc
{% endblock %}

{% block version %}
23.7
{% endblock %}

{% block fetch %}
https://gitlab.com/psmisc/psmisc/-/archive/v{{self.version().strip()}}/psmisc-v{{self.version().strip()}}.tar.bz2
sha:c4b1df2e671e8194f6c3063e43cb9afa26cbe9859f1026ff6ad258ac562804f4
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

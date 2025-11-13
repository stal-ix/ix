{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
fetchmail
{% endblock %}

{% block version %}
6.6.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/fetchmail/branch_{{self.version().strip()[:3]}}/fetchmail-{{self.version().strip()}}.tar.xz
38d01fe404e67514df394a6ed1a815bbb61aa90c0fa4402252593aced0e38a1d
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/gettext
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.tar.xz
sha:20744b82531ce7a04d8cee34b07143ad59777612c3695d5855f29fba40fbe3e0
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

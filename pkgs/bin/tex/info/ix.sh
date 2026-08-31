{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
texinfo
{% endblock %}

{% block version %}
7.3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-{{self.version().strip()}}.tar.xz
51f74eb0f51cfa9873b85264dfdd5d46e8957ec95b88f0fb762f63d9e164c72e
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

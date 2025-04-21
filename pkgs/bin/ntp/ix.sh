{% extends '//die/c/autohell.sh' %}

{% block version %}
4.2.8p18
{% endblock %}

{% block pkg_name %}
ntp
{% endblock %}

{% block fetch %}
https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-{{self.version().strip()[:3]}}/ntp-{{self.version().strip()}}.tar.gz
sha:cf84c5f3fb1a295284942624d823fffa634144e096cfc4f9969ac98ef5f468e5
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/event
lib/readline
lib/bsd/overlay
{% endblock %}

{% block configure_flags %}
--with-lineeditlibs=readline
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}

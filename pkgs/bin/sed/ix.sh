{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/sed/sed-4.9.tar.xz
sha:6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

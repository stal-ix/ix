{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-1.21.tar.lz
sha:60e24998727d453a5cf02c54664b97536de46a2b34cd1f4f67c1c1a61bbbad75
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

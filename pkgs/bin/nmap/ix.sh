{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://nmap.org/dist/nmap-7.92.tar.bz2
sha:a5479f2f8a6b0b2516767d2f7189c386c1dc858d997167d7ec5cfc798c7571a1
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/pcre
lib/linux
lib/ssh/2
lib/linear
lib/openssl
{% endblock %}

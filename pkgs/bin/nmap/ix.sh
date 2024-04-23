{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://nmap.org/dist/nmap-7.95.tar.bz2
sha:e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/ssh/2
lib/kernel
lib/pcre/2
lib/linear
lib/openssl
{% endblock %}


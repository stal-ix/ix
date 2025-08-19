{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
nmap
{% endblock %}

{% block version %}
7.98
{% endblock %}

{% block fetch %}
https://nmap.org/dist/nmap-{{self.version().strip()}}.tar.bz2
ce847313eaae9e5c9f21708e42d2ab7b56c7e0eb8803729a3092f58886d897e6
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

{% extends '//die/c/make.sh' %}

{% block pkg_name %}
byedpi
{% endblock %}

{% block version %}
0.16.6
{% endblock %}

{% block fetch %}
https://github.com/hufrea/byedpi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:62e971bbdc34d7af1b875aba8dd98d9ff63a0748c8e50b84cf5c41d327d62e77
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

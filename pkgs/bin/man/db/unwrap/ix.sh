{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/cjwatson/man-db/-/archive/2.11.0/man-db-2.11.0.tar.bz2
sha:3a12924927e4cbe03d04f204b89fa870866efbe7484decb05e46ed2601c8a366
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gdbm
lib/seccomp
lib/pipeline
{% endblock %}

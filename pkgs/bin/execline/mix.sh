{% extends '//die/autohell.sh' %}

{% block fetch %}
https://skarnet.org/software/execline/execline-2.8.2.0.tar.gz
sha:2fdf7607f306e94fe42ebe2b49872d0f654aa2297a576d5a2d8037d4d9583341
{% endblock %}

{% block lib_deps %}
lib/c
lib/skalibs
{% endblock %}

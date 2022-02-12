{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2
sha:1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% extends '//die/autohell.sh' %}

{% block fetch %}
http://deb.debian.org/debian/pool/main/f/file/file_5.39.orig.tar.gz
1c450306053622803a25647d88f80f25
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

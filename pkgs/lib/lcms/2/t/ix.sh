{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms2.15.tar.gz
sha:30d928c9b564c670b6b57c917e5c2599247b713ba6cf2dbd089a8efa70a1952f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

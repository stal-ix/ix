{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://gitlab.xiph.org/xiph/vorbis/-/archive/v1.3.7/vorbis-v1.3.7.tar.bz2
a03aff8a9b32312aca7aea368f8265c5
{% endblock %}

{% block lib_deps %}
lib/c
lib/xiph/ogg
{% endblock %}

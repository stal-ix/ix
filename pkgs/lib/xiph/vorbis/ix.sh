{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
vorbis
{% endblock %}

{% block version %}
1.3.7
{% endblock %}

{% block fetch %}
https://gitlab.xiph.org/xiph/vorbis/-/archive/v{{self.version().strip()}}/vorbis-v{{self.version().strip()}}.tar.bz2
md5:a03aff8a9b32312aca7aea368f8265c5
{% endblock %}

{% block lib_deps %}
lib/c
lib/xiph/ogg
{% endblock %}

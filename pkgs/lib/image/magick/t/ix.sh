{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-40.tar.gz
sha:1e729073dffbddcba599a96706e4657a40c431629e16041d716fe78ba341a448
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/png
lib/jpeg
lib/webp
lib/openexr
lib/jpeg/open
{% endblock %}

{% block bld_tool %}
bld/scripts/fakegit
{% endblock %}

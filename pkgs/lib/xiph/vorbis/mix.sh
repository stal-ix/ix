{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://gitlab.xiph.org/xiph/vorbis/-/archive/v1.3.7/vorbis-v1.3.7.tar.bz2
a03aff8a9b32312aca7aea368f8265c5
{% endblock %}

{% block lib_deps %}
lib/xiph/ogg/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1/16/3/mix.sh
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

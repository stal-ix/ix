{% extends '//die/c/make.sh' %}

{% block fetch %}
https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.4.tar.gz
sha:28a841db0bd5827d645caba9d8015e3a71983dc6e398070b5287ee137ae4436e
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/gettext
{% endblock %}

{% extends '//die/c/make.sh' %}

{% block fetch %}
https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.3.tar.gz
sha:b68db41956daf933828423aa30510e00c12d29ef5916e715e8d4e694fe66ca72
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/gettext
{% endblock %}

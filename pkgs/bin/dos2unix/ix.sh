{% extends '//die/c/make.sh' %}

{% block fetch %}
https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.2.tar.gz
sha:264742446608442eb48f96c20af6da303cb3a92b364e72cb7e24f88239c4bf3a
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/gettext
{% endblock %}

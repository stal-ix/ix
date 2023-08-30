{% extends '//die/c/make.sh' %}

{% block fetch %}
https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.1.tar.gz
sha:da07788bb2e029b0d63f6471d166f68528acd8da2cf14823a188e8a9d5c1fc15
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/gettext
{% endblock %}

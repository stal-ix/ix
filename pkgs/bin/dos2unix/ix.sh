{% extends '//die/c/make.sh' %}

{% block fetch %}
https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.0.tar.gz
sha:7a3b01d01e214d62c2b3e04c3a92e0ddc728a385566e4c0356efa66fd6eb95af
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/gettext
{% endblock %}

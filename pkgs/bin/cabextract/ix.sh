{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.cabextract.org.uk/cabextract-1.10.tar.gz
sha:edfc785ef252460cab7fdfa6fb2599058a6f5618f7f48a4ad22da816da8cb117
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

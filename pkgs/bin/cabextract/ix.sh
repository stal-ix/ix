{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
#https://www.cabextract.org.uk/cabextract-1.10.tar.gz
#sha:edfc785ef252460cab7fdfa6fb2599058a6f5618f7f48a4ad22da816da8cb117
https://www.cabextract.org.uk/cabextract-1.9.tar.gz
sha:1bbc793d83c73288acd7e28ce33ec04955a76c73bf6471424ff835d725fcc4c1
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

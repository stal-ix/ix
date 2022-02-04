{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://www.cabextract.org.uk/cabextract-1.9.1.tar.gz
sha:afc253673c8ef316b4d5c29cc4aa8445844bee14afffbe092ee9469405851ca7
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bin/gettext
{% endblock %}

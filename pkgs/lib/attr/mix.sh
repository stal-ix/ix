{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://git.savannah.nongnu.org/cgit/attr.git/snapshot/attr-2.5.1.tar.gz
7cb2a65f408a2bcdcfdfec60148311b9
{% endblock %}

{% block bld_tool %}
bin/gettext
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

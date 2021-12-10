{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://git.savannah.nongnu.org/cgit/attr.git/snapshot/attr-2.5.1.tar.gz
7cb2a65f408a2bcdcfdfec60148311b9
{% endblock %}

{% block bld_tool %}
gnu/gettext/mix.sh
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

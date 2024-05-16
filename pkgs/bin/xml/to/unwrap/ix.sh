{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://releases.pagure.org/xmlto/xmlto-0.0.28.tar.bz2
sha:1130df3a7957eb9f6f0d29e4aa1c75732a7dfb6d639be013859b5c7ec5421276
{% endblock %}

{% block bld_libs %}
lib/c
lib/xslt
{% endblock %}

{% block bld_tool %}
bld/flex
bin/getopt
{% endblock %}

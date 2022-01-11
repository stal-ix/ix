{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v4.9.0/iso-codes-v4.9.0.tar.bz2
sha:d60541cf1b3acceeef625a4d05f673aff5f22fbe28186e61911357b245c66411
{% endblock %}

{% block bld_tool %}
dev/tool/python
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block strip_pc %}
:
{% endblock %}

{% extends '//die/autorehell.sh' %}

{% block fetch %}
#https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v4.9.0/iso-codes-v4.9.0.tar.bz2
#sha:d60541cf1b3acceeef625a4d05f673aff5f22fbe28186e61911357b245c66411
http://archive.ubuntu.com/ubuntu/pool/main/i/iso-codes/iso-codes_4.9.0.orig.tar.xz
sha:d090112a529dbe37a0a1b46b8246cc1cfca92e0281ba27239426a2b693e28967
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block strip_pc %}
:
{% endblock %}

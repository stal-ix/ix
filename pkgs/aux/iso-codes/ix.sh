{% extends '//die/autorehell.sh' %}

{% block fetch %}
http://deb.debian.org/debian/pool/main/i/iso-codes/iso-codes_4.10.0.orig.tar.xz
sha:ff4e9923f010b654805e27b08d26358b2d5946d704c009719479ec60f94792ee
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block strip_pc %}
:
{% endblock %}

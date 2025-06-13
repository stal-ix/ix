{% extends '//bin/libtool/ix.sh' %}

{% block pkg_name %}
libtool
{% endblock %}

{% block version %}
2.5.4
{% endblock %}

{% block fetch %}
https://ftpmirror.gnu.org/libtool/libtool-{{self.version().strip()}}.tar.gz
da8ebb2ce4dcf46b90098daf962cffa68f4b4f62ea60f798d0ef12929ede6adf
{% endblock %}

{% extends '//bin/libtool/ix.sh' %}

{% block version %}
2.4.6
{% endblock %}

{% block fetch %}
https://ftpmirror.gnu.org/libtool/libtool-{{self.version().strip()}}.tar.gz
sha:e3bd4d5d3d025a36c21dd6af7ea818a2afcd4dfc1ea5a17b39d7854bcd0c06e3
{% endblock %}

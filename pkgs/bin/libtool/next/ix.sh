{% extends '//bin/libtool/ix.sh' %}

{% block pkg_name %}
libtool
{% endblock %}

{% block version %}
2.6.2
{% endblock %}

{% block fetch %}
https://ftpmirror.gnu.org/libtool/libtool-{{self.version().strip()}}.tar.gz
24adb3aa9ae035c70faba344af57d73215eb89281045af6c7ccd307751f8b0bf
{% endblock %}

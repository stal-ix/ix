{% extends '//bin/libtool/ix.sh' %}

{% block pkg_name %}
libtool
{% endblock %}

{% block version %}
2.5.2
{% endblock %}

{% block fetch %}
https://alpha.gnu.org/gnu/libtool/libtool-{{self.version().strip()}}.tar.xz
sha:7b60b4f4c364e8785130d34a98ff07bfa9a6172c20c5db708ab49c6913e48263
{% endblock %}

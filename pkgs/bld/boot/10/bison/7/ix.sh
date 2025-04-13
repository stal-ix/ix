{% extends '//bld/boot/10/bison/t/ix.sh' %}

{% block pkg_name %}
bison
{% endblock %}

{% block version %}
3.7.6
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-{{self.version().strip()}}.tar.xz
sha:67d68ce1e22192050525643fc0a7a22297576682bef6a5c51446903f5aeef3cf
{% endblock %}

{% block bison %}
bld/boot/10/bison/6
{% endblock %}

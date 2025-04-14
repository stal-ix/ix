{% extends '//die/c/make.sh' %}

{% block pkg_name %}
cgit
{% endblock %}

{% block version %}
1.2.3
{% endblock %}

{% block fetch %}
https://git.zx2c4.com/cgit/snapshot/cgit-{{self.version().strip()}}.tar.xz
sha:5a5f12d2f66bd3629c8bc103ec8ec2301b292e97155d30a9a61884ea414a6da4
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/zip
lib/openssl
{% endblock %}

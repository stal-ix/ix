{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
attr
{% endblock %}

{% block version %}
2.5.2
{% endblock %}

{% block fetch %}
https://git.savannah.nongnu.org/cgit/attr.git/snapshot/attr-{{self.version().strip()}}.tar.gz
sha:b266cf45e2256b4d85a86554b42c0218abce40356f5c3026f88e15dcf73df775
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/shim/gnu/basename/overlay
{% endblock %}

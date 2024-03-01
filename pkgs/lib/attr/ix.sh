{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://git.savannah.nongnu.org/cgit/attr.git/snapshot/attr-2.5.2.tar.gz
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

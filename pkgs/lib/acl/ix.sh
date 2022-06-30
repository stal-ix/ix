{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://git.savannah.nongnu.org/cgit/acl.git/snapshot/acl-2.3.1.tar.gz
md5:1c252c11bfc233992078566e92bb7657
{% endblock %}

{% block lib_deps %}
lib/c
lib/attr
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

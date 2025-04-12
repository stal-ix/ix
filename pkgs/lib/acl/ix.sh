{% extends '//die/c/autorehell.sh' %}

{% block version %}
2.3.2
{% endblock %}

{% block fetch %}
https://git.savannah.nongnu.org/cgit/acl.git/snapshot/acl-{{self.version().strip()}}.tar.gz
sha:0fc318808c1e91925398cbe41399a33b74dcf788a1c0af4feae8f7a322c6e6fd
{% endblock %}

{% block lib_deps %}
lib/c
lib/attr
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iso-codes
{% endblock %}

{% block version %}
4.20.1
{% endblock %}

{% block fetch %}
https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v{{self.version().strip()}}/iso-codes-v{{self.version().strip()}}.tar.gz
2d7d9f6084ab9ce6c534ce71a3dd5144b6e474f3c97616459a88f73f44a64bff
{% endblock %}

{% block bld_tool %}
bld/python
bld/gettext
{% endblock %}

{% block strip_pc %}
:
{% endblock %}

{% block env %}
export ISO_CODES=${out}
{% endblock %}

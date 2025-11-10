{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iso-codes
{% endblock %}

{% block version %}
4.19.0
{% endblock %}

{% block fetch %}
https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v{{self.version().strip()}}/iso-codes-v{{self.version().strip()}}.tar.gz
4b143a891feb7d1bb64e44fe3ef253ef36ba1185d1d129c1425338dc6e46e27d
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

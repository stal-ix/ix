{% extends 'old/ix.sh' %}

{% block pkg_name %}
findutils
{% endblock %}

{% block version %}
4.11.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/findutils/findutils-{{self.version().strip()}}.tar.xz
bfd19cb06cc71f3352d567e90284d8cdac02ac89774bbeadf0b533b0c11432fd
{% endblock %}

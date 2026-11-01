{% extends '//bin/gcc/13/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
14.4.0
{% endblock %}

{% block fetch %}
http://ftp.gnu.org/gnu/gcc/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
752b6f567beac83159c77a7680b1316bdd784738bff9a9d070112c09da90f6d9
{% endblock %}

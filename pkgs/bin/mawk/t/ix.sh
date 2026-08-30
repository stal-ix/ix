{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
mawk
{% endblock %}

{% block version %}
1.3.4.20260302
{% endblock %}

{% block fetch %}
https://invisible-mirror.net/archives/mawk/mawk-{{self.version().strip()[:5]}}-{{self.version() | strip | field(3)}}.tgz
e2c08a77d0a84a01f9be454d1ca3872d4f103f9ada683d075198b0c6e965633d
{% endblock %}

{% extends '//lib/icu/static/ix.sh' %}

{% block pkg_name %}
icu
{% endblock %}

{% block version %}
73.2
{% endblock %}

{% block fetch %}
https://github.com/unicode-org/icu/archive/refs/tags/release-{{self.version().strip().replace('.', '-')}}.tar.gz
c15f704e83c221c0680640a995d9db641f5b82098fb4b258a94b7d0561493c88
{% endblock %}

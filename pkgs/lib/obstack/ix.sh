{% extends '//die/c/autorehell.sh' %}

# noauto

{% block pkg_name %}
musl-obstack
{% endblock %}

{% block version %}
1.2.2
{% endblock %}

{% block fetch %}
https://github.com/void-linux/musl-obstack/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6eac88961c58a53f31cccd719b97d1b33c65436c51664e760a9582e2659c1314
{% endblock %}

{% block patch %}
rm bootstrap.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

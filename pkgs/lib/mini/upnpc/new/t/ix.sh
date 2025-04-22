{% extends '//die/c/cmake.sh' %}

# noauto
# check bin/transmission/cli

{% block pkg_name %}
miniupnpd
{% endblock %}

{% block version %}
2.3.6
{% endblock %}

{% block fetch %}
https://github.com/miniupnp/miniupnp/archive/refs/tags/miniupnpd_{{self.version().strip().replace('.', '_')}}.tar.gz
sha:6e5ee2239030486675f558cc840d154e5e2db9517efc96c5b0ab2b2c34c1a128
{% endblock %}

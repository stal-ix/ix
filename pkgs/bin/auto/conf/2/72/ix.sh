{% extends '//bin/auto/conf/2/71/ix.sh' %}

{% block pkg_name %}
autoconf
{% endblock %}

{% block version %}
2.73
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/autoconf/autoconf-{{self.version().strip()}}.tar.xz
9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e
{% endblock %}

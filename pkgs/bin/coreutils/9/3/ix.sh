{% extends '//bin/coreutils/9/1/ix.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
9.3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
sha:a33d2c0bc49be3c79a4794944dcd87103bf497b53a14bafcd431c8ca53975252
{% endblock %}

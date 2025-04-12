{% extends '//bin/coreutils/9/4/ix.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
9.5
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
sha:767ae6a22950ec42f3ba5f7c1de79dd27800ee8e9b8642da5dedb5974a1741e5
{% endblock %}

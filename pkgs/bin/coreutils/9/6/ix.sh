{% extends '//bin/coreutils/9/4/ix.sh' %}

{% block version %}
9.6
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
sha:2bec616375002c92c1ed5ead32a092b174fe44c14bc736d32e5961053b821d84
{% endblock %}

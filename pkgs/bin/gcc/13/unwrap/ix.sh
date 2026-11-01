{% extends '//bin/gcc/12/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
13.5.0
{% endblock %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
ec3df0015ed01411f91f9a9cd5b4da3070eb1222b02fadf4133c30c090399855
{% endblock %}

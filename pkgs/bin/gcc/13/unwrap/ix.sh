{% extends '//bin/gcc/12/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
13.3.0
{% endblock %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
sha:e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da
{% endblock %}

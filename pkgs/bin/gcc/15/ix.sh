{% extends '//bin/gcc/13/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
15.2.0
{% endblock %}

{% block fetch %}
https://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e
{% endblock %}

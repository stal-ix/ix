{% extends '//bin/gcc/13/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
15.3.0
{% endblock %}

{% block fetch %}
https://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
fa59c1beef8995f27c4d71c1df227587189315d3e6faff1bb4306e61b0c530eb
{% endblock %}

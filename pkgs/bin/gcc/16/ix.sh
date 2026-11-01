{% extends '//bin/gcc/13/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
16.2.0
{% endblock %}

{% block fetch %}
https://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
e6738e29597f733270731aa90600f37ffdc045079dfc27ec7e8192cc81085c3e
{% endblock %}

{% extends '//bin/gcc/12/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
13.3.0
{% endblock %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
0845e9621c9543a13f484e94584a49ffc0129970e9914624235fc1d061a0c083
{% endblock %}

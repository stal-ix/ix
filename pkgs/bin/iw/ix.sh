{% extends '//die/c/make.sh' %}

{% block pkg_name %}
iw
{% endblock %}

{% block version %}
6.17
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/software/network/iw/iw-{{self.version().strip()}}.tar.xz
7d182e498289ab39b257da6780d562e415377107f50358ee5b55b8cfe40b1e33
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/pkg/config
{% endblock %}

{% block ld_flags %}
-Wl,-z,nostart-stop-gc
{% endblock %}

{% block make_flags %}
SBINDIR="${out}/bin"
{% endblock %}

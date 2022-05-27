{% extends '//die/make.sh' %}

{% block fetch %}
https://www.kernel.org/pub/software/network/iw/iw-5.19.tar.xz
sha:f167bbe947dd53bb9ebc0c1dcef5db6ad73ac1d6084f2c6f9376c5c360cc4d4e
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/linux
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/pkg/config
{% endblock %}

{% block make_flags %}
SBINDIR="${out}/bin"
{% endblock %}

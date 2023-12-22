{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.kernel.org/pub/software/network/iw/iw-6.7.tar.xz
sha:aacf49c266b29d500d73086798a1c652e760c19126a8599fd811850430789a35
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

{% block make_flags %}
SBINDIR="${out}/bin"
{% endblock %}

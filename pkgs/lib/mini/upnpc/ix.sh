{% extends '//die/c/make.sh' %}

{% block fetch %}
http://miniupnp.free.fr/files/download.php?file=miniupnpc-2.2.3.tar.gz
sha:dce41b4a4f08521c53a0ab163ad2007d18b5e1aa173ea5803bd47a1be3159c24
https://github.com/miniupnp/miniupnp/commit/ed1dc4bb.patch
sha:393c7d2a2a93caf1df9cfa897695098a0cc81e74b448e5b4a333be705044e595
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
cat ${src}/ed* | patch -p2
{% endblock %}

{% block build %}
{{super()}}
>build/upnpc-shared
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

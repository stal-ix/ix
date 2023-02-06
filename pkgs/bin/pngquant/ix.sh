{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://pngquant.org/pngquant-2.9.1-src.tar.gz
sha:ac2138207ef40acd4e5fdae18798139a9d75dae4f1d0837aea918a2a8c433481
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
{% endblock %}

{% block patch %}
sed -e 's|/tmp|${TMPDIR}/|' -i configure
sed -e 's|/tmp|${TMPDIR}/|' -i lib/configure
{% endblock %}

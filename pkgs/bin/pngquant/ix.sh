{% extends '//die/c/autohell.sh' %}

{% block version %}
2.9.1
{% endblock %}

{% block pkg_name %}
pngquant
{% endblock %}

{% block fetch %}
https://pngquant.org/pngquant-{{self.version().strip()}}-src.tar.gz
ac2138207ef40acd4e5fdae18798139a9d75dae4f1d0837aea918a2a8c433481
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

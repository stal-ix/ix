{% extends '//die/c/make.sh' %}

{% block version %}
20240524
{% endblock %}

{% block pkg_name %}
ndhc
{% endblock %}

{% block fetch %}
https://github.com/niklata/ndhc/archive/refs/tags/v{{self.version().strip()[:4]}}-{{self.version().strip()[4:6]}}-{{self.version().strip()[6:]}}.tar.gz
4612e1b01e65e3c64b39e39d8e67e46e571ed651b33e3087d6c0d257cd25644c
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/kernel
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ndhc ${out}/bin/
{% endblock %}

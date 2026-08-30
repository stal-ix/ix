{% extends '//die/c/make.sh' %}

{% block version %}
20260402
{% endblock %}

{% block pkg_name %}
ndhc
{% endblock %}

{% block fetch %}
https://github.com/niklata/ndhc/archive/refs/tags/v{{self.version().strip()[:4]}}-{{self.version().strip()[4:6]}}-{{self.version().strip()[6:]}}.tar.gz
e870fc3031efbf1204a8e55344933ed553134b9b605faec2d0ebcedb0e1a850d
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

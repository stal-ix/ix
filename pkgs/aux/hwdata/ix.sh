{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/vcrhonek/hwdata/archive/refs/tags/v0.389.tar.gz
sha:34813e6821a5dab0f663a363026e4d17e880e5f5f2ed49244c42263b226ff98a
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out} --datarootdir=${out}/share
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export HWDATA_DIR=${out}/share/hwdata
{% endblock %}

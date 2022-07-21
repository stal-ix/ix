{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jeaye/stdman/archive/refs/tags/2022.02.01.tar.gz
sha:84d36791514f20a814f1530e9f4e6ff67e538e0c9b3ef25db4b007f9861c4890
{% endblock %}

{% block bld_tool %}
bld/bash
bld/gzip
{% endblock %}

{% block configure %}
bash configure --prefix="${out}"
{% endblock %}

{% block build %}
:
{% endblock %}

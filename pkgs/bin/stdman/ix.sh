{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jeaye/stdman/archive/refs/tags/2022.07.30.tar.gz
sha:332383e5999e1ac9a6210be8b256608187bb7690a2bff990372e93c2ad4e76ff
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

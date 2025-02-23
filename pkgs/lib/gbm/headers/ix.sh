{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/mesa/mesa/-/raw/06391759f0c705f24d0763a2e3691f55ce5f4f22/src/gbm/main/gbm.h
sha:95f3b4a6ee5175c7cc5d47368d4efb100063fe49e5a6f5b19030ac2ceed73b81
{% endblock %}

{% block step_unpack %}
: no unpack
{% endblock %}

{% block install %}
mkdir ${out}/include
cp ${src}/gbm.h ${out}/include/
{% endblock %}

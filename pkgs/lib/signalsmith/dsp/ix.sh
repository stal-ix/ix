{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
signalsmith-dsp
{% endblock %}

{% block version %}
1.7.1
{% endblock %}

{% block fetch %}
https://github.com/Signalsmith-Audio/dsp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7f679d0751f61079edeaefc6c68b27f5f70a2bc9a4b97b2b02ebf59b7573b359
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
# include/ only forwards to the headers at the top
mkdir -p ${out}/include/signalsmith-dsp
cp *.h ${out}/include/signalsmith-dsp/
{% endblock %}

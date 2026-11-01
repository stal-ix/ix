{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
signalsmith-hilbert
{% endblock %}

{% block version %}
1.0.0
{% endblock %}

{% block fetch %}
https://github.com/Signalsmith-Audio/hilbert-iir/archive/refs/tags/{{self.version().strip()}}.tar.gz
01f811fb0945edd5f146e493251672ab2bff03902a88e8c0574dc6c441e3d0b5
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
# include/ only forwards to the headers at the top
mkdir -p ${out}/include/signalsmith-hilbert
cp *.h ${out}/include/signalsmith-hilbert/
{% endblock %}

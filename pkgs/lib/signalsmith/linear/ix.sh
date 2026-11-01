{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
signalsmith-linear
{% endblock %}

{% block version %}
0.3.1
{% endblock %}

{% block fetch %}
https://github.com/Signalsmith-Audio/linear/archive/refs/tags/{{self.version().strip()}}.tar.gz
b294471f1306baa4d968b230a8836924680e9ca068a667f4659259d66edbe9bc
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
# include/ only forwards to the headers at the top
mkdir -p ${out}/include/signalsmith-linear
cp *.h ${out}/include/signalsmith-linear/
{% endblock %}

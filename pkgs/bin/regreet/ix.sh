{% extends '//die/rust/cargo.sh' %}

{% block version %}
0.2.0
{% endblock %}

{% block cargo_url %}
https://github.com/rharish101/ReGreet/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
3f38c0214b998b4215f29258c588a3800c0f4fb0a7a8fdc136ace20483f77e80
{% endblock %}

{% block bld_libs %}
lib/gtk/4
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/regreet ${out}/bin/
{% endblock %}

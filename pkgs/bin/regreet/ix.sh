{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/rharish101/ReGreet/archive/refs/tags/0.1.3.tar.gz
{% endblock %}

{% block cargo_sha %}
b79d163eead2b062c7ffc90865ef25d8f5e5b831bda0feccae32afe44a34b7e8
{% endblock %}

{% block bld_libs %}
lib/gtk/4
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/regreet ${out}/bin/
{% endblock %}

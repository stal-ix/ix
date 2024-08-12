{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/cktan/tomlc99
{% endblock %}

{% block git_commit %}
5221b3d3d66c25a1dc6f0372b4f824f1202fe398
{% endblock %}

{% block git_sha %}
3d501d3cae0b6b6a48b0b5cb94228a65bd96b094072806ebcc550aa89cd3aaad
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/lib/pkgconfig
cp libtoml.pc.sample ${out}/lib/pkgconfig/toml.pc
sed -e "s|/usr/local|${out}|" \
    -i ${out}/lib/pkgconfig/toml.pc
{% endblock %}

{% extends '//mix/template/std/mix.sh' %}

{% block fetch %}
https://static.rust-lang.org/dist/rust-1.56.1-x86_64-unknown-linux-gnu.tar.gz
4e6a4451665dfa5c8a0af3e3cf8a4a26
{% endblock %}

{% block build %}
{% endblock %}

{% block install %}
for x in cargo rust-std-* rustc; do
    cp -R ${x}/* ${out}/
done
{% endblock %}

{% block cleanup_pkg %}
{% endblock %}

{% block test %}
${out}/bin/cargo
${out}/bin/rustc
{% endblock %}

{% block prepare_env %}
cat << EOF > ${out}/env
export LDFLAGS="-L${out} \${LDFLAGS}"
EOF
{% endblock %}

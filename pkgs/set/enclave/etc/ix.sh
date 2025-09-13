{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/fix

cat << EOF > ${out}/fix/00-symlinks.sh
cd etc
for x in ssl passwd group hostname machine-id hosts; do
    ln -s /ix/realm/system/etc/\${x} \${x}
done
EOF
{% endblock %}

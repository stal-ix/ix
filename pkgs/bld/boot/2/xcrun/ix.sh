{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/2/sbase
bld/boot/1/env
{% endblock %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block build %}
mkdir -p ${out}/bin
cat << EOF > ${out}/bin/xcrun
#!/usr/bin/env sh
exec "\${@}"
EOF
chmod +x ${out}/bin/xcrun
{% endblock %}

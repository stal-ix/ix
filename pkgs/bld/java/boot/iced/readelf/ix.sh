{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/readelf
#!/usr/bin/env sh
echo NEEDED
echo RUNPATH
echo RPATH
EOF
chmod +x ${out}/bin/*
{% endblock %}

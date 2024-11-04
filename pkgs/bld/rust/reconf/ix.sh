{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/t2j
{% include 't2j.py/base64' %}
EOF

base64 -d << EOF > ${out}/bin/j2t
{% include 'j2t.py/base64' %}
EOF

base64 -d << EOF > ${out}/bin/deprof
{% include 'deprof.py/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}

{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/bin/bin_ix
cat << EOF > ${out}/bin/bin_ix/python
{% include 'ix.py' %}
EOF
chmod +x ${out}/bin/bin_ix/python
{% endblock %}

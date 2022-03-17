{% extends '//mix/c_std.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block build %}
cat << EOF > main.c
{% include 'main.c' %}
EOF

cc -o subreaper main.c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp subreaper ${out}/bin/
{% endblock %}

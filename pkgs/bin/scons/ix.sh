{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
SCons
{% endblock %}

{% block version %}
4.10.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/scons/scons/{{self.version().strip()}}/SCons-{{self.version().strip()}}.tar.gz
61e2fc42e0e2c750105d61f26cc1dfebcae9f4103d3dc0e9aeb373016b0d208c
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

extract1 ${src}/SCons*

sed -e "s|= 'ar'| = SCons.Tool.find_program_path(env, 'ar')|" -i SCons/Tool/ar.py

cat << EOF > scons
#!/usr/bin/env sh
PYTHONPATH=${PWD} python3 ${PWD}/SCons/__main__.py "\${@}"
EOF

chmod +x scons
{% endblock %}

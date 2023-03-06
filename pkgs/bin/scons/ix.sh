{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/scons/scons/4.5.0/SCons-4.5.0.tar.gz
sha:601436e62aa817c17e651f35ccccd1ffa8f74a504974ffbb02c3472cfb04ab95
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

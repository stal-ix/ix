{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/scons/scons/4.5.1/SCons-4.5.1.tar.gz
sha:041ce69fec25f729c7ee108aab663b5f691bc2d1a5777e61f77ac9d1bfd20c58
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

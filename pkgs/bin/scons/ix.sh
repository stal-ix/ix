{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
SCons
{% endblock %}

{% block version %}
4.10.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/scons/scons/{{self.version().strip()}}/SCons-{{self.version().strip()}}.tar.gz
99c0e94a42a2c1182fa6859b0be697953db07ba936ecc9817ae0d218ced20b15
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

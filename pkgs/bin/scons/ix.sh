{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
SCons
{% endblock %}

{% block version %}
4.9.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/scons/scons/{{self.version().strip()}}/SCons-{{self.version().strip()}}.tar.gz
e2d78aa56e4646e5dbaf50c0758c6d1e4b0418464d8d6d07a09beb6cf257538f
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

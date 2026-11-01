{# pi (pi.dev) ships a self-contained esbuild bundle in dist/bundle; the only
   runtime modules it leaves external are jiti (loads .ts extensions) and
   photon-node (image resize), both dependency-free npm tarballs. So no
   npm install, no network: three sha-pinned tarballs laid out the way
   node resolution expects. #}

{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
pi-coding-agent
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://registry.npmjs.org/@earendil-works/pi-coding-agent/-/pi-coding-agent-{{self.version().strip()}}.tgz
d155c16ef6fa00960fbf58b2911536e80b05f33700e0b14fbd08967ede0c7428
https://registry.npmjs.org/jiti/-/jiti-2.7.0.tgz
8dd0d365fb49c0e7cc42d6a00df6fb2da9056fc24492094346fc34ecdbcf28ca
https://registry.npmjs.org/@silvia-odwyer/photon-node/-/photon-node-0.3.4.tgz
5a23015c1cd2c38e3c492dd96929985247b92f52d2ff0fb948d29edca52bc50a
{% endblock %}

{% block step_unpack %}
mkdir -p src/node_modules/jiti src/node_modules/@silvia-odwyer/photon-node
cd src
extract1 ${src}/pi-coding-agent-{{self.version().strip()}}.tgz
(cd node_modules/jiti && extract1 ${src}/jiti-2.7.0.tgz)
(cd node_modules/@silvia-odwyer/photon-node && extract1 ${src}/photon-node-0.3.4.tgz)
{% endblock %}

{% block install %}
mkdir -p ${out}/bin ${out}/share/pi
cp -R . ${out}/share/pi/
# dist/bundle/cli.js carries #!/usr/bin/env node; node comes from the bin/pi hub
ln -s ../share/pi/dist/bundle/cli.js ${out}/bin/pi
{% endblock %}

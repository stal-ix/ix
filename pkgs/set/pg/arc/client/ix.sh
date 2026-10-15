{% extends '//die/gen.sh' %}

{# Yandex's arc client (arc version 21637152), built on merlin with
   ya make -r --musl. It is not a public source: the binary lives in the
   lab's private s3, bucket pg, which s3.lab.mesh serves inside our networks
   only. The URL is assembled with Jinja on purpose: the lab mirrors every
   plain URL line of this tree (pkgs/die/scripts/urls.txt) into the public
   pkgsrc CAS, and lines with spaces or template expressions are left out.
   Keep set/pg/arc out of set/ci too: CI builds go to the public package
   cache. #}

{% set arc_sha = 'bcfc9e9d458c283b01a70ee468cd1c823eb9d78c3386568596442d64ae1f2f28' %}
{% set arc_s3 = 'https://s3.lab.mesh/pg/arc' %}

{% block fetch %}
{{arc_s3}}/{{arc_sha}}/arc
{{arc_sha}}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp ${src}/arc ${out}/bin/arc
chmod 0755 ${out}/bin/arc
{% endblock %}

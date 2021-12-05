{% extends '//dev/lang/perl5/mix.sh' %}

{% block fetch %}
{{super()}}
https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz
80bb18a8e6240fcf7ec2f7b57601c170
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/expat/mix.sh
{% endblock %}

{% block unpack %}
${untar} ${src}/perl* && cd perl* && cd ext
${untar} ${src}/XML*
mv XML* XML-Parser
ln -s XML-Parser/Expat XML-Parser-Expat
cd ..
{% endblock %}

{% block bld_tool %}
dev/lang/perl5/mix.sh
{{super()}}
{% endblock %}

{% block configure %}
{{super().strip()}}

cat << EOF >> config.sh
export static_ext="\${static_ext} XML/Parser/Expat"
EOF
{% endblock %}

{% block build %}
make -j ${make_thrs} miniperl

cat << EOF > miniperl
#!$(command -v dash)
perl -I${PWD} "\$@"
EOF

chmod +x miniperl

make -j ${make_thrs}
{% endblock %}

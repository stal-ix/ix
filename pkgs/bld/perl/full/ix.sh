{% extends '//bin/perl/ix.sh' %}

{% block fetch %}
{{super()}}
https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz
80bb18a8e6240fcf7ec2f7b57601c170
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/expat
{% endblock %}

{% block unpack %}
# TODO(pg): proper extract1
extract0 ${src}/perl*
cd perl*
cd ext
extract0 ${src}/XML*
mv XML* XML-Parser
ln -s XML-Parser/Expat XML-Parser-Expat
cd ..
{% endblock %}

{% block configure %}
{{super()}}
cat << EOF >> config.sh
export static_ext="\${static_ext} XML/Parser/Expat"
EOF
{% endblock %}

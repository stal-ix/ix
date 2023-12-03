{% extends '//bin/perl/host/ix.sh' %}

{% block fetch %}
https://www.cpan.org/src/5.0/perl-5.38.2.tar.gz
sha:a0a31534451eb7b83c7d6594a497543a54d488bc90ca00f5e34762577f40655e
{% endblock %}

{% block dup_symbols %}
Perl_add_above_Latin1_folds
Perl_get_ANYOFHbbm_contents
Perl_get_ANYOFM_contents
Perl_populate_anyof_bitmap_from_invlist
Perl_populate_bitmap_from_invlist
Perl_populate_invlist_from_bitmap
Perl_set_ANYOF_arg
Perl_reg_add_data
{% endblock %}

{% block build %}
make libperl.a
llvm-objcopy \
{% for x in ix.parse_list(self.dup_symbols()) %}
    --redefine-sym {{x}}=xxx_{{x}} \
{% endfor %}
    libperl.a
{{super()}}
{% endblock %}

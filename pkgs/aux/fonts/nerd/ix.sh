{% extends '//die/fonts.sh' %}

{% block pkg_name %}
nerd-fonts
{% endblock %}

{% block version %}
3.5.1
{% endblock %}

{% block fetch %}
https://github.com/ryanoasis/nerd-fonts/releases/download/v{{self.version().strip()}}/NerdFontsSymbolsOnly.zip
fdca3682534f6f65e1ccb2345b0362ccf67d9b8eca7c8025330946e93e2473bc
{% endblock %}

{% block skip_dirs %}0{% endblock %}

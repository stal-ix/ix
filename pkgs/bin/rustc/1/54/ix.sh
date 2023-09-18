{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://static.rust-lang.org/dist/rustc-1.54.0-src.tar.gz
sha:ac8511633e9b5a65ad030a1a2e5bdaa841fdfe3132f2baaa52cc04e71c6c6976
{% endblock %}

{% block bld_tool %}
bin/mrustc/rustc
bin/mrustc/minicargo
{% endblock %}

{% block script_init_env %}
{{super()}}
export CPPFLAGS=
{% endblock %}

{% block build %}
export VENDOR_DIR=${PWD}/vendor
export MRUSTC_PATH=$(which rustc)
minicargo --vendor-dir ${VENDOR_DIR} --output-dir ${TMPDIR} library/std
#mi --vendor-dir $(VENDOR_DIR) --script-overrides ../script-overrides/stable-$(RUSTC_VERSION)-$(PLATFORM)/ --output-dir $(LIBDIR_S) $(RUST_SRC_LIBS)panic_unwind
#    $V+MRUSTC_PATH=$(abspath $(BINDIR_S)rustc) $(MINICARGO) --vendor-dir $(VENDOR_DIR) --script-overrides ../script-overrides/stable-$(RUSTC_VERSION)-$(PLATFORM)/ --output-dir $(LIBDIR_S) $(RUST_SRC_LIBS)test
{% endblock %}

Personal host VPN and split-DNS overlay, installed as set/pg/yandex/vpn.
Shared system and DNS packages do not contain VPN-specific settings.

The service is yandex_vpn. It runs the bundled client and an SSH management
bridge under the regular Stalix supervisor. Reconnects use the Mac Keychain;
the Mac SSH server and approved signer must remain available. Private keys
are not exported. Only signature requests pass through the Mac.

Persistent, root-only configuration is /home/pg/.config/yandex-vpn/:
  client.ovpn  trusted CA/tls-auth material and management authentication
  config.json  signer_command argv, dns, routes, route_yandex_networks
  openvpn.log  protected upstream log (may contain an authentication token)
The controller's public state is /var/run/yandex_vpn/status.json.

The profile must use dev tun-yandex, dev-type tun, management-hold,
management-external-cert, management-external-key, ifconfig-noexec,
route-noexec, script-security 2, up-restart, and these push filters:
  pull-filter ignore "redirect-gateway"
  pull-filter ignore "route "
  pull-filter ignore "route-ipv6 "
Do not add persist-tun: process exit removes its interface and active routes.
The controller supplies the local management socket and up hook.

With route_yandex_networks=true, routes include the Yandex and Yandex.Cloud
prefixes in scripts/networks.json, installed under share/yandex-vpn in the
system realm. The snapshot records its date and RIPEstat sources (AS13238,
AS200350). It includes the entire allocated 2a02:6b8::/29 IPv6 range. New
hosts inside these networks need no individual route additions. Refresh
the snapshot when the organizations announce new address ranges; do not
blindly import prefixes from unrelated operators. config.json's routes can
add explicit exceptions/destinations. Corporate DNS is included as well.
The server's 2000::/3 full-IPv6 route remains deliberately ignored.

IPv4 destinations live in table 186. Policy rule 18600 selects that table
for packets WITHOUT fwmark 186. OpenVPN explicitly uses udp4 and marks its
encrypted outer packets 186, so VPN gateways use the normal main/default
route even when they belong to a routed Yandex prefix. This also follows
changes to the normal WAN gateway without per-VPN-server bypass routes.
IPv6 destinations use main: home's kernel lacks IPV6_MULTIPLE_TABLES, and
the outer VPN connection is IPv4. LAN, mesh and other Internet addresses
continue using the ordinary routes. Public services in these Yandex ranges
also use the VPN, as selected by pg.
Unreachable routes at metric 42760 remain while disconnected; active tunnel
routes at metric 100 take precedence. This prevents corporate DNS falling
back through the LAN default route. The LAN and mesh routes are preserved.

The existing dnsproxy retains port 53, enables AAAA, and forwards yandex.net
and yandex-team.ru to 84.252.160.1. ovpn.net.yandex.net and yanet.org use public
DNS to bootstrap the VPN. mesh/local retain their existing resolvers. There
is no public fallback for corporate zones. Valid cached records may survive
an outage until their normal TTL; optimistic stale caching is disabled.
The corporate DNS address in config.json must match the dnsproxy recipe.

Run route validation tests with:
  python3 pkgs/set/pg/yandex/vpn/scripts/test_routes.py

To deploy: build/test, commit, then ./ix mut system +set/pg/yandex/vpn.
To disable: ./ix mut system -set/pg/yandex/vpn. This restores normal DNS and
removes the supervised VPN service. Remove policy rule 18600, table 186 and
the remaining IPv6 unreachable routes only after corporate DNS forwarding
has been removed.

Package layout:
  set/pg/yandex/vpn/scripts  controller and network hook executables
  set/pg/yandex/vpn/runit    supervised service launcher
  set/pg/yandex/vpn/runit/deps  what the service executes; its uid is in the
                             run file, so a rebuild of any of them restarts it
  set/pg/yandex/vpn/dns      personal override of the dnsproxy launcher
  set/pg/yandex/vpn          hub collecting the overlay and runtime packages
The executables use stable system paths under /bin.

Prepare without activation: ./ix let system +set/pg/yandex/vpn.
Install the overlay as a separate top-level package in the system realm;
it takes precedence over the shared dnsproxy launcher. Removing the overlay
restores the base launcher. No flag or dependency is added to set/pg/system.

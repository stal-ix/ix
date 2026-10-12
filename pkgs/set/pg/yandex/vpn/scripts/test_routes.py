"""Route admission tests; never execute networking commands."""
import importlib.util
import ipaddress
import json
import os
from pathlib import Path
import types
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location('vpn_controller', Path(__file__).with_name('controller.py'))
vpn = importlib.util.module_from_spec(spec)
spec.loader.exec_module(vpn)


class Routes(unittest.TestCase):
    def test_rejects_default_and_local_networks(self):
        for route in ['0.0.0.0/0', '::/0', '2000::/3', '10.0.0.0/8',
                      '10.0.0.248/32', '192.168.100.0/24', '127.0.0.1/32',
                      '2a02:6b0::/28', '2600::/29']:
            with self.subTest(route=route), patch.object(vpn, 'config', return_value={
                    'dns': '84.252.160.1', 'routes': [route]}):
                with self.assertRaises(ValueError):vpn.destinations()

    def test_accepts_different_gateway_assignments_and_only_explicit_routes(self):
        target = '2a02:6b8:c43:f3c8:0:4aea:5671:0/128'
        for address in ['10.211.43.46', '10.215.198.99']:
            calls=[]
            def ip(*args, **kw):
                calls.append(args)
                return types.SimpleNamespace(stdout='[]' if args[:3] == ('-4','-j','rule') else '')
            env={'dev':'tun-yandex', 'ifconfig_local':address,
                 'ifconfig_netmask':'255.255.255.192',
                 'ifconfig_ipv6_local':'2a02:6bf:8080:2a::1:0', 'ifconfig_ipv6_netbits':'64'}
            with patch.dict(os.environ,env,clear=True), patch.object(vpn,'ip',side_effect=ip), \
                 patch.object(vpn,'config',return_value={'dns':'84.252.160.1','routes':[target]}):
                vpn.network_up()
            routes=[args for args in calls if len(args)>2 and args[1:3]==('route','replace')]
            self.assertEqual({args[3] for args in routes},{'84.252.160.1/32',target})
            self.assertIn(('-4','route','replace','84.252.160.1/32','table','186',
                           'dev','tun-yandex','metric','100','proto','186'),routes)
            self.assertIn(('-6','route','replace',target,'dev','tun-yandex',
                           'metric','100','proto','186'),routes)
            self.assertIn(('-4','rule','add','priority','18600','not','fwmark','186','lookup','186'),calls)
            guards=[args for args in calls if 'unreachable' in args]
            self.assertEqual(len(guards),2)

    def test_refuses_local_vpn_assignment_before_network_changes(self):
        with patch.dict(os.environ,{'dev':'tun-yandex','ifconfig_local':'10.0.0.2',
                                    'ifconfig_netmask':'255.255.255.0'},clear=True), \
             patch.object(vpn,'ip') as ip:
            with self.assertRaises(ValueError):vpn.network_up()
            ip.assert_not_called()

    def test_published_networks_cover_services_but_not_ordinary_internet(self):
        cfg={'dns':'84.252.160.1','routes':[],'route_yandex_networks':True}
        with patch.object(vpn,'config',return_value=cfg), patch.object(vpn,'NETWORKS',
                Path(__file__).with_name('networks.json')):
            nets=vpn.destinations()
        for address in ['2a02:6b8:c43:f3c8:0:4aea:5671:0',
                        '2a02:6bf:8080:72a::1:21','213.180.205.147',
                        '5.255.240.6','84.252.160.1','158.160.1.1']:
            self.assertTrue(any(ipaddress.ip_address(address) in n for n in nets),address)
        for address in ['1.1.1.1','8.8.8.8','10.0.0.1','192.168.100.64','2606:4700::1111']:
            self.assertFalse(any(ipaddress.ip_address(address) in n for n in nets),address)

    def test_policy_rule_is_idempotent_and_refuses_other_owners(self):
        # iproute2 represents a standalone "not" flag as JSON null.
        existing={'priority':18600,'not':None,'fwmark':'0xba','table':'186'}
        with patch.object(vpn,'ip',return_value=types.SimpleNamespace(stdout=json.dumps([existing]))) as ip:
            vpn.policy_rules()
            self.assertEqual(ip.call_count,1)
        existing['table']=123
        with patch.object(vpn,'ip',return_value=types.SimpleNamespace(stdout=json.dumps([existing]))) as ip:
            with self.assertRaises(ValueError):vpn.policy_rules()
            self.assertEqual(ip.call_count,1)


if __name__=='__main__':unittest.main()

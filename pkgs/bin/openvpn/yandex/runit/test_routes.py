"""Route admission tests; never execute networking commands."""
import importlib.util
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
                      '10.0.0.248/32', '192.168.100.0/24', '127.0.0.1/32']:
            with self.subTest(route=route), patch.object(vpn, 'config', return_value={
                    'dns': '84.252.160.1', 'routes': [route]}):
                with self.assertRaises(ValueError):vpn.destinations()

    def test_accepts_different_gateway_assignments_and_only_explicit_routes(self):
        target = '2a02:6b8:c43:f3c8:0:4aea:5671:0/128'
        for address in ['10.211.43.46', '10.215.198.99']:
            calls=[]
            def ip(*args, **kw):
                calls.append(args)
                return types.SimpleNamespace(stdout='')
            env={'dev':'tun-yandex', 'ifconfig_local':address,
                 'ifconfig_netmask':'255.255.255.192',
                 'ifconfig_ipv6_local':'2a02:6bf:8080:2a::1:0', 'ifconfig_ipv6_netbits':'64'}
            with patch.dict(os.environ,env,clear=True), patch.object(vpn,'ip',side_effect=ip), \
                 patch.object(vpn,'config',return_value={'dns':'84.252.160.1','routes':[target]}):
                vpn.network_up()
            routes=[args for args in calls if len(args)>2 and args[1:3]==('route','replace')]
            self.assertEqual({args[3] for args in routes},{'84.252.160.1/32',target})
            self.assertTrue(all(args[4:6]==('dev','tun-yandex') for args in routes))
            guards=[args for args in calls if 'unreachable' in args]
            self.assertEqual(len(guards),2)

    def test_refuses_local_vpn_assignment_before_network_changes(self):
        with patch.dict(os.environ,{'dev':'tun-yandex','ifconfig_local':'10.0.0.2',
                                    'ifconfig_netmask':'255.255.255.0'},clear=True), \
             patch.object(vpn,'ip') as ip:
            with self.assertRaises(ValueError):vpn.network_up()
            ip.assert_not_called()


if __name__=='__main__':unittest.main()

import os
import unittest
import search_events.connection as conn
import search_events.env_configuration as configuration


class ConnectionTest(unittest.TestCase):

    def test_env_not_selected(self):
        with self.assertRaises(KeyError):
            conn.get_es_connection()

    def test_env_wrong_selection(self):
        os.environ['environment'] = 'x'
        with self.assertRaises(ValueError):
            conn.get_es_connection()

    def test_dev_env_selected(self):
        os.environ['environment'] = 'dev'
        self.assertTrue(configuration.Development.ES_HOST in str(conn.get_es_connection()))

    def test_tst_env_selected(self):
        os.environ['environment'] = 'tst'
        self.assertTrue(configuration.Test.ES_HOST in str(conn.get_es_connection()))

    def test_tst_env_selected(self):
        os.environ['environment'] = 'prd'
        self.assertTrue(configuration.Production.ES_HOST in str(conn.get_es_connection()))

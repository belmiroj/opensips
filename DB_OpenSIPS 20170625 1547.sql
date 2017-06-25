-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.73


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema opensips
--

CREATE DATABASE IF NOT EXISTS opensips;
USE opensips;

--
-- Definition of table `acc`
--

DROP TABLE IF EXISTS `acc`;
CREATE TABLE `acc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` char(16) NOT NULL DEFAULT '',
  `from_tag` char(64) NOT NULL DEFAULT '',
  `to_tag` char(64) NOT NULL DEFAULT '',
  `callid` char(64) NOT NULL DEFAULT '',
  `sip_code` char(3) NOT NULL DEFAULT '',
  `sip_reason` char(32) NOT NULL DEFAULT '',
  `time` datetime NOT NULL,
  `duration` int(11) unsigned NOT NULL DEFAULT '0',
  `ms_duration` int(11) unsigned NOT NULL DEFAULT '0',
  `setuptime` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `callid_idx` (`callid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acc`
--

/*!40000 ALTER TABLE `acc` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc` ENABLE KEYS */;


--
-- Definition of table `active_watchers`
--

DROP TABLE IF EXISTS `active_watchers`;
CREATE TABLE `active_watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` char(128) NOT NULL,
  `watcher_username` char(64) NOT NULL,
  `watcher_domain` char(64) NOT NULL,
  `to_user` char(64) NOT NULL,
  `to_domain` char(64) NOT NULL,
  `event` char(64) NOT NULL DEFAULT 'presence',
  `event_id` char(64) DEFAULT NULL,
  `to_tag` char(64) NOT NULL,
  `from_tag` char(64) NOT NULL,
  `callid` char(64) NOT NULL,
  `local_cseq` int(11) NOT NULL,
  `remote_cseq` int(11) NOT NULL,
  `contact` char(128) NOT NULL,
  `record_route` text,
  `expires` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `reason` char(64) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `socket_info` char(64) NOT NULL,
  `local_contact` char(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `active_watchers_idx` (`presentity_uri`,`callid`,`to_tag`,`from_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `active_watchers`
--

/*!40000 ALTER TABLE `active_watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_watchers` ENABLE KEYS */;


--
-- Definition of table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip` char(50) NOT NULL,
  `mask` tinyint(4) NOT NULL DEFAULT '32',
  `port` smallint(5) unsigned NOT NULL DEFAULT '0',
  `proto` char(4) NOT NULL DEFAULT 'any',
  `pattern` char(64) DEFAULT NULL,
  `context_info` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;


--
-- Definition of table `aliases`
--

DROP TABLE IF EXISTS `aliases`;
CREATE TABLE `aliases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `contact` char(255) NOT NULL DEFAULT '',
  `received` char(128) DEFAULT NULL,
  `path` char(255) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2020-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT '1.00',
  `callid` char(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT '13',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cflags` char(255) DEFAULT NULL,
  `user_agent` char(255) NOT NULL DEFAULT '',
  `socket` char(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `sip_instance` char(255) DEFAULT NULL,
  `attr` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias_idx` (`username`,`domain`,`contact`,`callid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aliases`
--

/*!40000 ALTER TABLE `aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `aliases` ENABLE KEYS */;


--
-- Definition of table `b2b_entities`
--

DROP TABLE IF EXISTS `b2b_entities`;
CREATE TABLE `b2b_entities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL,
  `state` int(2) NOT NULL,
  `ruri` char(128) DEFAULT NULL,
  `from_uri` char(128) NOT NULL,
  `to_uri` char(128) NOT NULL,
  `from_dname` char(64) DEFAULT NULL,
  `to_dname` char(64) DEFAULT NULL,
  `tag0` char(64) NOT NULL,
  `tag1` char(64) DEFAULT NULL,
  `callid` char(64) NOT NULL,
  `cseq0` int(11) NOT NULL,
  `cseq1` int(11) DEFAULT NULL,
  `contact0` char(128) NOT NULL,
  `contact1` char(128) DEFAULT NULL,
  `route0` text,
  `route1` text,
  `sockinfo_srv` char(64) DEFAULT NULL,
  `param` char(128) NOT NULL,
  `lm` int(11) NOT NULL,
  `lrc` int(11) DEFAULT NULL,
  `lic` int(11) DEFAULT NULL,
  `leg_cseq` int(11) DEFAULT NULL,
  `leg_route` text,
  `leg_tag` char(64) DEFAULT NULL,
  `leg_contact` char(128) DEFAULT NULL,
  `leg_sockinfo` char(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `b2b_entities_idx` (`type`,`tag0`,`tag1`,`callid`),
  KEY `b2b_entities_param` (`param`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `b2b_entities`
--

/*!40000 ALTER TABLE `b2b_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `b2b_entities` ENABLE KEYS */;


--
-- Definition of table `b2b_logic`
--

DROP TABLE IF EXISTS `b2b_logic`;
CREATE TABLE `b2b_logic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `si_key` char(64) NOT NULL,
  `scenario` char(64) DEFAULT NULL,
  `sstate` int(2) NOT NULL,
  `next_sstate` int(2) NOT NULL,
  `sparam0` char(64) DEFAULT NULL,
  `sparam1` char(64) DEFAULT NULL,
  `sparam2` char(64) DEFAULT NULL,
  `sparam3` char(64) DEFAULT NULL,
  `sparam4` char(64) DEFAULT NULL,
  `sdp` tinytext,
  `lifetime` int(10) NOT NULL DEFAULT '0',
  `e1_type` int(2) NOT NULL,
  `e1_sid` char(64) DEFAULT NULL,
  `e1_from` char(128) NOT NULL,
  `e1_to` char(128) NOT NULL,
  `e1_key` char(64) NOT NULL,
  `e2_type` int(2) NOT NULL,
  `e2_sid` char(64) DEFAULT NULL,
  `e2_from` char(128) NOT NULL,
  `e2_to` char(128) NOT NULL,
  `e2_key` char(64) NOT NULL,
  `e3_type` int(2) DEFAULT NULL,
  `e3_sid` char(64) DEFAULT NULL,
  `e3_from` char(128) DEFAULT NULL,
  `e3_to` char(128) DEFAULT NULL,
  `e3_key` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `b2b_logic_idx` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `b2b_logic`
--

/*!40000 ALTER TABLE `b2b_logic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b2b_logic` ENABLE KEYS */;


--
-- Definition of table `cachedb`
--

DROP TABLE IF EXISTS `cachedb`;
CREATE TABLE `cachedb` (
  `keyname` char(255) NOT NULL,
  `value` text NOT NULL,
  `counter` int(10) NOT NULL DEFAULT '0',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cachedb`
--

/*!40000 ALTER TABLE `cachedb` DISABLE KEYS */;
/*!40000 ALTER TABLE `cachedb` ENABLE KEYS */;


--
-- Definition of table `carrierfailureroute`
--

DROP TABLE IF EXISTS `carrierfailureroute`;
CREATE TABLE `carrierfailureroute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` int(10) unsigned NOT NULL DEFAULT '0',
  `domain` char(64) NOT NULL DEFAULT '',
  `scan_prefix` char(64) NOT NULL DEFAULT '',
  `host_name` char(128) NOT NULL DEFAULT '',
  `reply_code` char(3) NOT NULL DEFAULT '',
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `next_domain` char(64) NOT NULL DEFAULT '',
  `description` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carrierfailureroute`
--

/*!40000 ALTER TABLE `carrierfailureroute` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrierfailureroute` ENABLE KEYS */;


--
-- Definition of table `carrierroute`
--

DROP TABLE IF EXISTS `carrierroute`;
CREATE TABLE `carrierroute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` int(10) unsigned NOT NULL DEFAULT '0',
  `domain` char(64) NOT NULL DEFAULT '',
  `scan_prefix` char(64) NOT NULL DEFAULT '',
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `prob` float NOT NULL DEFAULT '0',
  `strip` int(11) unsigned NOT NULL DEFAULT '0',
  `rewrite_host` char(128) NOT NULL DEFAULT '',
  `rewrite_prefix` char(64) NOT NULL DEFAULT '',
  `rewrite_suffix` char(64) NOT NULL DEFAULT '',
  `description` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carrierroute`
--

/*!40000 ALTER TABLE `carrierroute` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrierroute` ENABLE KEYS */;


--
-- Definition of table `cc_agents`
--

DROP TABLE IF EXISTS `cc_agents`;
CREATE TABLE `cc_agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` char(128) NOT NULL,
  `location` char(128) NOT NULL,
  `logstate` int(10) unsigned NOT NULL DEFAULT '0',
  `skills` char(255) NOT NULL,
  `last_call_end` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_agentid` (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cc_agents`
--

/*!40000 ALTER TABLE `cc_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_agents` ENABLE KEYS */;


--
-- Definition of table `cc_calls`
--

DROP TABLE IF EXISTS `cc_calls`;
CREATE TABLE `cc_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` int(11) NOT NULL,
  `ig_cback` int(11) NOT NULL,
  `no_rej` int(11) NOT NULL,
  `setup_time` int(11) NOT NULL,
  `eta` int(11) NOT NULL,
  `last_start` int(11) NOT NULL,
  `recv_time` int(11) NOT NULL,
  `caller_dn` char(128) NOT NULL,
  `caller_un` char(128) NOT NULL,
  `b2buaid` char(128) NOT NULL DEFAULT '',
  `flow` char(128) NOT NULL,
  `agent` char(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`b2buaid`),
  KEY `b2buaid_idx` (`b2buaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cc_calls`
--

/*!40000 ALTER TABLE `cc_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_calls` ENABLE KEYS */;


--
-- Definition of table `cc_cdrs`
--

DROP TABLE IF EXISTS `cc_cdrs`;
CREATE TABLE `cc_cdrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caller` char(64) NOT NULL,
  `received_timestamp` datetime NOT NULL,
  `wait_time` int(11) unsigned NOT NULL DEFAULT '0',
  `pickup_time` int(11) unsigned NOT NULL DEFAULT '0',
  `talk_time` int(11) unsigned NOT NULL DEFAULT '0',
  `flow_id` char(128) NOT NULL,
  `agent_id` char(128) DEFAULT NULL,
  `call_type` int(11) NOT NULL DEFAULT '-1',
  `rejected` int(11) unsigned NOT NULL DEFAULT '0',
  `fstats` int(11) unsigned NOT NULL DEFAULT '0',
  `cid` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cc_cdrs`
--

/*!40000 ALTER TABLE `cc_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_cdrs` ENABLE KEYS */;


--
-- Definition of table `cc_flows`
--

DROP TABLE IF EXISTS `cc_flows`;
CREATE TABLE `cc_flows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flowid` char(64) NOT NULL,
  `priority` int(11) unsigned NOT NULL DEFAULT '256',
  `skill` char(64) NOT NULL,
  `prependcid` char(32) NOT NULL,
  `message_welcome` char(128) DEFAULT NULL,
  `message_queue` char(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_flowid` (`flowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cc_flows`
--

/*!40000 ALTER TABLE `cc_flows` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_flows` ENABLE KEYS */;


--
-- Definition of table `clusterer`
--

DROP TABLE IF EXISTS `clusterer`;
CREATE TABLE `clusterer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cluster_id` int(10) NOT NULL,
  `machine_id` int(10) NOT NULL,
  `url` char(64) NOT NULL,
  `state` int(1) NOT NULL DEFAULT '1',
  `last_attempt` bigint(64) unsigned NOT NULL DEFAULT '0',
  `failed_attempts` int(10) NOT NULL DEFAULT '3',
  `no_tries` int(10) NOT NULL DEFAULT '0',
  `duration` int(10) NOT NULL DEFAULT '30',
  `description` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clusterer_idx` (`cluster_id`,`machine_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clusterer`
--

/*!40000 ALTER TABLE `clusterer` DISABLE KEYS */;
/*!40000 ALTER TABLE `clusterer` ENABLE KEYS */;


--
-- Definition of table `cpl`
--

DROP TABLE IF EXISTS `cpl`;
CREATE TABLE `cpl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL,
  `domain` char(64) NOT NULL DEFAULT '',
  `cpl_xml` text,
  `cpl_bin` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cpl`
--

/*!40000 ALTER TABLE `cpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpl` ENABLE KEYS */;


--
-- Definition of table `dbaliases`
--

DROP TABLE IF EXISTS `dbaliases`;
CREATE TABLE `dbaliases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias_username` char(64) NOT NULL DEFAULT '',
  `alias_domain` char(64) NOT NULL DEFAULT '',
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias_idx` (`alias_username`,`alias_domain`),
  KEY `target_idx` (`username`,`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbaliases`
--

/*!40000 ALTER TABLE `dbaliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbaliases` ENABLE KEYS */;


--
-- Definition of table `dialog`
--

DROP TABLE IF EXISTS `dialog`;
CREATE TABLE `dialog` (
  `dlg_id` bigint(10) unsigned NOT NULL,
  `callid` char(255) NOT NULL,
  `from_uri` char(128) NOT NULL,
  `from_tag` char(64) NOT NULL,
  `to_uri` char(128) NOT NULL,
  `to_tag` char(64) NOT NULL,
  `mangled_from_uri` char(64) DEFAULT NULL,
  `mangled_to_uri` char(64) DEFAULT NULL,
  `caller_cseq` char(11) NOT NULL,
  `callee_cseq` char(11) NOT NULL,
  `caller_ping_cseq` int(11) unsigned NOT NULL,
  `callee_ping_cseq` int(11) unsigned NOT NULL,
  `caller_route_set` text,
  `callee_route_set` text,
  `caller_contact` char(128) DEFAULT NULL,
  `callee_contact` char(128) DEFAULT NULL,
  `caller_sock` char(64) NOT NULL,
  `callee_sock` char(64) NOT NULL,
  `state` int(10) unsigned NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `timeout` int(10) unsigned NOT NULL,
  `vars` blob,
  `profiles` text,
  `script_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `module_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dlg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dialog`
--

/*!40000 ALTER TABLE `dialog` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialog` ENABLE KEYS */;


--
-- Definition of table `dialplan`
--

DROP TABLE IF EXISTS `dialplan`;
CREATE TABLE `dialplan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dpid` int(11) NOT NULL,
  `pr` int(11) NOT NULL,
  `match_op` int(11) NOT NULL,
  `match_exp` char(64) NOT NULL,
  `match_flags` int(11) NOT NULL,
  `subst_exp` char(64) DEFAULT NULL,
  `repl_exp` char(32) DEFAULT NULL,
  `timerec` char(255) DEFAULT NULL,
  `disabled` int(11) NOT NULL DEFAULT '0',
  `attrs` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dialplan`
--

/*!40000 ALTER TABLE `dialplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialplan` ENABLE KEYS */;


--
-- Definition of table `dispatcher`
--

DROP TABLE IF EXISTS `dispatcher`;
CREATE TABLE `dispatcher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setid` int(11) NOT NULL DEFAULT '0',
  `destination` char(192) NOT NULL DEFAULT '',
  `socket` char(128) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '0',
  `attrs` char(128) NOT NULL DEFAULT '',
  `description` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispatcher`
--

/*!40000 ALTER TABLE `dispatcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispatcher` ENABLE KEYS */;


--
-- Definition of table `domain`
--

DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` char(64) NOT NULL DEFAULT '',
  `attrs` char(255) DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_idx` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domain`
--

/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` (`id`,`domain`,`attrs`,`last_modified`) VALUES 
 (3,'192.168.1.6',NULL,'2017-06-21 18:07:03');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;


--
-- Definition of table `domainpolicy`
--

DROP TABLE IF EXISTS `domainpolicy`;
CREATE TABLE `domainpolicy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule` char(255) NOT NULL,
  `type` char(255) NOT NULL,
  `att` char(255) DEFAULT NULL,
  `val` char(128) DEFAULT NULL,
  `description` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rav_idx` (`rule`,`att`,`val`),
  KEY `rule_idx` (`rule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domainpolicy`
--

/*!40000 ALTER TABLE `domainpolicy` DISABLE KEYS */;
/*!40000 ALTER TABLE `domainpolicy` ENABLE KEYS */;


--
-- Definition of table `dr_carriers`
--

DROP TABLE IF EXISTS `dr_carriers`;
CREATE TABLE `dr_carriers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrierid` char(64) NOT NULL,
  `gwlist` char(255) NOT NULL,
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `state` int(11) unsigned NOT NULL DEFAULT '0',
  `attrs` char(255) DEFAULT '',
  `description` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dr_carrier_idx` (`carrierid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dr_carriers`
--

/*!40000 ALTER TABLE `dr_carriers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_carriers` ENABLE KEYS */;


--
-- Definition of table `dr_gateways`
--

DROP TABLE IF EXISTS `dr_gateways`;
CREATE TABLE `dr_gateways` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gwid` char(64) NOT NULL,
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `address` char(128) NOT NULL,
  `strip` int(11) unsigned NOT NULL DEFAULT '0',
  `pri_prefix` char(16) DEFAULT NULL,
  `attrs` char(255) DEFAULT NULL,
  `probe_mode` int(11) unsigned NOT NULL DEFAULT '0',
  `state` int(11) unsigned NOT NULL DEFAULT '0',
  `socket` char(128) DEFAULT NULL,
  `description` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dr_gw_idx` (`gwid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dr_gateways`
--

/*!40000 ALTER TABLE `dr_gateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_gateways` ENABLE KEYS */;


--
-- Definition of table `dr_groups`
--

DROP TABLE IF EXISTS `dr_groups`;
CREATE TABLE `dr_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL,
  `domain` char(128) NOT NULL DEFAULT '',
  `groupid` int(11) unsigned NOT NULL DEFAULT '0',
  `description` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dr_groups`
--

/*!40000 ALTER TABLE `dr_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_groups` ENABLE KEYS */;


--
-- Definition of table `dr_partitions`
--

DROP TABLE IF EXISTS `dr_partitions`;
CREATE TABLE `dr_partitions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `partition_name` char(255) NOT NULL,
  `db_url` char(255) NOT NULL,
  `drd_table` char(255) DEFAULT NULL,
  `drr_table` char(255) DEFAULT NULL,
  `drg_table` char(255) DEFAULT NULL,
  `drc_table` char(255) DEFAULT NULL,
  `ruri_avp` char(255) DEFAULT NULL,
  `gw_id_avp` char(255) DEFAULT NULL,
  `gw_priprefix_avp` char(255) DEFAULT NULL,
  `gw_sock_avp` char(255) DEFAULT NULL,
  `rule_id_avp` char(255) DEFAULT NULL,
  `rule_prefix_avp` char(255) DEFAULT NULL,
  `carrier_id_avp` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dr_partitions`
--

/*!40000 ALTER TABLE `dr_partitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_partitions` ENABLE KEYS */;


--
-- Definition of table `dr_rules`
--

DROP TABLE IF EXISTS `dr_rules`;
CREATE TABLE `dr_rules` (
  `ruleid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` char(255) NOT NULL,
  `prefix` char(64) NOT NULL,
  `timerec` char(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `routeid` char(255) DEFAULT NULL,
  `gwlist` char(255) NOT NULL,
  `attrs` char(255) DEFAULT NULL,
  `description` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`ruleid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dr_rules`
--

/*!40000 ALTER TABLE `dr_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_rules` ENABLE KEYS */;


--
-- Definition of table `emergency_report`
--

DROP TABLE IF EXISTS `emergency_report`;
CREATE TABLE `emergency_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `callid` char(25) NOT NULL,
  `selectiveRoutingID` char(11) NOT NULL,
  `routingESN` int(5) unsigned NOT NULL DEFAULT '0',
  `npa` int(3) unsigned NOT NULL DEFAULT '0',
  `esgwri` char(50) NOT NULL,
  `lro` char(20) NOT NULL,
  `VPC_organizationName` char(50) NOT NULL,
  `VPC_hostname` char(50) NOT NULL,
  `VPC_timestamp` char(30) NOT NULL,
  `result` char(4) NOT NULL,
  `disposition` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergency_report`
--

/*!40000 ALTER TABLE `emergency_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_report` ENABLE KEYS */;


--
-- Definition of table `emergency_routing`
--

DROP TABLE IF EXISTS `emergency_routing`;
CREATE TABLE `emergency_routing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `selectiveRoutingID` char(11) NOT NULL,
  `routingESN` int(5) unsigned NOT NULL DEFAULT '0',
  `npa` int(3) unsigned NOT NULL DEFAULT '0',
  `esgwri` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergency_routing`
--

/*!40000 ALTER TABLE `emergency_routing` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_routing` ENABLE KEYS */;


--
-- Definition of table `emergency_service_provider`
--

DROP TABLE IF EXISTS `emergency_service_provider`;
CREATE TABLE `emergency_service_provider` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `organizationName` char(50) NOT NULL,
  `hostId` char(30) NOT NULL,
  `nenaId` char(50) NOT NULL,
  `contact` char(20) NOT NULL,
  `certUri` char(50) NOT NULL,
  `nodeIP` char(20) NOT NULL,
  `attribution` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergency_service_provider`
--

/*!40000 ALTER TABLE `emergency_service_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_service_provider` ENABLE KEYS */;


--
-- Definition of table `fraud_detection`
--

DROP TABLE IF EXISTS `fraud_detection`;
CREATE TABLE `fraud_detection` (
  `ruleid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profileid` int(10) unsigned NOT NULL,
  `prefix` char(64) NOT NULL,
  `start_hour` char(5) NOT NULL,
  `end_hour` char(5) NOT NULL,
  `daysoftheweek` char(64) NOT NULL,
  `cpm_warning` int(5) unsigned NOT NULL,
  `cpm_critical` int(5) unsigned NOT NULL,
  `call_duration_warning` int(5) unsigned NOT NULL,
  `call_duration_critical` int(5) unsigned NOT NULL,
  `total_calls_warning` int(5) unsigned NOT NULL,
  `total_calls_critical` int(5) unsigned NOT NULL,
  `concurrent_calls_warning` int(5) unsigned NOT NULL,
  `concurrent_calls_critical` int(5) unsigned NOT NULL,
  `sequential_calls_warning` int(5) unsigned NOT NULL,
  `sequential_calls_critical` int(5) unsigned NOT NULL,
  PRIMARY KEY (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fraud_detection`
--

/*!40000 ALTER TABLE `fraud_detection` DISABLE KEYS */;
/*!40000 ALTER TABLE `fraud_detection` ENABLE KEYS */;


--
-- Definition of table `globalblacklist`
--

DROP TABLE IF EXISTS `globalblacklist`;
CREATE TABLE `globalblacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` char(64) NOT NULL DEFAULT '',
  `whitelist` tinyint(1) NOT NULL DEFAULT '0',
  `description` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `globalblacklist_idx` (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `globalblacklist`
--

/*!40000 ALTER TABLE `globalblacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalblacklist` ENABLE KEYS */;


--
-- Definition of table `grp`
--

DROP TABLE IF EXISTS `grp`;
CREATE TABLE `grp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `grp` char(64) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_group_idx` (`username`,`domain`,`grp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grp`
--

/*!40000 ALTER TABLE `grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp` ENABLE KEYS */;


--
-- Definition of table `imc_members`
--

DROP TABLE IF EXISTS `imc_members`;
CREATE TABLE `imc_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL,
  `domain` char(64) NOT NULL,
  `room` char(64) NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_room_idx` (`username`,`domain`,`room`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imc_members`
--

/*!40000 ALTER TABLE `imc_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `imc_members` ENABLE KEYS */;


--
-- Definition of table `imc_rooms`
--

DROP TABLE IF EXISTS `imc_rooms`;
CREATE TABLE `imc_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(64) NOT NULL,
  `domain` char(64) NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_domain_idx` (`name`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imc_rooms`
--

/*!40000 ALTER TABLE `imc_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imc_rooms` ENABLE KEYS */;


--
-- Definition of table `load_balancer`
--

DROP TABLE IF EXISTS `load_balancer`;
CREATE TABLE `load_balancer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `dst_uri` char(128) NOT NULL,
  `resources` char(255) NOT NULL,
  `probe_mode` int(11) unsigned NOT NULL DEFAULT '0',
  `description` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `dsturi_idx` (`dst_uri`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `load_balancer`
--

/*!40000 ALTER TABLE `load_balancer` DISABLE KEYS */;
/*!40000 ALTER TABLE `load_balancer` ENABLE KEYS */;


--
-- Definition of table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `contact_id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) DEFAULT NULL,
  `contact` char(255) NOT NULL DEFAULT '',
  `received` char(128) DEFAULT NULL,
  `path` char(255) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2020-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT '1.00',
  `callid` char(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT '13',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cflags` char(255) DEFAULT NULL,
  `user_agent` char(255) NOT NULL DEFAULT '',
  `socket` char(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `sip_instance` char(255) DEFAULT NULL,
  `attr` char(255) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=MyISAM AUTO_INCREMENT=364721201072871103 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;


--
-- Definition of table `missed_calls`
--

DROP TABLE IF EXISTS `missed_calls`;
CREATE TABLE `missed_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` char(16) NOT NULL DEFAULT '',
  `from_tag` char(64) NOT NULL DEFAULT '',
  `to_tag` char(64) NOT NULL DEFAULT '',
  `callid` char(64) NOT NULL DEFAULT '',
  `sip_code` char(3) NOT NULL DEFAULT '',
  `sip_reason` char(32) NOT NULL DEFAULT '',
  `time` datetime NOT NULL,
  `setuptime` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `callid_idx` (`callid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `missed_calls`
--

/*!40000 ALTER TABLE `missed_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `missed_calls` ENABLE KEYS */;


--
-- Definition of table `presentity`
--

DROP TABLE IF EXISTS `presentity`;
CREATE TABLE `presentity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL,
  `domain` char(64) NOT NULL,
  `event` char(64) NOT NULL,
  `etag` char(64) NOT NULL,
  `expires` int(11) NOT NULL,
  `received_time` int(11) NOT NULL,
  `body` blob,
  `extra_hdrs` blob,
  `sender` char(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `presentity_idx` (`username`,`domain`,`event`,`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presentity`
--

/*!40000 ALTER TABLE `presentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `presentity` ENABLE KEYS */;


--
-- Definition of table `pua`
--

DROP TABLE IF EXISTS `pua`;
CREATE TABLE `pua` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pres_uri` char(128) NOT NULL,
  `pres_id` char(255) NOT NULL,
  `event` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `desired_expires` int(11) NOT NULL,
  `flag` int(11) NOT NULL,
  `etag` char(64) DEFAULT NULL,
  `tuple_id` char(64) DEFAULT NULL,
  `watcher_uri` char(128) DEFAULT NULL,
  `to_uri` char(128) DEFAULT NULL,
  `call_id` char(64) DEFAULT NULL,
  `to_tag` char(64) DEFAULT NULL,
  `from_tag` char(64) DEFAULT NULL,
  `cseq` int(11) DEFAULT NULL,
  `record_route` text,
  `contact` char(128) DEFAULT NULL,
  `remote_contact` char(128) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `extra_headers` text,
  PRIMARY KEY (`id`),
  KEY `del1_idx` (`pres_uri`,`event`),
  KEY `del2_idx` (`expires`),
  KEY `update_idx` (`pres_uri`,`pres_id`,`flag`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pua`
--

/*!40000 ALTER TABLE `pua` DISABLE KEYS */;
/*!40000 ALTER TABLE `pua` ENABLE KEYS */;


--
-- Definition of table `re_grp`
--

DROP TABLE IF EXISTS `re_grp`;
CREATE TABLE `re_grp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reg_exp` char(128) NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_idx` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `re_grp`
--

/*!40000 ALTER TABLE `re_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_grp` ENABLE KEYS */;


--
-- Definition of table `registrant`
--

DROP TABLE IF EXISTS `registrant`;
CREATE TABLE `registrant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `registrar` char(128) NOT NULL DEFAULT '',
  `proxy` char(128) DEFAULT NULL,
  `aor` char(128) NOT NULL DEFAULT '',
  `third_party_registrant` char(128) DEFAULT NULL,
  `username` char(64) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `binding_URI` char(128) NOT NULL DEFAULT '',
  `binding_params` char(64) DEFAULT NULL,
  `expiry` int(1) unsigned DEFAULT NULL,
  `forced_socket` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aor_idx` (`aor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registrant`
--

/*!40000 ALTER TABLE `registrant` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrant` ENABLE KEYS */;


--
-- Definition of table `rls_presentity`
--

DROP TABLE IF EXISTS `rls_presentity`;
CREATE TABLE `rls_presentity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rlsubs_did` char(255) NOT NULL,
  `resource_uri` char(128) NOT NULL,
  `content_type` char(255) NOT NULL,
  `presence_state` blob NOT NULL,
  `expires` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `auth_state` int(11) NOT NULL,
  `reason` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rls_presentity_idx` (`rlsubs_did`,`resource_uri`),
  KEY `updated_idx` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rls_presentity`
--

/*!40000 ALTER TABLE `rls_presentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `rls_presentity` ENABLE KEYS */;


--
-- Definition of table `rls_watchers`
--

DROP TABLE IF EXISTS `rls_watchers`;
CREATE TABLE `rls_watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` char(128) NOT NULL,
  `to_user` char(64) NOT NULL,
  `to_domain` char(64) NOT NULL,
  `watcher_username` char(64) NOT NULL,
  `watcher_domain` char(64) NOT NULL,
  `event` char(64) NOT NULL DEFAULT 'presence',
  `event_id` char(64) DEFAULT NULL,
  `to_tag` char(64) NOT NULL,
  `from_tag` char(64) NOT NULL,
  `callid` char(64) NOT NULL,
  `local_cseq` int(11) NOT NULL,
  `remote_cseq` int(11) NOT NULL,
  `contact` char(64) NOT NULL,
  `record_route` text,
  `expires` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `reason` char(64) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `socket_info` char(64) NOT NULL,
  `local_contact` char(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rls_watcher_idx` (`presentity_uri`,`callid`,`to_tag`,`from_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rls_watchers`
--

/*!40000 ALTER TABLE `rls_watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `rls_watchers` ENABLE KEYS */;


--
-- Definition of table `route_tree`
--

DROP TABLE IF EXISTS `route_tree`;
CREATE TABLE `route_tree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route_tree`
--

/*!40000 ALTER TABLE `route_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_tree` ENABLE KEYS */;


--
-- Definition of table `rtpproxy_sockets`
--

DROP TABLE IF EXISTS `rtpproxy_sockets`;
CREATE TABLE `rtpproxy_sockets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rtpproxy_sock` text NOT NULL,
  `set_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtpproxy_sockets`
--

/*!40000 ALTER TABLE `rtpproxy_sockets` DISABLE KEYS */;
/*!40000 ALTER TABLE `rtpproxy_sockets` ENABLE KEYS */;


--
-- Definition of table `silo`
--

DROP TABLE IF EXISTS `silo`;
CREATE TABLE `silo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src_addr` char(128) NOT NULL DEFAULT '',
  `dst_addr` char(128) NOT NULL DEFAULT '',
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `inc_time` int(11) NOT NULL DEFAULT '0',
  `exp_time` int(11) NOT NULL DEFAULT '0',
  `snd_time` int(11) NOT NULL DEFAULT '0',
  `ctype` char(255) DEFAULT NULL,
  `body` blob,
  PRIMARY KEY (`id`),
  KEY `account_idx` (`username`,`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `silo`
--

/*!40000 ALTER TABLE `silo` DISABLE KEYS */;
/*!40000 ALTER TABLE `silo` ENABLE KEYS */;


--
-- Definition of table `sip_trace`
--

DROP TABLE IF EXISTS `sip_trace`;
CREATE TABLE `sip_trace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `callid` char(255) NOT NULL DEFAULT '',
  `trace_attrs` char(128) DEFAULT NULL,
  `msg` text NOT NULL,
  `method` char(32) NOT NULL DEFAULT '',
  `status` char(128) DEFAULT NULL,
  `from_proto` char(5) NOT NULL,
  `from_ip` char(50) NOT NULL DEFAULT '',
  `from_port` int(5) unsigned NOT NULL,
  `to_proto` char(5) NOT NULL,
  `to_ip` char(50) NOT NULL DEFAULT '',
  `to_port` int(5) unsigned NOT NULL,
  `fromtag` char(64) NOT NULL DEFAULT '',
  `direction` char(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `trace_attrs_idx` (`trace_attrs`),
  KEY `date_idx` (`time_stamp`),
  KEY `fromip_idx` (`from_ip`),
  KEY `callid_idx` (`callid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sip_trace`
--

/*!40000 ALTER TABLE `sip_trace` DISABLE KEYS */;
/*!40000 ALTER TABLE `sip_trace` ENABLE KEYS */;


--
-- Definition of table `speed_dial`
--

DROP TABLE IF EXISTS `speed_dial`;
CREATE TABLE `speed_dial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `sd_username` char(64) NOT NULL DEFAULT '',
  `sd_domain` char(64) NOT NULL DEFAULT '',
  `new_uri` char(128) NOT NULL DEFAULT '',
  `fname` char(64) NOT NULL DEFAULT '',
  `lname` char(64) NOT NULL DEFAULT '',
  `description` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `speed_dial_idx` (`username`,`domain`,`sd_domain`,`sd_username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `speed_dial`
--

/*!40000 ALTER TABLE `speed_dial` DISABLE KEYS */;
/*!40000 ALTER TABLE `speed_dial` ENABLE KEYS */;


--
-- Definition of table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `password` char(25) NOT NULL DEFAULT '',
  `email_address` char(64) NOT NULL DEFAULT '',
  `ha1` char(64) NOT NULL DEFAULT '',
  `ha1b` char(64) NOT NULL DEFAULT '',
  `rpid` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`),
  KEY `username_idx` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriber`
--

/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
INSERT INTO `subscriber` (`id`,`username`,`domain`,`password`,`email_address`,`ha1`,`ha1b`,`rpid`) VALUES 
 (1,'1001','192.168.1.6','1001','','164323bd1aeda7c1afd4efec0ff0b4a5','1b3054e5baeca48b0e7e44d58db0f6f8',NULL),
 (2,'1002','192.168.1.6','1002','','1001285cd3fd2b21577917c8022fa652','8b82df266c25209039025528629e2e2a',NULL);
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;


--
-- Definition of table `tls_mgm`
--

DROP TABLE IF EXISTS `tls_mgm`;
CREATE TABLE `tls_mgm` (
  `id` char(64) NOT NULL,
  `address` char(64) NOT NULL,
  `type` int(1) NOT NULL,
  `method` char(16) DEFAULT NULL,
  `verify_cert` int(1) DEFAULT NULL,
  `require_cert` int(1) DEFAULT NULL,
  `certificate` char(255) DEFAULT NULL,
  `private_key` char(255) DEFAULT NULL,
  `crl_check_all` int(1) DEFAULT NULL,
  `crl_dir` char(255) DEFAULT NULL,
  `ca_list` char(255) DEFAULT NULL,
  `ca_dir` char(255) DEFAULT NULL,
  `cipher_list` char(255) DEFAULT NULL,
  `dh_params` char(255) DEFAULT NULL,
  `ec_curve` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tls_mgm`
--

/*!40000 ALTER TABLE `tls_mgm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tls_mgm` ENABLE KEYS */;


--
-- Definition of table `uri`
--

DROP TABLE IF EXISTS `uri`;
CREATE TABLE `uri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `uri_user` char(64) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`,`uri_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uri`
--

/*!40000 ALTER TABLE `uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `uri` ENABLE KEYS */;


--
-- Definition of table `userblacklist`
--

DROP TABLE IF EXISTS `userblacklist`;
CREATE TABLE `userblacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `prefix` char(64) NOT NULL DEFAULT '',
  `whitelist` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userblacklist_idx` (`username`,`domain`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userblacklist`
--

/*!40000 ALTER TABLE `userblacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `userblacklist` ENABLE KEYS */;


--
-- Definition of table `usr_preferences`
--

DROP TABLE IF EXISTS `usr_preferences`;
CREATE TABLE `usr_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(64) NOT NULL DEFAULT '',
  `username` char(128) NOT NULL DEFAULT '0',
  `domain` char(64) NOT NULL DEFAULT '',
  `attribute` char(32) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `value` char(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `ua_idx` (`uuid`,`attribute`),
  KEY `uda_idx` (`username`,`domain`,`attribute`),
  KEY `value_idx` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usr_preferences`
--

/*!40000 ALTER TABLE `usr_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `usr_preferences` ENABLE KEYS */;


--
-- Definition of table `version`
--

DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `table_name` char(32) NOT NULL,
  `table_version` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `t_name_idx` (`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `version`
--

/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` (`table_name`,`table_version`) VALUES 
 ('acc',7),
 ('missed_calls',5),
 ('domain',3),
 ('grp',3),
 ('re_grp',2),
 ('address',5),
 ('aliases',1009),
 ('location',1011),
 ('silo',6),
 ('dbaliases',2),
 ('uri',2),
 ('rtpproxy_sockets',0),
 ('speed_dial',3),
 ('usr_preferences',3),
 ('subscriber',7),
 ('dialog',10),
 ('dispatcher',7),
 ('dialplan',5),
 ('dr_gateways',6),
 ('dr_rules',3),
 ('dr_carriers',2),
 ('dr_groups',2),
 ('dr_partitions',1),
 ('load_balancer',2),
 ('clusterer',1),
 ('tls_mgm',1),
 ('presentity',5),
 ('active_watchers',11),
 ('watchers',4),
 ('xcap',4),
 ('pua',8),
 ('rls_presentity',1),
 ('rls_watchers',2),
 ('imc_rooms',2),
 ('imc_members',2),
 ('cpl',2),
 ('sip_trace',5),
 ('domainpolicy',3),
 ('carrierroute',3),
 ('carrierfailureroute',2),
 ('route_tree',2),
 ('userblacklist',2),
 ('globalblacklist',2),
 ('b2b_entities',1),
 ('b2b_logic',3),
 ('cachedb',2),
 ('registrant',1),
 ('cc_flows',1),
 ('cc_agents',1),
 ('cc_cdrs',1),
 ('fraud_detection',1),
 ('emergency_routing',1),
 ('emergency_report',1),
 ('emergency_service_provider',1);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;


--
-- Definition of table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
CREATE TABLE `watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` char(128) NOT NULL,
  `watcher_username` char(64) NOT NULL,
  `watcher_domain` char(64) NOT NULL,
  `event` char(64) NOT NULL DEFAULT 'presence',
  `status` int(11) NOT NULL,
  `reason` char(64) DEFAULT NULL,
  `inserted_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `watcher_idx` (`presentity_uri`,`watcher_username`,`watcher_domain`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `watchers`
--

/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;


--
-- Definition of table `xcap`
--

DROP TABLE IF EXISTS `xcap`;
CREATE TABLE `xcap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL,
  `domain` char(64) NOT NULL,
  `doc` longblob NOT NULL,
  `doc_type` int(11) NOT NULL,
  `etag` char(64) NOT NULL,
  `source` int(11) NOT NULL,
  `doc_uri` char(128) NOT NULL,
  `port` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_doc_type_idx` (`username`,`domain`,`doc_type`,`doc_uri`),
  KEY `source_idx` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xcap`
--

/*!40000 ALTER TABLE `xcap` DISABLE KEYS */;
/*!40000 ALTER TABLE `xcap` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

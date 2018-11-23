/*
Navicat MySQL Data Transfer

Source Server         : benji00
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : geek

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2018-11-23 17:07:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `salt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `unique_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('0e94fad1ca244890a56f0899f9e3c887', '444', 'adacd9a190ac1a6a7afb886c27ba088a', '1', '49677e7f016ad846f6f83ae5cdde9fc8', '0', '2018-10-04 18:29:37', '2018-10-04 18:29:37');
INSERT INTO `admin` VALUES ('1e67f167d99c43f897ec6566043ad6ec', 'flyshy', '932f8031fdcb42972f9d122e3a8bdf71', '1', '5016b9942433201bf3fe61992eacba71', '0', '2016-12-07 13:24:17', '2018-10-11 10:39:15');
INSERT INTO `admin` VALUES ('2e58261382284164a57b1a138dacbbae', 'aaa', 'ab67feec31123efed5231639e5e44ec4', '1', '725ea9e0d4267019e1c44db094a02153', '0', '2018-10-04 21:03:28', '2018-10-04 21:03:28');
INSERT INTO `admin` VALUES ('4080bc528e3b4c98835a08b7677afd13', 'qq', '1287b7f7ea9b82a983ddbaaae8308808', '1', 'e581bd4be512f7bbdef8848fc06374cf', '0', '2018-10-09 09:22:45', '2018-10-09 09:23:13');
INSERT INTO `admin` VALUES ('48a3a61616f34d51bc7c7b2e7c2d74c7', '6666', '79b9d38d507f7ed5c9e2f37adc3ac307', '1', '98f92a8191f07bc8127b8ab342140dc0', '0', '2018-10-04 18:19:11', '2018-10-04 18:19:11');
INSERT INTO `admin` VALUES ('675cb875fa3c41b39bebe49dbb92a0a3', '888', '763fb6006baa79f00b1237f764b53ad5', '1', '07335acf856ca3e9ae2849edd1b66a41', '0', '2018-10-04 18:27:46', '2018-10-04 18:27:46');
INSERT INTO `admin` VALUES ('6c897f023fe842ff930a862eeb47ea4f', 'dd', '76c50b37ac12afe03281a15cf355f8e9', '1', '10440f353f47c0bf8d9ddc9b9dba667c', '0', '2018-10-18 11:22:34', '2018-10-18 11:22:34');
INSERT INTO `admin` VALUES ('6e8fa3615263410abca5fd680f5fc2dc', '222', '0e89a9330f039b2b9d0c053f489a2fca', '1', 'ad81df9c9e038e84b494f405cf11c337', '0', '2018-10-04 18:14:30', '2018-10-04 18:14:30');
INSERT INTO `admin` VALUES ('722af7a123964474bd10c250cc9ded30', '999', '98244650c8e03a5349ea4cbb77062309', '1', 'fdabc81e871804bffd9309907367bbfe', '0', '2018-10-04 18:30:03', '2018-10-04 18:30:03');
INSERT INTO `admin` VALUES ('7f3ab0721668407284820b2a414eed44', 'wph', '091debb2006cf9939bbe86d35ae4f52d', '0', '2a30f18ae1288923cb1a3c12f9d5d651', '0', '2018-09-13 14:57:18', '2018-10-04 18:03:55');
INSERT INTO `admin` VALUES ('99a266c88e6245678297ed24f32b07fe', '123', '7868d69bb1db33789e3a0bf0a5fc15e6', '1', '3f95018ef661ba10e49b40694ebb580f', '0', '2018-10-03 16:56:36', '2018-10-11 10:41:15');
INSERT INTO `admin` VALUES ('a9080bb17b274192891ff261d620d158', 'bbb', '319d68fecb9596938119dda1c47f8a41', '1', '76bed40770231a35f490ca020f08b0b0', '0', '2018-10-04 21:04:45', '2018-10-04 21:04:45');
INSERT INTO `admin` VALUES ('ad313d38fe9447ce863fe8584743a010', 'admin', '05af2be88235d3c2df60de844fd0520c', '1', '1ab6d62faa91ae7deec76d6f13ef1600', '1', '2016-12-06 11:16:51', '2017-05-11 13:59:25');
INSERT INTO `admin` VALUES ('fc5d34f413cc4d7181ccdddc6dcedd5f', 'ceshi', '588af8e5a825f26568fd6345c72053a2', '1', '75eec99f3964496636ac09f9f96c50bc', '0', '2018-09-13 17:20:38', '2018-10-21 17:19:39');
INSERT INTO `admin` VALUES ('fdeb3a783af9423eae4bce22095e3ad9', 'jkl', '2f586b7a2fe05fdad1dba43e70700a04', '1', 'a4a3b6e97dd9cf5cd55f6e72d11e63d9', '0', '2018-10-12 17:38:41', '2018-10-12 17:38:41');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `admin_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`admin_id`,`role_id`),
  KEY `admin_role_foreign` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('a9080bb17b274192891ff261d620d158', '36f1dd1296674fc08484c5abf6a5806b');
INSERT INTO `admin_role` VALUES ('0e94fad1ca244890a56f0899f9e3c887', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('2e58261382284164a57b1a138dacbbae', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('4080bc528e3b4c98835a08b7677afd13', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('48a3a61616f34d51bc7c7b2e7c2d74c7', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('675cb875fa3c41b39bebe49dbb92a0a3', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('6c897f023fe842ff930a862eeb47ea4f', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('6e8fa3615263410abca5fd680f5fc2dc', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('722af7a123964474bd10c250cc9ded30', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('7f3ab0721668407284820b2a414eed44', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('99a266c88e6245678297ed24f32b07fe', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('a9080bb17b274192891ff261d620d158', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('fdeb3a783af9423eae4bce22095e3ad9', '8ff15972a3f44edf939270c4ec76c528');
INSERT INTO `admin_role` VALUES ('0e94fad1ca244890a56f0899f9e3c887', 'cbe8356d64a8433cb5dad5c7fccf8dce');
INSERT INTO `admin_role` VALUES ('1e67f167d99c43f897ec6566043ad6ec', 'cbe8356d64a8433cb5dad5c7fccf8dce');
INSERT INTO `admin_role` VALUES ('4080bc528e3b4c98835a08b7677afd13', 'cbe8356d64a8433cb5dad5c7fccf8dce');
INSERT INTO `admin_role` VALUES ('48a3a61616f34d51bc7c7b2e7c2d74c7', 'cbe8356d64a8433cb5dad5c7fccf8dce');
INSERT INTO `admin_role` VALUES ('675cb875fa3c41b39bebe49dbb92a0a3', 'cbe8356d64a8433cb5dad5c7fccf8dce');
INSERT INTO `admin_role` VALUES ('6e8fa3615263410abca5fd680f5fc2dc', 'cbe8356d64a8433cb5dad5c7fccf8dce');
INSERT INTO `admin_role` VALUES ('722af7a123964474bd10c250cc9ded30', 'cbe8356d64a8433cb5dad5c7fccf8dce');
INSERT INTO `admin_role` VALUES ('7f3ab0721668407284820b2a414eed44', 'cbe8356d64a8433cb5dad5c7fccf8dce');
INSERT INTO `admin_role` VALUES ('99a266c88e6245678297ed24f32b07fe', 'cbe8356d64a8433cb5dad5c7fccf8dce');
INSERT INTO `admin_role` VALUES ('fc5d34f413cc4d7181ccdddc6dcedd5f', 'cbe8356d64a8433cb5dad5c7fccf8dce');
INSERT INTO `admin_role` VALUES ('fdeb3a783af9423eae4bce22095e3ad9', 'cbe8356d64a8433cb5dad5c7fccf8dce');

-- ----------------------------
-- Table structure for binding
-- ----------------------------
DROP TABLE IF EXISTS `binding`;
CREATE TABLE `binding` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `node` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subnet` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of binding
-- ----------------------------
INSERT INTO `binding` VALUES ('08d8f299a0ef492e817e9a91565d82ee', 'openflow:2037944993637447489', 'df74951330bd45c5acac824fa12e373b', '2018-10-29 15:25:28');
INSERT INTO `binding` VALUES ('57304b2a1be041ed8d688d858f76fe15', 'openflow:7', 'network', '2018-10-10 14:17:27');
INSERT INTO `binding` VALUES ('6f8f8a95968945c8b7c5c60073001b89', 'openflow:2038063737063325569', 'df74951330bd45c5acac824fa12e373b', '2018-10-29 15:25:28');
INSERT INTO `binding` VALUES ('870e51eb9054499cac117d084821fc7a', 'openflow:5', 'test1', '2018-10-16 15:02:41');
INSERT INTO `binding` VALUES ('be7432ea668c458f81194e955b3fb065', 'openflow:11', 'a123', '2018-10-10 17:12:16');
INSERT INTO `binding` VALUES ('c9b0d3a6c1da43678fb7d7c5ab4e57ed', 'openflow:1', 'wph123', '2018-09-28 15:14:31');
INSERT INTO `binding` VALUES ('e5e0a12d678e47269c2bfbb2b2e5e3d6', 'openflow:6', 'wph123', '2018-10-10 14:18:56');
INSERT INTO `binding` VALUES ('e6f64ac8559d4736b39edd468001073d', 'openflow:12', 'network', '2018-09-28 11:11:11');
INSERT INTO `binding` VALUES ('ea2932d6a71f42ab91664e1de390a191', 'openflow:2038063737063325569', 'a65c81bc3d594429a49da0a9296de249', '2018-10-27 15:39:07');
INSERT INTO `binding` VALUES ('fb98a48dc86f4f24bd592d163b2f6969', 'openflow:2038063737066023809', 'df74951330bd45c5acac824fa12e373b', '2018-10-29 15:25:28');

-- ----------------------------
-- Table structure for black_list
-- ----------------------------
DROP TABLE IF EXISTS `black_list`;
CREATE TABLE `black_list` (
  `black_list_id` varchar(32) NOT NULL,
  `is_use_black_list` int(1) DEFAULT '1' COMMENT '是否开启黑名单，1-开启，0-关闭',
  `black_list_ip` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`black_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of black_list
-- ----------------------------
INSERT INTO `black_list` VALUES ('1a07bd4ac1e4446283741be50f89ee92', null, '192.168.8.9', '2018-10-30 15:56:00');
INSERT INTO `black_list` VALUES ('2841ffd9f97347a79a22916a3e4fc56a', null, '192.168.1.3', '2018-10-30 15:57:26');
INSERT INTO `black_list` VALUES ('2c0680a60390497092195ceb75c61bcd', null, '192.168.1.1', '2018-10-30 16:13:50');
INSERT INTO `black_list` VALUES ('348fa76e6bd64cbbbdf528a686c82c3d', null, '192.168.1.1', '2018-10-30 15:48:02');
INSERT INTO `black_list` VALUES ('48f9354f2b1e46da96a7223787edb99d', null, '192.168.1.1', '2018-10-30 15:48:02');
INSERT INTO `black_list` VALUES ('79ef98ff13464bec814f6fe271d4b937', null, '192.168.8.8', '2018-10-30 16:40:58');
INSERT INTO `black_list` VALUES ('98a02941444e42098e3d7f808fed20a4', null, '', '2018-10-30 16:14:52');
INSERT INTO `black_list` VALUES ('e98ab23ebd1a43868fb40c0871a63d58', null, '192.168.2.2', '2018-10-30 16:13:50');
INSERT INTO `black_list` VALUES ('f9f7fb7170924c248a5a1ceba8c79cec', null, '192.168.3.1', '2018-10-30 15:57:26');

-- ----------------------------
-- Table structure for constants
-- ----------------------------
DROP TABLE IF EXISTS `constants`;
CREATE TABLE `constants` (
  `constant_id` varchar(32) NOT NULL COMMENT '常量id',
  `constant_name` varchar(32) DEFAULT NULL COMMENT '常量名称',
  `constant_status` int(1) DEFAULT NULL COMMENT '常量状态',
  PRIMARY KEY (`constant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of constants
-- ----------------------------

-- ----------------------------
-- Table structure for fixed_port
-- ----------------------------
DROP TABLE IF EXISTS `fixed_port`;
CREATE TABLE `fixed_port` (
  `fixed_port_id` varchar(32) NOT NULL COMMENT '固定静态ip',
  `switch_port` varchar(32) DEFAULT NULL COMMENT '交换机端口',
  `mtd_id` varchar(32) DEFAULT NULL COMMENT 'mtd的id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`fixed_port_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fixed_port
-- ----------------------------
INSERT INTO `fixed_port` VALUES ('openflow:2038063737066023809:2', null, '953c6c8b7ee842cdb36cf02c0e8358f3', '2018-11-23 15:39:36');
INSERT INTO `fixed_port` VALUES ('openflow:2038063737066023809:5', null, '953c6c8b7ee842cdb36cf02c0e8358f3', '2018-11-23 15:39:36');

-- ----------------------------
-- Table structure for flow_instruction
-- ----------------------------
DROP TABLE IF EXISTS `flow_instruction`;
CREATE TABLE `flow_instruction` (
  `flow_instruction_id` varchar(32) NOT NULL COMMENT '流表动作id',
  `instruction_order` int(10) DEFAULT NULL,
  `ethernet_source_address` varchar(32) DEFAULT NULL,
  `ipv4_source` varchar(32) DEFAULT NULL,
  `ethernet_destination_address` varchar(32) DEFAULT NULL,
  `ipv4_destination` varchar(32) DEFAULT NULL,
  `output_node_connector` varchar(32) DEFAULT NULL,
  `max_length` int(10) DEFAULT NULL,
  `flow_table_details_id` varchar(32) DEFAULT NULL COMMENT '流详情id',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`flow_instruction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_instruction
-- ----------------------------
INSERT INTO `flow_instruction` VALUES ('007d903d555042e4b517687f50afca3e', null, null, null, null, null, 'CONTROLLER', '65535', '5667569f6ad246fabd6a62037244f63c', '2018-10-29 16:24:04');
INSERT INTO `flow_instruction` VALUES ('00ce3adc699746c2be69fc28f77eaa2c', null, null, null, null, null, 'CONTROLLER', '65535', 'f839ff70fd5e4904a711b1a4e50d66f4', '2018-10-29 16:00:14');
INSERT INTO `flow_instruction` VALUES ('01f8b16c97ff4e52a5518fa4f0ba2759', null, null, null, null, null, 'CONTROLLER', '65535', '4af33bd43cf542acbb1180569489265e', '2018-10-29 14:57:06');
INSERT INTO `flow_instruction` VALUES ('0567d6b5feeb47e78e3fff7249fc614f', null, null, null, null, null, 'CONTROLLER', '65535', '9d794d55cabe47c0bd97343d38237f8a', '2018-10-29 15:03:41');
INSERT INTO `flow_instruction` VALUES ('05add3b14ba24515bc62a2aa8108f00c', null, null, null, null, null, 'CONTROLLER', '65535', '2bc85eae5eba4ed58cdaf505c575860e', '2018-10-29 15:33:04');
INSERT INTO `flow_instruction` VALUES ('067bf5fa912443699bab2730ef71103f', null, null, null, null, null, 'CONTROLLER', '65535', '37efe7284c614ffa9c0b27b7718e0032', '2018-10-29 15:42:04');
INSERT INTO `flow_instruction` VALUES ('0786048589294c6992f0636df72b02e3', null, null, null, null, null, 'CONTROLLER', '65535', '4f0969ba69ba4fed8351f69166acc25f', '2018-10-29 15:03:42');
INSERT INTO `flow_instruction` VALUES ('0829b1b813694927afb3102f6f6d33a7', null, null, null, null, null, 'CONTROLLER', '65535', 'b772ed1552ce41d0975b087b31cdd8e8', '2018-10-29 16:12:02');
INSERT INTO `flow_instruction` VALUES ('08bf22665c504f238a92a2ddcfe9bf2b', null, null, null, null, null, 'CONTROLLER', '65535', 'f1972ad9c3de4c999dff058df35faae2', '2018-10-29 15:03:43');
INSERT INTO `flow_instruction` VALUES ('0930d5860b7c422baf22221479bf71ba', null, null, null, null, null, 'CONTROLLER', '65535', '1ef506f94d11490c847a702b874d12ee', '2018-10-29 15:27:03');
INSERT INTO `flow_instruction` VALUES ('0aae9cde585543378d68c3815ba0b64b', null, null, null, null, null, 'CONTROLLER', '65535', '29537beb88dd4e78bf9a209a220db3df', '2018-10-29 15:15:07');
INSERT INTO `flow_instruction` VALUES ('0acdf8cfd37c4db3ba944410c7bc9ff3', null, null, null, null, null, 'CONTROLLER', '65535', '458003bc40c6483385faf348f7157776', '2018-10-29 16:03:04');
INSERT INTO `flow_instruction` VALUES ('0ccd02b4d9d34d9cb0bd2ed07cb8d1d9', null, null, null, null, null, 'CONTROLLER', '65535', '0458e076b64348a2ae2cdb9487ae2d75', '2018-10-29 15:33:04');
INSERT INTO `flow_instruction` VALUES ('0da1afa2ef064b799aaa9cc4125bc614', null, null, null, null, null, 'CONTROLLER', '65535', '238f4fa97fe543edb71998983b2af823', '2018-10-29 06:03:02');
INSERT INTO `flow_instruction` VALUES ('0f0bdcc5d6d2404899b11711d8c6bafe', null, null, null, null, null, 'CONTROLLER', '65535', 'b3dc2de15c7f47ff8f44ff6493f78c4f', '2018-10-29 15:33:02');
INSERT INTO `flow_instruction` VALUES ('0f53d6cc0e264785afc2208f524dac6e', null, null, null, null, null, 'CONTROLLER', '65535', 'da1996e66e08472da362b5edcf7b799c', '2018-10-29 16:00:10');
INSERT INTO `flow_instruction` VALUES ('104ba6bc67764a7a825f1d2abfd0ea4e', null, null, null, null, null, 'CONTROLLER', '65535', '2dfe1ccbc59b4eb982447e6ea513d239', '2018-10-29 15:33:00');
INSERT INTO `flow_instruction` VALUES ('1279f864125b48ac8cee232ada91fae9', null, null, null, null, null, 'CONTROLLER', '65535', '6e4037b9bb8646488cf20d233aa241e9', '2018-10-29 16:06:01');
INSERT INTO `flow_instruction` VALUES ('12b7e3f3f8c0480ba8a02542564e82b0', null, null, null, null, null, 'CONTROLLER', '65535', '342761c7d9a14975bba60b2aa4719430', '2018-10-29 14:57:05');
INSERT INTO `flow_instruction` VALUES ('12eff36b98f04acab103cdfec95b1479', null, null, null, null, null, 'CONTROLLER', '65535', 'bd9fe49149654f7eb436bda8caf5094e', '2018-10-29 15:03:40');
INSERT INTO `flow_instruction` VALUES ('131736d5722542bdb4547668fbf4ce4e', null, null, null, null, null, 'CONTROLLER', '65535', 'e61def0085b844858d2d4c2065dfdba3', '2018-10-29 06:03:02');
INSERT INTO `flow_instruction` VALUES ('14472e8f1ee94156b170202f4eccc542', null, null, null, null, null, 'CONTROLLER', '65535', '68f0ca63f69f4e6992ae1e080cabc59f', '2018-10-29 15:30:09');
INSERT INTO `flow_instruction` VALUES ('16119a311a664016b888c789743a0809', null, null, null, null, null, 'CONTROLLER', '65535', '1a840f6bb5e8469bbc37e9a4776805c2', '2018-10-29 16:03:01');
INSERT INTO `flow_instruction` VALUES ('163e0078b1e6444e8f3db2fab83bc340', null, null, null, null, null, 'CONTROLLER', '65535', '357aba46802541a0bee0850db8d3385c', '2018-10-29 15:15:08');
INSERT INTO `flow_instruction` VALUES ('1698f5a38e35466a808d753663e49606', null, null, null, null, null, 'CONTROLLER', '65535', '240a4e27b96349a998cdf61a2c189647', '2018-10-29 15:00:13');
INSERT INTO `flow_instruction` VALUES ('16a083c7d8e54cadb98deaa71fcc1b12', null, null, null, null, null, 'CONTROLLER', '65535', '88dbc025fc6c48fd95b6521fc2780d21', '2018-10-29 06:03:02');
INSERT INTO `flow_instruction` VALUES ('171eed82e59b4b86b20ffe1da6c06403', null, null, null, null, null, 'CONTROLLER', '65535', '0f7a601fe37248799c29adc82af93680', '2018-10-29 15:54:04');
INSERT INTO `flow_instruction` VALUES ('171fb6ec217649c890058d173532c6a1', null, null, null, null, null, 'CONTROLLER', '65535', '5b1c23c99e4f47c394eda9a6fca108a4', '2018-10-29 15:15:03');
INSERT INTO `flow_instruction` VALUES ('187b083080d642419de5d4e7453c47c2', null, null, null, null, null, 'CONTROLLER', '65535', 'ea3d0a843d804e7db95c7ef43cdb0d36', '2018-10-29 15:54:04');
INSERT INTO `flow_instruction` VALUES ('18bafe55472d48028adcfa996e465bf6', null, null, null, null, null, 'CONTROLLER', '65535', 'fb78f370ad384cee9a30979e6d9241f7', '2018-10-29 16:21:04');
INSERT INTO `flow_instruction` VALUES ('191ea2c95bde405987e36f8b45ea5255', null, null, null, null, null, 'CONTROLLER', '65535', 'b2e407139eb54c8f801a91d4cf29aa94', '2018-10-29 15:00:10');
INSERT INTO `flow_instruction` VALUES ('19a9368187444d9e8da6ea5cb05174f7', null, null, null, null, null, 'CONTROLLER', '65535', '2c82df90a86b4970a8d7f9a42eb73645', '2018-10-29 15:00:13');
INSERT INTO `flow_instruction` VALUES ('1a9d93ae02284c7fb3a19ad791530167', null, null, null, null, null, 'CONTROLLER', '65535', '3e7622c5d6e541379514e5824a9a4965', '2018-10-29 15:54:04');
INSERT INTO `flow_instruction` VALUES ('1bd16cb364d34191844d9d29672c9baa', null, null, null, null, null, 'CONTROLLER', '65535', '4d33eea779cc49d482eeda41ca80ab2c', '2018-10-29 14:57:07');
INSERT INTO `flow_instruction` VALUES ('1c07e4b4d12141d494c57d803acfc08c', null, null, null, null, null, 'CONTROLLER', '65535', 'b9668a458e9c4c6fb6452763a63b8c71', '2018-10-29 16:03:02');
INSERT INTO `flow_instruction` VALUES ('1c17958b62d64902ba236cd36b8c8de2', null, null, null, null, null, 'CONTROLLER', '65535', '6a65ac3d9e654a0aa47de3c56deb1928', '2018-10-29 16:15:01');
INSERT INTO `flow_instruction` VALUES ('1c781f5547b9470b9a720cbb3ccf85fe', null, null, null, null, null, 'CONTROLLER', '65535', '6baea29ab75948c3aff28d1c24c86106', '2018-10-29 15:30:11');
INSERT INTO `flow_instruction` VALUES ('1c98cb289d234a97b053c7f2d364cc27', null, null, null, null, null, 'CONTROLLER', '65535', '0702b478ce3849a98434782252e115cf', '2018-10-29 16:20:34');
INSERT INTO `flow_instruction` VALUES ('1e03ebbff5da4744b0c7b82469f742f8', null, null, null, null, null, 'CONTROLLER', '65535', '39fe22cc542b4fc18e979ca8b6fccd74', '2018-10-29 15:12:05');
INSERT INTO `flow_instruction` VALUES ('1e5d079ec4084d0fafe6282b1d029a5f', null, null, null, null, null, 'CONTROLLER', '65535', 'eec94471c0954fb79e438a47f07b901b', '2018-10-29 16:06:03');
INSERT INTO `flow_instruction` VALUES ('1e5e4f06570640f197704c1d75936c1a', null, null, null, null, null, 'CONTROLLER', '65535', '1b11519ae8504ab6bbdd9b45fbdc25e8', '2018-10-29 14:57:06');
INSERT INTO `flow_instruction` VALUES ('1ea7d8dd11a344beafba223d65ba7756', null, null, null, null, null, 'CONTROLLER', '65535', '58c8c7eacd0846a4bed157a51dbdd29b', '2018-10-29 16:21:03');
INSERT INTO `flow_instruction` VALUES ('1f06a7eeb97043da9ab6825dc198d13f', null, null, null, null, null, 'CONTROLLER', '65535', 'fccfbb87b10e477699f188eaec03c735', '2018-10-29 16:24:02');
INSERT INTO `flow_instruction` VALUES ('1f28eab23aaf4047b7302bfabd2e5b32', null, null, null, null, null, 'CONTROLLER', '65535', '87f948771f5348e39d116acca1300728', '2018-10-29 14:57:06');
INSERT INTO `flow_instruction` VALUES ('1f30d23e6f2343cfa0566ae07d25a452', null, null, null, null, null, 'CONTROLLER', '65535', 'bbe3636c66a9405d861bcf40bf997cef', '2018-10-29 15:12:04');
INSERT INTO `flow_instruction` VALUES ('1fb2756e9fcd4c9e8a5b45eb957ac1ee', null, null, null, null, null, 'CONTROLLER', '65535', '7d4b54aa0d2640938e96861dfac9683b', '2018-10-29 06:03:01');
INSERT INTO `flow_instruction` VALUES ('215e498a2f114bb8ab7f509c3487ba1b', null, null, null, null, null, 'CONTROLLER', '65535', 'e598e61153864635b10c7adbf3c4ef2b', '2018-10-29 15:00:12');
INSERT INTO `flow_instruction` VALUES ('21829d5de6ff44c29cdae59a70aac348', null, null, null, null, null, 'CONTROLLER', '65535', 'd05d1f9756c84572b58b710cee1f4831', '2018-10-29 15:33:01');
INSERT INTO `flow_instruction` VALUES ('21d55db4f4fd44c09ee447c14e009aa5', null, null, null, null, null, 'CONTROLLER', '65535', '502e982e8628446ebc838ce8f1d9b989', '2018-10-29 16:21:02');
INSERT INTO `flow_instruction` VALUES ('21d6606fc7c84893af6bc448146a24b9', null, null, null, null, null, 'CONTROLLER', '65535', '3fc9c7d48f9f4856a45bdf172975d252', '2018-10-29 15:06:04');
INSERT INTO `flow_instruction` VALUES ('234ac85040e74f5699537f53e6e1a92a', null, null, null, null, null, 'CONTROLLER', '65535', '2d19157139454ddfae6aa5a5d1f02191', '2018-10-29 15:06:05');
INSERT INTO `flow_instruction` VALUES ('23e1658214594a5db315598529816a39', null, null, null, null, null, 'CONTROLLER', '65535', '055e641288f84a99b243db515175b9c4', '2018-10-29 14:57:07');
INSERT INTO `flow_instruction` VALUES ('251efcf1fcd14c73a38a2cb571a2271f', null, null, null, null, null, 'CONTROLLER', '65535', '8eccdef712044902aba67b954853f3f3', '2018-10-29 15:12:05');
INSERT INTO `flow_instruction` VALUES ('25bc85bd25fe48cf8e1f8e8782387986', null, null, null, null, null, 'CONTROLLER', '65535', '486b11a3cba7431d8cea49be0849136d', '2018-10-29 15:06:06');
INSERT INTO `flow_instruction` VALUES ('25dbf9b1fddf4f73bf4b645bbad98de0', null, null, null, null, null, 'CONTROLLER', '65535', '16c411c73e854699b2ed2fbb46d91cef', '2018-10-29 15:18:03');
INSERT INTO `flow_instruction` VALUES ('25ecca0bd98549bf8bd4d806762d7daa', null, null, null, null, null, 'CONTROLLER', '65535', '72cfb9215fc4485ba90762036b296816', '2018-10-29 15:45:01');
INSERT INTO `flow_instruction` VALUES ('261d953ba00c448990ca79a913cc5158', null, null, null, null, null, 'CONTROLLER', '65535', 'a95f5af18e0442b1815be24b1c6c875c', '2018-10-29 16:24:02');
INSERT INTO `flow_instruction` VALUES ('2623a2eb12ed4f769020796b43912be4', null, null, null, null, null, 'CONTROLLER', '65535', '26b6cb635326488c8161a167b5ecf6fc', '2018-10-29 16:20:36');
INSERT INTO `flow_instruction` VALUES ('2650cb27a08041d0842cceb7fdf4c479', null, null, null, null, null, 'CONTROLLER', '65535', 'ba2a0f4d444745dfbdd18f7d05d2a54b', '2018-10-29 16:12:04');
INSERT INTO `flow_instruction` VALUES ('28d8d3c19f104a8b8789369f9d1177b4', null, null, null, null, null, 'CONTROLLER', '65535', '463ce998737d44f4b5cca9caa1d12c56', '2018-10-29 06:03:00');
INSERT INTO `flow_instruction` VALUES ('2985550d6ded4d069031d1b2d3227b13', null, null, null, null, null, 'CONTROLLER', '65535', 'c85850fdbdbc4365902e9a449e6de744', '2018-10-29 16:15:03');
INSERT INTO `flow_instruction` VALUES ('29f4e4f4a061441dab2ff33116956d1e', null, null, null, null, null, 'CONTROLLER', '65535', '864bdaa72f2d43839b21c974ba87c103', '2018-10-29 15:39:06');
INSERT INTO `flow_instruction` VALUES ('2a89f82289dd4852ab5a74e269e014cf', null, null, null, null, null, 'CONTROLLER', '65535', '1a519ff4275c4021bbf4e8b0f3956b2a', '2018-10-29 15:15:07');
INSERT INTO `flow_instruction` VALUES ('2aa49e492c9a4f9bb8338025325e97bb', null, null, null, null, null, 'CONTROLLER', '65535', '9ba16c9eba0949a0a80d57795757fc6e', '2018-10-29 16:03:01');
INSERT INTO `flow_instruction` VALUES ('2ae834790b93414e817eb0b512c399ab', null, null, null, null, null, 'CONTROLLER', '65535', '0beb897f6ec14f3f98eacd1751103c4f', '2018-10-29 15:39:11');
INSERT INTO `flow_instruction` VALUES ('2b84b35799ea4079ade176afda37fac9', null, null, null, null, null, 'CONTROLLER', '65535', 'ea08636ed2054ffd821ee9ee843e0eaa', '2018-10-29 15:45:03');
INSERT INTO `flow_instruction` VALUES ('2bb122a7620548ffbf9a2e821069947b', null, null, null, null, null, 'CONTROLLER', '65535', '5636acbc66e6407d846439b2fb88d970', '2018-10-29 15:12:04');
INSERT INTO `flow_instruction` VALUES ('2bea30f382af4459871418e894656a16', null, null, null, null, null, 'CONTROLLER', '65535', '1040b4747b2e4dc8b9f38717b131cc1b', '2018-10-29 16:03:01');
INSERT INTO `flow_instruction` VALUES ('2c0570af43474b33b8571f3f0b4ac9fb', null, null, null, null, null, 'CONTROLLER', '65535', 'ee77495d407847589c191f56a72de6a8', '2018-10-29 16:00:13');
INSERT INTO `flow_instruction` VALUES ('2c89b38492714679bd7c592dd98d2ee1', null, null, null, null, null, 'CONTROLLER', '65535', '97c5d216ba3b4e149c57007e8bcc290a', '2018-10-29 15:06:08');
INSERT INTO `flow_instruction` VALUES ('2cec3d8b55414d30889c605da05f3589', null, null, null, null, null, 'CONTROLLER', '65535', 'eaa7cb6235be4e0699651f52c623e993', '2018-10-29 15:39:09');
INSERT INTO `flow_instruction` VALUES ('2e402828498c47aeb9a016ef73388a9d', null, null, null, null, null, 'CONTROLLER', '65535', '1d4822a2022f4604a7c38c6172134529', '2018-10-29 16:15:01');
INSERT INTO `flow_instruction` VALUES ('2e56fd7ce4e04ecdb758c3f096ebf6fd', null, null, null, null, null, 'CONTROLLER', '65535', '5dfd1c6977334645b6d7e185164a7ed1', '2018-10-29 15:24:03');
INSERT INTO `flow_instruction` VALUES ('2ef5325e8c014818bd4e264dd1c619a1', null, null, null, null, null, 'CONTROLLER', '65535', '7d27186db6654329a2abfa79e85036d9', '2018-10-29 16:09:03');
INSERT INTO `flow_instruction` VALUES ('2f3e614dc89b4ee9beabedbbcaed4f06', null, null, null, null, null, 'CONTROLLER', '65535', 'ebb1be328e844b94a28e6c8c61da8575', '2018-10-29 15:00:11');
INSERT INTO `flow_instruction` VALUES ('2f9019182f11494691e05886581d19a3', null, null, null, null, null, 'CONTROLLER', '65535', 'ddfc8c1f4e884a4693cf8739da21627a', '2018-10-29 15:30:10');
INSERT INTO `flow_instruction` VALUES ('2fa0caba4d44440fa64147ce8e6c6648', null, null, null, null, null, 'CONTROLLER', '65535', '1ac6a5811a4e40c98dde09927dd7d49c', '2018-10-29 15:21:02');
INSERT INTO `flow_instruction` VALUES ('308c0ad54fe84102b65061a132fd1011', null, null, null, null, null, 'CONTROLLER', '65535', '1e6b6552ed344fffb0e20eafa3e909df', '2018-10-29 15:06:05');
INSERT INTO `flow_instruction` VALUES ('31260dfeb4ad421dbf7bdfd7d4c88da2', null, null, null, null, null, 'CONTROLLER', '65535', '58bc7d53834a44309fd83205b1c4fbd2', '2018-10-29 16:00:10');
INSERT INTO `flow_instruction` VALUES ('318a60aacba54c56b796676897108b0f', null, null, null, null, null, 'CONTROLLER', '65535', '5fafa784b9054ca387706f89520903bc', '2018-10-29 15:09:02');
INSERT INTO `flow_instruction` VALUES ('31b4fc2b70f74021816175c6d755f1ad', null, null, null, null, null, 'CONTROLLER', '65535', 'fb9719af87734d3ebc2c2bcb60e2181a', '2018-10-29 15:33:03');
INSERT INTO `flow_instruction` VALUES ('31c27d18402f4ab09d2031defc0ea29e', null, null, null, null, null, 'CONTROLLER', '65535', '0407775b17974bcea4c4c39b1f458d9f', '2018-10-29 16:21:03');
INSERT INTO `flow_instruction` VALUES ('333e1c09b00346bf933afb03abb3461d', null, null, null, null, null, 'CONTROLLER', '65535', '5697513697b545d9953913ad7cc36cc9', '2018-10-29 16:03:03');
INSERT INTO `flow_instruction` VALUES ('33d041404e8241f7a1370f4cfe1d628b', null, null, null, null, null, 'CONTROLLER', '65535', '73ca7561276c4d11a0c76fa87599f0f8', '2018-10-29 16:21:01');
INSERT INTO `flow_instruction` VALUES ('346a997631c04193bd237b8c29313a1d', null, null, null, null, null, 'CONTROLLER', '65535', '0175a4c7533241febc18f125082107d9', '2018-10-29 15:06:08');
INSERT INTO `flow_instruction` VALUES ('34f26f7b33964d8e80f6bd31c8ccdcc3', null, null, null, null, null, 'CONTROLLER', '65535', '7431a5efa11d4ac5bb3bc68a43dc205e', '2018-10-29 16:00:09');
INSERT INTO `flow_instruction` VALUES ('34f2d0a3c30448d7a76b7e29124dd219', null, null, null, null, null, 'CONTROLLER', '65535', '884c2748e1d14fc6b9858a978c4086d9', '2018-10-29 15:39:08');
INSERT INTO `flow_instruction` VALUES ('3528df11924040a1bd9a9265a6e4fca0', null, null, null, null, null, 'CONTROLLER', '65535', 'f142d786d1134d6b955c1773c59d2ae4', '2018-10-29 15:15:06');
INSERT INTO `flow_instruction` VALUES ('354c044165d24066964c31cb35e6f83e', null, null, null, null, null, 'CONTROLLER', '65535', 'f5824b3e33a74cf8b28a76953bce4479', '2018-10-29 15:09:04');
INSERT INTO `flow_instruction` VALUES ('361ec511b563413397586361810de24e', null, null, null, null, null, 'CONTROLLER', '65535', '659e67e558564739af7bd7899c81b626', '2018-10-29 16:20:35');
INSERT INTO `flow_instruction` VALUES ('379e5b70b9f846339b7d4074102fb8d2', null, null, null, null, null, 'CONTROLLER', '65535', '09e088945b14454dbfe617311262470c', '2018-10-29 16:09:03');
INSERT INTO `flow_instruction` VALUES ('38285abf99db4c5487f60e4391fafeae', null, null, null, null, null, 'CONTROLLER', '65535', 'a428dd9d729241e6a43e95f41600e5a6', '2018-10-29 15:45:04');
INSERT INTO `flow_instruction` VALUES ('3873d096350f492d97f1eeba0ed0a7fc', null, null, null, null, null, 'CONTROLLER', '65535', 'fd3c35d01e7242e482b815bdee4cf0c2', '2018-10-29 15:12:03');
INSERT INTO `flow_instruction` VALUES ('3875a83895fa41348df0d48fb3f4ca0e', null, null, null, null, null, 'CONTROLLER', '65535', '18c003e1418d48928b47349af31946dc', '2018-10-29 16:21:05');
INSERT INTO `flow_instruction` VALUES ('38938546e1f54fe28357a70f4e8a363b', null, null, null, null, null, 'CONTROLLER', '65535', '44d7996d410643c4b2f3b3d320b2d632', '2018-10-29 16:12:01');
INSERT INTO `flow_instruction` VALUES ('3a091374ae904e0d9871bd66b7247f8e', null, null, null, null, null, 'CONTROLLER', '65535', '512c4ddcc5924b9d8b6f35bcb300e26f', '2018-10-29 15:39:08');
INSERT INTO `flow_instruction` VALUES ('3c093bbef63a4c37b81ba89cb5ad4691', null, null, null, null, null, 'CONTROLLER', '65535', '4376047255084c51a23d0275f54a7ad7', '2018-10-29 16:21:03');
INSERT INTO `flow_instruction` VALUES ('3c10c089dccf420ba01b64c080de0131', null, null, null, null, null, 'CONTROLLER', '65535', '25d2a672535949d18ce6705b015ceca8', '2018-10-29 16:20:35');
INSERT INTO `flow_instruction` VALUES ('3c81f7854232449cbe5c555570a758a9', null, null, null, null, null, 'CONTROLLER', '65535', '58aa0f2fcf4e4ec5a7fa3d04e54b217b', '2018-10-29 16:09:02');
INSERT INTO `flow_instruction` VALUES ('3ddced967c154f62a03b69c552d357ff', null, null, null, null, null, 'CONTROLLER', '65535', '4dbc072fac3a467b8e177b3fa8e137c3', '2018-10-29 15:15:08');
INSERT INTO `flow_instruction` VALUES ('3e6fcd28345e408c8fbdc3d9f43349e5', null, null, null, null, null, 'CONTROLLER', '65535', '3f1c44fce413481089c66299f0115442', '2018-10-29 15:39:07');
INSERT INTO `flow_instruction` VALUES ('3ed03df4065d42edbae977c239dd4e27', null, null, null, null, null, 'CONTROLLER', '65535', '2b4a9921205e480cb0d903432312cbd6', '2018-10-29 15:42:02');
INSERT INTO `flow_instruction` VALUES ('3f0d0c5d166441dd8e3ff3877e974760', null, null, null, null, null, 'CONTROLLER', '65535', '2219e69055f84b54aa424fbf25b83f25', '2018-10-29 16:03:03');
INSERT INTO `flow_instruction` VALUES ('3f32a208b091442cb1c753ebd712732f', null, null, null, null, null, 'CONTROLLER', '65535', '5050f0b48fa94794bc55c07b812a5e5c', '2018-10-29 16:12:03');
INSERT INTO `flow_instruction` VALUES ('3fda069b02f749bcbae1ba23918d826e', null, null, null, null, null, 'CONTROLLER', '65535', '6e0829ee5ba549159e8ba47c14a59044', '2018-10-29 16:15:02');
INSERT INTO `flow_instruction` VALUES ('40dd2ded435b42fd905992d01ffe3f1e', null, null, null, null, null, 'CONTROLLER', '65535', 'ad9fcc0a870049e8ac3c34f93e58bf7a', '2018-10-29 06:03:01');
INSERT INTO `flow_instruction` VALUES ('40f213bf3f1e4e2f93e621c77a665ce3', null, null, null, null, null, 'CONTROLLER', '65535', '4c5f2682b3054a96badfd6161112ccea', '2018-10-29 15:54:02');
INSERT INTO `flow_instruction` VALUES ('4155b8aca11f4632a37c2149b56f7d80', null, null, null, null, null, 'CONTROLLER', '65535', '4f5f062fbd7d44e2997ba15c723e15a0', '2018-10-29 15:33:01');
INSERT INTO `flow_instruction` VALUES ('42ce9f6b3a9d41e1907db2d9e44c7c91', null, null, null, null, null, 'CONTROLLER', '65535', 'd1f83546ad9d4ff595b161271efe32ec', '2018-10-29 15:54:05');
INSERT INTO `flow_instruction` VALUES ('42dd23b4170c4cf9921d866bc0ed80d0', null, null, null, null, null, 'CONTROLLER', '65535', 'c52ee43ad2fa49b989c86d1f7a155d04', '2018-10-29 16:24:03');
INSERT INTO `flow_instruction` VALUES ('42e7adb43998406f99fc512ff93e18d4', null, null, null, null, null, 'CONTROLLER', '65535', 'e02369cec1a747e4a664d9d4def76e8a', '2018-10-29 16:06:05');
INSERT INTO `flow_instruction` VALUES ('437751d5c86849eaa5a8a1a08ad8513f', null, null, null, null, null, 'CONTROLLER', '65535', '6e6b7e3339924f61b9f3c0f80d353950', '2018-10-29 15:15:05');
INSERT INTO `flow_instruction` VALUES ('4384988ba8f14a90a8b288164ba83ea6', null, null, null, null, null, 'CONTROLLER', '65535', '68feff421af5499083dd26c8e754329e', '2018-10-29 14:57:03');
INSERT INTO `flow_instruction` VALUES ('43ee974868a145d9abd480f3f70b83e4', null, null, null, null, null, 'CONTROLLER', '65535', '330150d470724353b471ab042444f0e2', '2018-10-29 14:57:04');
INSERT INTO `flow_instruction` VALUES ('4624d94776ce414bb5f3ff079da19caa', null, null, null, null, null, 'CONTROLLER', '65535', '0b309d39d4014293a74f7040249f7ade', '2018-10-29 15:06:07');
INSERT INTO `flow_instruction` VALUES ('4670ac3deda84db6adde89214c8a4747', null, null, null, null, null, 'CONTROLLER', '65535', '9ddfa8dee8734c3f934112f86a0008fc', '2018-10-29 15:03:39');
INSERT INTO `flow_instruction` VALUES ('469adb9cb3b84c9baafb2f6926bd4954', null, null, null, null, null, 'CONTROLLER', '65535', '265c24eb828144f08ee823396402f75f', '2018-10-29 15:15:04');
INSERT INTO `flow_instruction` VALUES ('4720041b4b19444885d87be8c7dec70f', null, null, null, null, null, 'CONTROLLER', '65535', '6e5524919e6245ea993de139c7b0a1f3', '2018-10-29 15:39:07');
INSERT INTO `flow_instruction` VALUES ('47a4f6b5a8c44058af948831c144ffd0', null, null, null, null, null, 'CONTROLLER', '65535', '7677329161434ab78944fb639d0f8356', '2018-10-29 15:39:10');
INSERT INTO `flow_instruction` VALUES ('480da06f50a14310999c5686eea7d082', null, null, null, null, null, 'CONTROLLER', '65535', '97df96e0f6e74ba3bfd9b3ab6bd27f5f', '2018-10-29 16:24:03');
INSERT INTO `flow_instruction` VALUES ('485491e10d274713b3d5326cfc9edaad', null, null, null, null, null, 'CONTROLLER', '65535', '0e669017d7be46279985fbac31d1f3a4', '2018-10-29 15:00:14');
INSERT INTO `flow_instruction` VALUES ('493a04c4bb6b43f49b78ddd3d003c244', null, null, null, null, null, 'CONTROLLER', '65535', '18660cb7bbde43459b1bf6db245d8dab', '2018-10-29 15:00:14');
INSERT INTO `flow_instruction` VALUES ('496f34de89f44523bc96f1ed311ccef1', null, null, null, null, null, 'CONTROLLER', '65535', 'f253f0b94f2c4519ab904fea143d03b8', '2018-10-29 15:42:01');
INSERT INTO `flow_instruction` VALUES ('49f892939fa548aea75842127856d2f0', null, null, null, null, null, 'CONTROLLER', '65535', '17b2c55832bf48749704f537ca736504', '2018-10-29 15:18:01');
INSERT INTO `flow_instruction` VALUES ('4a12ad9ea5014aa38804afb8ced2bd4e', null, null, null, null, null, 'CONTROLLER', '65535', '4cc228138f2f49beb73f0395c1d6bfd6', '2018-10-29 15:21:03');
INSERT INTO `flow_instruction` VALUES ('4a1a5d775f3743a0aa11d157864bb4fb', null, null, null, null, null, 'CONTROLLER', '65535', '2d231d3b57ef4908b3634045e4f9baff', '2018-10-29 15:24:02');
INSERT INTO `flow_instruction` VALUES ('4a39c5070fc14a0baf7cb3e4b0e6c97b', null, null, null, null, null, 'CONTROLLER', '65535', '5f90610f947540e2ba1b51a7219d77bf', '2018-10-29 16:06:05');
INSERT INTO `flow_instruction` VALUES ('4ab2186814b14ccf850db8efd225fa1f', null, null, null, null, null, 'CONTROLLER', '65535', '178995fad1974ae58a77a132812fdce1', '2018-10-29 14:57:08');
INSERT INTO `flow_instruction` VALUES ('4aee6f91ce2543579fefc5e8e8f50858', null, null, null, null, null, 'CONTROLLER', '65535', '6c98a93eb31c4b878844b8595fbedc14', '2018-10-29 15:30:12');
INSERT INTO `flow_instruction` VALUES ('4c6079fa1dbe4d5b81e57246ddd7d619', null, null, null, null, null, 'CONTROLLER', '65535', '377d7b58cf2b41d7afb626fe1d5a6a98', '2018-10-29 16:12:05');
INSERT INTO `flow_instruction` VALUES ('4d462239514c44c3af8fac8c5a10c401', null, null, null, null, null, 'CONTROLLER', '65535', '6461634e73f343c48ac6771bc16cf039', '2018-10-29 16:20:34');
INSERT INTO `flow_instruction` VALUES ('4d734866e33349d49f3a58ef5329609a', null, null, null, null, null, 'CONTROLLER', '65535', '8e7e3d56b12a4ca2af235ae0bff6062a', '2018-10-29 15:21:01');
INSERT INTO `flow_instruction` VALUES ('4e02d0f3b52142c7a826a64f014b20c6', null, null, null, null, null, 'CONTROLLER', '65535', '3efd6fc13fe54d698a6dccf8e46d1c18', '2018-10-29 15:33:03');
INSERT INTO `flow_instruction` VALUES ('4e8033a6c7c644d8b979d7b4008a686c', null, null, null, null, null, 'CONTROLLER', '65535', '5727f85514964919bf00e1ee0d015fec', '2018-10-29 15:21:03');
INSERT INTO `flow_instruction` VALUES ('4eb3fb267900498592891b12eba104b8', null, null, null, null, null, 'CONTROLLER', '65535', '707f7a0cff574ea28b3612dde5c15160', '2018-10-29 15:39:11');
INSERT INTO `flow_instruction` VALUES ('4fdcc1155c25456ba09920f726c9eab0', null, null, null, null, null, 'CONTROLLER', '65535', 'dd66b5d58a8042f6b07a53d1317bb7ca', '2018-10-29 15:24:01');
INSERT INTO `flow_instruction` VALUES ('50f9d048b0c04937a99e9a9895f2d3e3', null, null, null, null, null, 'CONTROLLER', '65535', 'aeec2baf88b44cda81de0ede58b09dcc', '2018-10-29 16:24:04');
INSERT INTO `flow_instruction` VALUES ('5128106483644e12900105ea204dcaa6', null, null, null, null, null, 'CONTROLLER', '65535', '63d8af9279ac4de9ab231f0d8ba137f2', '2018-10-29 15:24:05');
INSERT INTO `flow_instruction` VALUES ('51df7869bd374679b472fa136c7e47e7', null, null, null, null, null, 'CONTROLLER', '65535', 'e3c27a80c7e747758308c8ff9f6f6e62', '2018-10-29 15:27:02');
INSERT INTO `flow_instruction` VALUES ('52247bd33a8241fd99a03992cb268b8b', null, null, null, null, null, 'CONTROLLER', '65535', '955a9eb64ee24bd282b09935034b49ab', '2018-10-29 15:33:03');
INSERT INTO `flow_instruction` VALUES ('52c77bdd194443a48efd198c8f9742c9', null, null, null, null, null, 'CONTROLLER', '65535', '53ec58fd91914014b9fba8fd56c25654', '2018-10-29 15:30:10');
INSERT INTO `flow_instruction` VALUES ('52e4a3f1f8d846d497bd5b50210f01c5', null, null, null, null, null, 'CONTROLLER', '65535', '9bc04fc6089447b1985f62d3de68b886', '2018-10-29 15:24:02');
INSERT INTO `flow_instruction` VALUES ('53f104cb009d455abda7c2b4eddb2b51', null, null, null, null, null, 'CONTROLLER', '65535', '59df6a8baaa14076a9266fadf8253edc', '2018-10-29 15:09:02');
INSERT INTO `flow_instruction` VALUES ('56c89a3c05e24425b82b790936e5a120', null, null, null, null, null, 'CONTROLLER', '65535', '5f448715e1bf43c3b360ef1e0cbd60c5', '2018-10-29 16:00:10');
INSERT INTO `flow_instruction` VALUES ('584fd5a3131e4728b0226604443e764f', null, null, null, null, null, 'CONTROLLER', '65535', '834aa0be5c304f24b4cf6839df3b1292', '2018-10-29 15:18:04');
INSERT INTO `flow_instruction` VALUES ('58890d1dccc84f298c4ba3ad4253407d', null, null, null, null, null, 'CONTROLLER', '65535', 'babc320dca5e45a584d6fa8bf28b8bdb', '2018-10-29 16:20:32');
INSERT INTO `flow_instruction` VALUES ('591bee11bca8420db2d70e830de76d6f', null, null, null, null, null, 'CONTROLLER', '65535', '2c9963acde18498a9cf7ada7f433945a', '2018-10-29 15:42:05');
INSERT INTO `flow_instruction` VALUES ('5997dba37cdd4a47b40efdca1ae75916', null, null, null, null, null, 'CONTROLLER', '65535', '187f0c74c3f04750a9baa6d6415cf913', '2018-10-29 15:24:01');
INSERT INTO `flow_instruction` VALUES ('5d8057dfd25e438c86f18c527f737c13', null, null, null, null, null, 'CONTROLLER', '65535', '46d7a64c86844bca89139465cd71e516', '2018-10-29 15:30:11');
INSERT INTO `flow_instruction` VALUES ('5dd99e81306849e283aff97a41adabd6', null, null, null, null, null, 'CONTROLLER', '65535', '18349b5188744e6db40571a4711c4c50', '2018-10-29 16:24:04');
INSERT INTO `flow_instruction` VALUES ('5e40611638fb42fb8fdfe97f695a725d', null, null, null, null, null, 'CONTROLLER', '65535', '0a16e99e50c8419ca26b04504bd0198d', '2018-10-29 16:12:04');
INSERT INTO `flow_instruction` VALUES ('5ede5ecc3d1745d6979b53eb33c0ef3c', null, null, null, null, null, 'CONTROLLER', '65535', '676943ae182949c89152dc289ed55777', '2018-10-29 16:00:11');
INSERT INTO `flow_instruction` VALUES ('5f32d5867d8345419adb6462d451a1b4', null, null, null, null, null, 'CONTROLLER', '65535', 'b050031e5e674ab995de25b391ee9007', '2018-10-29 15:33:05');
INSERT INTO `flow_instruction` VALUES ('5f7d7d2ffac24026a8eb9d36237023ac', null, null, null, null, null, 'CONTROLLER', '65535', '60b5be41ebc548b4bb0ef0f3a7fd5921', '2018-10-29 16:12:01');
INSERT INTO `flow_instruction` VALUES ('5ffa28f14a0848d6a4d8e5698166bc90', null, null, null, null, null, 'CONTROLLER', '65535', '88bdfadde74e4af38ac86ce4d22b0f64', '2018-10-29 15:42:03');
INSERT INTO `flow_instruction` VALUES ('5fff82cfcc4c47ff9997180dcbd6b199', null, null, null, null, null, 'CONTROLLER', '65535', '7b12d61ea6a84d388b939f68362a7838', '2018-10-29 16:00:11');
INSERT INTO `flow_instruction` VALUES ('606239edd1bf46598d92a339d7fd320d', null, null, null, null, null, 'CONTROLLER', '65535', '2a60ea5f5ee443b3888637255b39fbf0', '2018-10-29 16:21:01');
INSERT INTO `flow_instruction` VALUES ('60a99c7931c14ee78b37008e42f6bc85', null, null, null, null, null, 'CONTROLLER', '65535', '99473cf7ce2b401eb3bfde47d617c149', '2018-10-29 06:03:02');
INSERT INTO `flow_instruction` VALUES ('60b47214faa54c00892facbfb19f7f38', null, null, null, null, null, 'CONTROLLER', '65535', '68fadd02b6434be891e32a0939fa57ae', '2018-10-29 16:00:12');
INSERT INTO `flow_instruction` VALUES ('60b8111ed9d8468b93d194d9a8606d5b', null, null, null, null, null, 'CONTROLLER', '65535', '7085b6a6c33945bc82d243c6f9dc63d3', '2018-10-29 15:27:04');
INSERT INTO `flow_instruction` VALUES ('61568ff0b4ac4860a950f00101ff9b96', null, null, null, null, null, 'CONTROLLER', '65535', '8601ba30b6704b0f83fbc04bb8f3cbb6', '2018-10-29 15:09:03');
INSERT INTO `flow_instruction` VALUES ('618fcdd879d9475ab935e54203f5f2ae', null, null, null, null, null, 'CONTROLLER', '65535', 'cbb42d57b44f404cab780fe72aea6d03', '2018-10-29 15:42:04');
INSERT INTO `flow_instruction` VALUES ('61916e34f79b47c4a10b40e769f851b7', null, null, null, null, null, 'CONTROLLER', '65535', 'ec53479498ae44dfbbf34fa18d81c702', '2018-10-29 16:09:00');
INSERT INTO `flow_instruction` VALUES ('61c610c1742a420688ee8163df354d13', null, null, null, null, null, 'CONTROLLER', '65535', 'a0ca9ee110494a96a33e7fbfbc54d928', '2018-10-29 15:54:03');
INSERT INTO `flow_instruction` VALUES ('61edbebbb0124dc5985197309a33563d', null, null, null, null, null, 'CONTROLLER', '65535', '7380083c660c465b846c7a87ac072890', '2018-10-29 15:30:12');
INSERT INTO `flow_instruction` VALUES ('6303ede60ba740ab9a5cfbcae71f1303', null, null, null, null, null, 'CONTROLLER', '65535', 'e57839182f9e426792b5b42751a8eed3', '2018-10-29 16:20:33');
INSERT INTO `flow_instruction` VALUES ('635dbb066d5c4c48884355ddc240d70a', null, null, null, null, null, 'CONTROLLER', '65535', '64b06c182e3b4157b93f353913bf6847', '2018-10-29 15:03:42');
INSERT INTO `flow_instruction` VALUES ('635f60619fbd4fee8e5b6387aeebf955', null, null, null, null, null, 'CONTROLLER', '65535', '2df9720495c74ecf8c9451a5ea6b904a', '2018-10-29 16:03:04');
INSERT INTO `flow_instruction` VALUES ('6377156d4f0e4b68909547f12684fa64', null, null, null, null, null, 'CONTROLLER', '65535', '506dfa56121547628dfe89fd4a486ef5', '2018-10-29 16:03:05');
INSERT INTO `flow_instruction` VALUES ('63b4aa6b736a4f2c929ab71b5c1ff1f0', null, null, null, null, null, 'CONTROLLER', '65535', '8ca6737a996844b2ae3fa23a29853929', '2018-10-29 15:18:02');
INSERT INTO `flow_instruction` VALUES ('63c45b2cec0d406da9a3f501fca09fe6', null, null, null, null, null, 'CONTROLLER', '65535', '8d5cbc03f9844f9f8d13ca1479b2d782', '2018-10-29 15:18:05');
INSERT INTO `flow_instruction` VALUES ('63cf5f2f4d134819afbf4a8179714bc4', null, null, null, null, null, 'CONTROLLER', '65535', '1eaf237e122a4a148ba4543a93fb8900', '2018-10-29 16:20:35');
INSERT INTO `flow_instruction` VALUES ('656d64bbc3e6464fad328ed677ff1c2d', null, null, null, null, null, 'CONTROLLER', '65535', '379cf697f44a4b019039be22372cce14', '2018-10-29 16:06:04');
INSERT INTO `flow_instruction` VALUES ('680acb9edb5549deb48b5970e3d41560', null, null, null, null, null, 'CONTROLLER', '65535', 'c08e92746a9a447287c43e1375a212e2', '2018-10-29 16:03:00');
INSERT INTO `flow_instruction` VALUES ('685a49711f074090a0de89a6fdf2b3bd', null, null, null, null, null, 'CONTROLLER', '65535', '0e3ca0a2ad6f488090e28c90b85e3360', '2018-10-29 15:42:03');
INSERT INTO `flow_instruction` VALUES ('689f4a3852874ea49d192202b6f1c410', null, null, null, null, null, 'CONTROLLER', '65535', 'e58f648492584ff480fb98bd012647d1', '2018-10-29 16:12:03');
INSERT INTO `flow_instruction` VALUES ('68d3c86af65241678ecd5cd95f747aa6', null, null, null, null, null, 'CONTROLLER', '65535', 'fe6ff2dc5aa34756989e66b7d14971f2', '2018-10-29 15:03:41');
INSERT INTO `flow_instruction` VALUES ('68fbc38ac9084939a890bec99678cdb3', null, null, null, null, null, 'CONTROLLER', '65535', '28c46b633cf64671a4d846a15ff14f90', '2018-10-29 16:00:13');
INSERT INTO `flow_instruction` VALUES ('69218d14af9a4ee6931d8fe7768fa03e', null, null, null, null, null, 'CONTROLLER', '65535', '293d2de8dbee42dd810f38cc726d3568', '2018-10-29 16:06:03');
INSERT INTO `flow_instruction` VALUES ('6aac3c8a15854c37b9c1f900dbd46662', null, null, null, null, null, 'CONTROLLER', '65535', '097fae7cdeb9401fb78a01d730f5c7bb', '2018-10-29 16:00:12');
INSERT INTO `flow_instruction` VALUES ('6b31fdfc9851426ca7ddc0ae87c8b40e', null, null, null, null, null, 'CONTROLLER', '65535', '16fadea0bc7b4a99ba12e71bc292efd1', '2018-10-29 15:45:04');
INSERT INTO `flow_instruction` VALUES ('6bf718b1cad444d6986cbfcbe361bb3d', null, null, null, null, null, 'CONTROLLER', '65535', 'c4cb35d85a534b559dbe2c4dd1577c8f', '2018-10-29 15:30:13');
INSERT INTO `flow_instruction` VALUES ('6c6d14592ff248f18987a6edb0a58e74', null, null, null, null, null, 'CONTROLLER', '65535', '6275f93ca6e848538d8e486245397112', '2018-10-29 15:27:02');
INSERT INTO `flow_instruction` VALUES ('6d4325f70772418babee2d49e88f8b92', null, null, null, null, null, 'CONTROLLER', '65535', '57ebecf10c9b45c8983cb2e2188f217a', '2018-10-29 14:57:07');
INSERT INTO `flow_instruction` VALUES ('6d51df0735644916ac0afe750c7b7c30', null, null, null, null, null, 'CONTROLLER', '65535', '0c3ec99b9ba1499cb0462d3b7c2d391e', '2018-10-29 15:00:11');
INSERT INTO `flow_instruction` VALUES ('6efab12946e04b9fb55488f42881eec1', null, null, null, null, null, 'CONTROLLER', '65535', '7b82ca65a1c3447989142bc3b8726690', '2018-10-29 15:42:02');
INSERT INTO `flow_instruction` VALUES ('6f1bd54131534a80a735728e5f2b3029', null, null, null, null, null, 'CONTROLLER', '65535', '1dcbc3f932d14ff895b4e95419c9db03', '2018-10-29 15:06:07');
INSERT INTO `flow_instruction` VALUES ('6f1d2752779b43be9ad71c6ecd34f3bb', null, null, null, null, null, 'CONTROLLER', '65535', '0d9471f48f434651ac59556f6c81d9e7', '2018-10-29 15:30:10');
INSERT INTO `flow_instruction` VALUES ('705641a18dd54f37a93a0c4adc6eadd1', null, null, null, null, null, 'CONTROLLER', '65535', 'b0b59a9680b84f3595522a78393e7996', '2018-10-29 15:42:01');
INSERT INTO `flow_instruction` VALUES ('70d61e9a505b41699ce94af054c1a332', null, null, null, null, null, 'CONTROLLER', '65535', '6e15dd2fa0234f2ab0372db9e56c535e', '2018-10-29 15:18:00');
INSERT INTO `flow_instruction` VALUES ('7110b10da23047a794acaefeffd04c55', null, null, null, null, null, 'CONTROLLER', '65535', '0b37dd5162a4462ba8469f2e2e0f1b59', '2018-10-29 16:00:14');
INSERT INTO `flow_instruction` VALUES ('712b77cd77a14e088ac5c2616233c7fe', null, null, null, null, null, 'CONTROLLER', '65535', '7d0f9412ada847b6a92ef09918c2ef10', '2018-10-29 15:27:00');
INSERT INTO `flow_instruction` VALUES ('71f844664bc44f74bab15294d48d0129', null, null, null, null, null, 'CONTROLLER', '65535', '6ccf24ce76bb48d1a9f13c714cb61d13', '2018-10-29 15:45:02');
INSERT INTO `flow_instruction` VALUES ('72428df5ab0a4815bc038a2ea5c66e02', null, null, null, null, null, 'CONTROLLER', '65535', '549c9bc2598f4f189a01845ae6484444', '2018-10-29 16:20:35');
INSERT INTO `flow_instruction` VALUES ('7480a67620a4435ca43723eacae0b41a', null, null, null, null, null, 'CONTROLLER', '65535', '023b3c100a8d499c9325500841d9b698', '2018-10-29 16:15:02');
INSERT INTO `flow_instruction` VALUES ('7487e46297db4750973262e6491c78fa', null, null, null, null, null, 'CONTROLLER', '65535', '139623697a47428b8d51f93e3ee2cb02', '2018-10-29 15:06:06');
INSERT INTO `flow_instruction` VALUES ('7573dd51df5743f4968e9397e7f9199d', null, null, null, null, null, 'CONTROLLER', '65535', '7007fd64b4c34cdf97bf6c39b470ae1b', '2018-10-29 15:39:09');
INSERT INTO `flow_instruction` VALUES ('7645d97a358849a39b314ffc8134ee3a', null, null, null, null, null, 'CONTROLLER', '65535', '2828305714204effbc96b864b9b35ae0', '2018-10-29 16:21:02');
INSERT INTO `flow_instruction` VALUES ('76efd5c29709418683e3980d123db888', null, null, null, null, null, 'CONTROLLER', '65535', '705152076acc49e1b94a7d1df00f32d5', '2018-10-29 15:00:10');
INSERT INTO `flow_instruction` VALUES ('77765155d79b40c8a23cff94e7ce8c88', null, null, null, null, null, 'CONTROLLER', '65535', '8126770e454e4a21b59b56b9d0a49fa5', '2018-10-29 16:21:00');
INSERT INTO `flow_instruction` VALUES ('779055314cca4a988fef30f584d3b91f', null, null, null, null, null, 'CONTROLLER', '65535', '54720f0fc22c481fb614859420586426', '2018-10-29 15:15:07');
INSERT INTO `flow_instruction` VALUES ('779682135912413bac0f8d266711de70', null, null, null, null, null, 'CONTROLLER', '65535', 'fe976499a9924ffdae371ba077e321df', '2018-10-29 15:39:10');
INSERT INTO `flow_instruction` VALUES ('77d19695c4534607b14d7e6d3b280d09', null, null, null, null, null, 'CONTROLLER', '65535', '8cefeee1888f4dbb8186e4c0154354b4', '2018-10-29 15:09:03');
INSERT INTO `flow_instruction` VALUES ('79209d0ec8e740cd82ae0c02642108ef', null, null, null, null, null, 'CONTROLLER', '65535', 'f0d6056d447a4530ba80560b100b8ed0', '2018-10-29 16:15:03');
INSERT INTO `flow_instruction` VALUES ('7a937aaf599944d680893a07db0c4c16', null, null, null, null, null, 'CONTROLLER', '65535', 'af74a0945c9a41a08c0b427f6a009d14', '2018-10-29 16:24:02');
INSERT INTO `flow_instruction` VALUES ('7b56059ac83541da9e3a95c3ee3c78e4', null, null, null, null, null, 'CONTROLLER', '65535', '290d53757d8a437e8f48145d06fb911c', '2018-10-29 16:06:03');
INSERT INTO `flow_instruction` VALUES ('7c3bf88ac1e348599eb1db79cfadab9f', null, null, null, null, null, 'CONTROLLER', '65535', 'c9159a6cdfad4de9a1ea0987cac17cc4', '2018-10-29 15:09:05');
INSERT INTO `flow_instruction` VALUES ('7cbbf856e46f48cb90011a2aafd5fc36', null, null, null, null, null, 'CONTROLLER', '65535', '9f84be131758455d848ba2896e544ab9', '2018-10-29 15:54:05');
INSERT INTO `flow_instruction` VALUES ('7cbf457c99064749a1c92c9876512c0d', null, null, null, null, null, 'CONTROLLER', '65535', '403613463ad44793a41a8cbd5f16ba00', '2018-10-29 15:45:03');
INSERT INTO `flow_instruction` VALUES ('7d7bd13247ad44a68983b8cceeb85a7f', null, null, null, null, null, 'CONTROLLER', '65535', '2304bdcdeb564a8a92c47897f749436f', '2018-10-29 16:15:05');
INSERT INTO `flow_instruction` VALUES ('7d9cbc73e27b49f093c18bbb3c01fe63', null, null, null, null, null, 'CONTROLLER', '65535', 'fe2c6459b96b4da59c493c427ae94b16', '2018-10-29 16:09:01');
INSERT INTO `flow_instruction` VALUES ('7e20bd1d90e64ace93245b385890facf', null, null, null, null, null, 'CONTROLLER', '65535', 'd27c0e1726f94e47bceeeb6fcc167fe3', '2018-10-29 15:24:04');
INSERT INTO `flow_instruction` VALUES ('7e687b63fecb4f0389faaf97309b7784', null, null, null, null, null, 'CONTROLLER', '65535', '0b7e99636b664aae9c534ac524ae5e9c', '2018-10-29 15:27:04');
INSERT INTO `flow_instruction` VALUES ('7ec0968faa49487d898aa6f2ec60766b', null, null, null, null, null, 'CONTROLLER', '65535', '58c53fda47b24d1bbbc0ef7c9b234755', '2018-10-29 16:09:04');
INSERT INTO `flow_instruction` VALUES ('7ec7604e38c84b5da42a6b62b91af7ad', null, null, null, null, null, 'CONTROLLER', '65535', 'f4be88fd5f804b8aa910fcc73d5a9931', '2018-10-29 15:54:02');
INSERT INTO `flow_instruction` VALUES ('7fcf62c972094dd880d89b64f9cdb2f0', null, null, null, null, null, 'CONTROLLER', '65535', '9161be61e8a441a4af4ad75901abdb48', '2018-10-29 15:39:09');
INSERT INTO `flow_instruction` VALUES ('80f73c79a5de4133af96cb73cd6af629', null, null, null, null, null, 'CONTROLLER', '65535', '94f369d70f9f4a5fbee380aa25092911', '2018-10-29 16:20:32');
INSERT INTO `flow_instruction` VALUES ('81594422313b450b8a26f21eec282986', null, null, null, null, null, 'CONTROLLER', '65535', 'c4c90d551fb64f60bb14cb09be96e6b3', '2018-10-29 15:24:04');
INSERT INTO `flow_instruction` VALUES ('815d72e053664d8a86e4e9319362ebd1', null, null, null, null, null, 'CONTROLLER', '65535', '2305e3bd42334b619995392957d0f4c6', '2018-10-29 15:18:02');
INSERT INTO `flow_instruction` VALUES ('83ba639431a040a8824dfbd0b718d5e7', null, null, null, null, null, 'CONTROLLER', '65535', '5b33ee561af648999d48d8b922828e17', '2018-10-29 16:09:02');
INSERT INTO `flow_instruction` VALUES ('84d59477550241afaa8b9a2190c9adda', null, null, null, null, null, 'CONTROLLER', '65535', '3f2c2bd344cd4f418f890a586425a656', '2018-10-29 15:33:04');
INSERT INTO `flow_instruction` VALUES ('85530114626c45faae14319a4b9bbfff', null, null, null, null, null, 'CONTROLLER', '65535', 'c2b8a6f6aeae46c78b0863b50cca0055', '2018-10-29 16:00:13');
INSERT INTO `flow_instruction` VALUES ('85e476ab4e7544e28108be42b4766013', null, null, null, null, null, 'CONTROLLER', '65535', '65e4eb42cdbd4cd9a5879c74dd6ba4d7', '2018-10-29 16:20:34');
INSERT INTO `flow_instruction` VALUES ('85f6bcbaf0dc47ba85dd1c388c2f19db', null, null, null, null, null, 'CONTROLLER', '65535', 'd292cfc019de47079fd6bc2b905273c5', '2018-10-29 15:21:05');
INSERT INTO `flow_instruction` VALUES ('8844adb99b7e45e0a7075d2eeaa1914c', null, null, null, null, null, 'CONTROLLER', '65535', '9740baff7f8d49ba9c67807e8241878d', '2018-10-29 15:54:03');
INSERT INTO `flow_instruction` VALUES ('89e9a56e1e6643a4b446f3431373260f', null, null, null, null, null, 'CONTROLLER', '65535', '4684d228349b42a08d735f82c61e8bf3', '2018-10-29 15:33:04');
INSERT INTO `flow_instruction` VALUES ('8bb2138ebc984a4a895f826ec709d223', null, null, null, null, null, 'CONTROLLER', '65535', 'd9625975326e49cc9425a7b4634bf211', '2018-10-29 16:06:01');
INSERT INTO `flow_instruction` VALUES ('8bbb13c1d59b469ba2552f9046a3d4f0', null, null, null, null, null, 'CONTROLLER', '65535', 'b799d348141a4ac186797c9397410dd1', '2018-10-29 14:57:05');
INSERT INTO `flow_instruction` VALUES ('8bddf1f6872f49f293353d289eb0539e', null, null, null, null, null, 'CONTROLLER', '65535', '95a95fff97014f308e7c95529e8aeb83', '2018-10-29 15:03:42');
INSERT INTO `flow_instruction` VALUES ('8bf4040c3d544271991affe65db84b7f', null, null, null, null, null, 'CONTROLLER', '65535', '5d6386685b864c4ba44066764ac5f318', '2018-10-29 15:33:02');
INSERT INTO `flow_instruction` VALUES ('8d528cb6df5947759f4ef3e2cd4ab267', null, null, null, null, null, 'CONTROLLER', '65535', 'eff538698d9d49089b777e8189488a85', '2018-10-29 15:24:04');
INSERT INTO `flow_instruction` VALUES ('8ea60c1ce972489cb8ac3821b6afb90d', null, null, null, null, null, 'CONTROLLER', '65535', '5d4a3d98d3dd41f8955b06e43e6cec97', '2018-10-29 15:12:02');
INSERT INTO `flow_instruction` VALUES ('8eac4c511615486799eea00cc9a15865', null, null, null, null, null, 'CONTROLLER', '65535', 'c21c94893ae349a6b846485346943164', '2018-10-29 15:54:01');
INSERT INTO `flow_instruction` VALUES ('8ee3b02cafbe4b6b815e54d291752e75', null, null, null, null, null, 'CONTROLLER', '65535', '7fee17eda39c49fa904e635964511e8b', '2018-10-29 15:12:03');
INSERT INTO `flow_instruction` VALUES ('8f5f84f6824b4353b71cd40301d4673a', null, null, null, null, null, 'CONTROLLER', '65535', 'b149f64462094c7a8b7c7935252b54b5', '2018-10-29 15:21:02');
INSERT INTO `flow_instruction` VALUES ('90852b27ad434e51a14267f0660c2210', null, null, null, null, null, 'CONTROLLER', '65535', 'efc69ebd060549c08b681e834c99db85', '2018-10-29 14:57:03');
INSERT INTO `flow_instruction` VALUES ('919f00f796c945198041f70abba58eb9', null, null, null, null, null, 'CONTROLLER', '65535', '97fe5c35d4314a5a934d9c6cb354565d', '2018-10-29 16:06:00');
INSERT INTO `flow_instruction` VALUES ('92183fbbe50947e080e34da980845d53', null, null, null, null, null, 'CONTROLLER', '65535', 'ad52d98ce7284a42ae407c5d5df50db4', '2018-10-29 16:15:02');
INSERT INTO `flow_instruction` VALUES ('92275b5990be4917a7473945085db00d', null, null, null, null, null, 'CONTROLLER', '65535', '48c665815e004c69ae5bff334ed33c51', '2018-10-29 16:06:02');
INSERT INTO `flow_instruction` VALUES ('9232add6125b471bb644e2a2e29b8da0', null, null, null, null, null, 'CONTROLLER', '65535', '2c7b167facdc4bb8b6139e30a9523f3a', '2018-10-29 16:12:02');
INSERT INTO `flow_instruction` VALUES ('9331836ea4a9447b92e9c5b5a3ffe588', null, null, null, null, null, 'CONTROLLER', '65535', '5543363057124f5ba12df3b8d1e3a5db', '2018-10-29 16:24:04');
INSERT INTO `flow_instruction` VALUES ('9378d20b162c4265bec9f4f876e363fd', null, null, null, null, null, 'CONTROLLER', '65535', 'd5b7a1fdb6b344faa4cacd27c6f5d84e', '2018-10-29 16:09:05');
INSERT INTO `flow_instruction` VALUES ('93e0e9c45e0d4f859d5425dbc0dd172d', null, null, null, null, null, 'CONTROLLER', '65535', '32e684585ce0452b93402e7189a3ccbd', '2018-10-29 15:06:04');
INSERT INTO `flow_instruction` VALUES ('95d9b7c32200476e9bfedf0b2826e0df', null, null, null, null, null, 'CONTROLLER', '65535', '16207fb2f9f44330b4674197a8942f1c', '2018-10-29 15:03:40');
INSERT INTO `flow_instruction` VALUES ('96de785882df4431a48e6ed3f7ae259f', null, null, null, null, null, 'CONTROLLER', '65535', '33e0b2ffc9cf452ebbc878417007f5f5', '2018-10-29 16:24:01');
INSERT INTO `flow_instruction` VALUES ('979552b7738a44d7b7395f36d0ac1f44', null, null, null, null, null, 'CONTROLLER', '65535', '143f3639340e4c8cae5630a194778e65', '2018-10-29 15:33:01');
INSERT INTO `flow_instruction` VALUES ('97a20759bd284fe8a9a00116ecbcbf62', null, null, null, null, null, 'CONTROLLER', '65535', 'a9a8cf88bb3448c68669e11443ebd73d', '2018-10-29 15:09:01');
INSERT INTO `flow_instruction` VALUES ('98505fa368cd4075b5efb6c91a6fd744', null, null, null, null, null, 'CONTROLLER', '65535', '2fcdad79929142c6bfed8d77c3cd20fc', '2018-10-29 15:18:01');
INSERT INTO `flow_instruction` VALUES ('98af668ac5304ae59ad53bff66122518', null, null, null, null, null, 'CONTROLLER', '65535', '44bbed993212498897902a2f2dcf3890', '2018-10-29 16:20:33');
INSERT INTO `flow_instruction` VALUES ('990c55dc6c47497181572604b016b6a1', null, null, null, null, null, 'CONTROLLER', '65535', '4978de6f6bd54b52b7a343343e870b71', '2018-10-29 15:15:05');
INSERT INTO `flow_instruction` VALUES ('992dc633aad54821a55527a0a2e1355d', null, null, null, null, null, 'CONTROLLER', '65535', '7147e6227a974a2784afbc298ab73e47', '2018-10-29 15:03:44');
INSERT INTO `flow_instruction` VALUES ('997bf4d9f994443dbb5c3fb75c201ca3', null, null, null, null, null, 'CONTROLLER', '65535', 'a17883a222724b4ba8440df18a0b4d8c', '2018-10-29 15:24:03');
INSERT INTO `flow_instruction` VALUES ('99f7664f3dd34f828164d42a4990edca', null, null, null, null, null, 'CONTROLLER', '65535', '666d4bbc57d143a09915bac7530ddcd9', '2018-10-29 15:15:04');
INSERT INTO `flow_instruction` VALUES ('9a86ae06df8d44c7b3d3b3870aed4032', null, null, null, null, null, 'CONTROLLER', '65535', '1c19552ec5f34a80820ab3140d8eb61d', '2018-10-29 16:03:04');
INSERT INTO `flow_instruction` VALUES ('9aa5cc99a87c47b1acf832aae11df035', null, null, null, null, null, 'CONTROLLER', '65535', 'e2cade58143941bcb2f1546e402ce2eb', '2018-10-29 16:15:05');
INSERT INTO `flow_instruction` VALUES ('9b657674a0e549b79ebac286e7d9ab8b', null, null, null, null, null, 'CONTROLLER', '65535', 'f7ef11f17c79402eaf05355f16f78b34', '2018-10-29 15:06:08');
INSERT INTO `flow_instruction` VALUES ('9e44a50d8fec41ff8e4a7861067ff8ea', null, null, null, null, null, 'CONTROLLER', '65535', '5d8419e68a244929bd4e10170baa0f83', '2018-10-29 16:12:05');
INSERT INTO `flow_instruction` VALUES ('9ed5bfd1b95b414fb9d3200a9aa26d10', null, null, null, null, null, 'CONTROLLER', '65535', '483266d74994407898e1c88e9598cea8', '2018-10-29 15:09:02');
INSERT INTO `flow_instruction` VALUES ('9fbe4693bef94e729c3a8b1d9c4767fb', null, null, null, null, null, 'CONTROLLER', '65535', 'c06d463139844e83b203fd6d2df29464', '2018-10-29 15:18:05');
INSERT INTO `flow_instruction` VALUES ('a02f866330f54ce6894fc2ebdf783ca6', null, null, null, null, null, 'CONTROLLER', '65535', '940aa9529f66439da5a050c28b3f8886', '2018-10-29 06:03:01');
INSERT INTO `flow_instruction` VALUES ('a13020ed5ac540cd857df9bc270701bb', null, null, null, null, null, 'CONTROLLER', '65535', '34cc5e4826d948e785454df95a42c866', '2018-10-29 15:03:40');
INSERT INTO `flow_instruction` VALUES ('a1359d27f32447f99dfb4ae2b5c49341', null, null, null, null, null, 'CONTROLLER', '65535', '1378a6feb08c48cfbca63da948944168', '2018-10-29 16:24:03');
INSERT INTO `flow_instruction` VALUES ('a1b287b37fe4438a8927100a05b6c201', null, null, null, null, null, 'CONTROLLER', '65535', '3fdd57cc08cb4c89b3da6d87c13cd4be', '2018-10-29 15:45:02');
INSERT INTO `flow_instruction` VALUES ('a1d8a240c91846989aaaa7289758bc91', null, null, null, null, null, 'CONTROLLER', '65535', 'df888da3ad2a493c903e2fb41b155bc5', '2018-10-29 15:09:04');
INSERT INTO `flow_instruction` VALUES ('a2095e47f5114d66aca0711a01e7b96c', null, null, null, null, null, 'CONTROLLER', '65535', 'fec0904844ab498ab621d6f88d0793fc', '2018-10-29 15:00:10');
INSERT INTO `flow_instruction` VALUES ('a238ed9e55a944b88a7db16badff48ff', null, null, null, null, null, 'CONTROLLER', '65535', '2ff2b50ac71a494fb982a2d02ee368e2', '2018-10-29 15:15:06');
INSERT INTO `flow_instruction` VALUES ('a272abcf668644e19dc05cc86344cde8', null, null, null, null, null, 'CONTROLLER', '65535', 'b9816c9ec4ba46478cb8483366705c53', '2018-10-29 16:15:01');
INSERT INTO `flow_instruction` VALUES ('a2784ed37aba42f1acdcb47244d7a250', null, null, null, null, null, 'CONTROLLER', '65535', '116980eef3b64c91aeedd9393bf932a0', '2018-10-29 15:12:02');
INSERT INTO `flow_instruction` VALUES ('a39bd6520e134323862708c09741a382', null, null, null, null, null, 'CONTROLLER', '65535', '92ca91c978d54c6b9ab6d714482c75f0', '2018-10-29 16:24:02');
INSERT INTO `flow_instruction` VALUES ('a3c2412650c64920aabeac5829c24138', null, null, null, null, null, 'CONTROLLER', '65535', '858ce9c5631348688f916ef4864d42f1', '2018-10-29 15:18:04');
INSERT INTO `flow_instruction` VALUES ('a46beacfd2b04d3f8c4c8670b7d37ebe', null, null, null, null, null, 'CONTROLLER', '65535', 'c6f40652ae0146099fe80a4ed0a54105', '2018-10-29 15:30:09');
INSERT INTO `flow_instruction` VALUES ('a55b9966acc84089ae76c7d4e4473674', null, null, null, null, null, 'CONTROLLER', '65535', 'c37b6b1ff13f40e18fe7e198f6e27d5d', '2018-10-29 15:00:11');
INSERT INTO `flow_instruction` VALUES ('a5826a14dac64a219a08d8899131b725', null, null, null, null, null, 'CONTROLLER', '65535', 'efa13994d6bd4f30adb1977e0d288365', '2018-10-29 15:27:03');
INSERT INTO `flow_instruction` VALUES ('a59a7a7910f84f48983e23857db21806', null, null, null, null, null, 'CONTROLLER', '65535', '9fdbecf5fab147d0acb3a3da9fb99601', '2018-10-29 15:45:05');
INSERT INTO `flow_instruction` VALUES ('a6ce2998dd70445fa5155c055ad65b05', null, null, null, null, null, 'CONTROLLER', '65535', '714129c7c74a49fabd62d0cadc5a83c7', '2018-10-29 15:18:03');
INSERT INTO `flow_instruction` VALUES ('a712a4b9aba84745973c70563bbb6a1e', null, null, null, null, null, 'CONTROLLER', '65535', 'e39a0fd9cda34709b38296f5dd763b70', '2018-10-29 15:21:05');
INSERT INTO `flow_instruction` VALUES ('a75de7c6283a471981191ea6179b14e0', null, null, null, null, null, 'CONTROLLER', '65535', 'f13707e7cc6443e480d07dd861581cbb', '2018-10-29 15:18:04');
INSERT INTO `flow_instruction` VALUES ('a8f36bc4a9d243c4ab1185e0016bc831', null, null, null, null, null, 'CONTROLLER', '65535', '0ed6189733094e4dad2d6a648bfcd444', '2018-10-29 16:06:04');
INSERT INTO `flow_instruction` VALUES ('a98dad53a0af4a1c87352955c5e198ff', null, null, null, null, null, 'CONTROLLER', '65535', 'b738f77a1c4a40a897c34fd02a73609a', '2018-10-29 16:03:03');
INSERT INTO `flow_instruction` VALUES ('a9c3243d15e4417eacc21117bc59656d', null, null, null, null, null, 'CONTROLLER', '65535', '6a51aa2914044b64b2af1236fe3db35c', '2018-10-29 15:54:03');
INSERT INTO `flow_instruction` VALUES ('a9f090c8ca3141c0a97f143077127b1c', null, null, null, null, null, 'CONTROLLER', '65535', 'd163f6b0f5134bb69ec9ac744d9abe12', '2018-10-29 16:12:02');
INSERT INTO `flow_instruction` VALUES ('aa9a1f65bd5a431d9b36cfe981065faa', null, null, null, null, null, 'CONTROLLER', '65535', '418e0d5b23174a2c80be5e3895d27b88', '2018-10-29 15:42:05');
INSERT INTO `flow_instruction` VALUES ('abc747aa4b70408487073052371d82a5', null, null, null, null, null, 'CONTROLLER', '65535', 'c6a5110c156d48ff8dfefc2468bb8d0e', '2018-10-29 15:27:01');
INSERT INTO `flow_instruction` VALUES ('afaacfad320b41eea3d87c946f57bd2f', null, null, null, null, null, 'CONTROLLER', '65535', '73f43c4d2f894dd19fda297f2e26c109', '2018-10-29 15:03:42');
INSERT INTO `flow_instruction` VALUES ('b06247fbf1d84981b21693a25779e917', null, null, null, null, null, 'CONTROLLER', '65535', '96e4d4154c964b6193d4ece2221203be', '2018-10-29 15:45:04');
INSERT INTO `flow_instruction` VALUES ('b1c05e26eb52458baa7350741740f408', null, null, null, null, null, 'CONTROLLER', '65535', 'c3f5ea9380194359bf53439f19186246', '2018-10-29 06:03:03');
INSERT INTO `flow_instruction` VALUES ('b27ac40d55914a38a49d52324e3ba297', null, null, null, null, null, 'CONTROLLER', '65535', '0cffdc2f77d24a61a61370ee3c4ff27f', '2018-10-29 15:42:03');
INSERT INTO `flow_instruction` VALUES ('b33bd9e7826b4972842b7b6d62bdb8e3', null, null, null, null, null, 'CONTROLLER', '65535', 'be44de0e08144fa3946113cfe19d9ed2', '2018-10-29 15:45:04');
INSERT INTO `flow_instruction` VALUES ('b4693d3cebd744e39d300f591d9990ba', null, null, null, null, null, 'CONTROLLER', '65535', 'e4caab322a854f8e9cda557eb8d74bbb', '2018-10-29 16:20:33');
INSERT INTO `flow_instruction` VALUES ('b86d8adb45954015834e944e9e52644a', null, null, null, null, null, 'CONTROLLER', '65535', '1987efe00edc4fa88ef8921a0976ced0', '2018-10-29 16:21:02');
INSERT INTO `flow_instruction` VALUES ('b97a2f7a7fed4d18b3ab73a782280a1b', null, null, null, null, null, 'CONTROLLER', '65535', '5377f5a24fbd4f10b9a748b239600bc3', '2018-10-29 15:27:05');
INSERT INTO `flow_instruction` VALUES ('b9a25f42a23e4da4a5fff15eeffdde71', null, null, null, null, null, 'CONTROLLER', '65535', 'bed22725a5a84a2095f2db0511dd0e6f', '2018-10-29 16:06:02');
INSERT INTO `flow_instruction` VALUES ('bace5c4ed87b4daba758b6930da80115', null, null, null, null, null, 'CONTROLLER', '65535', '735338ea07ca46d09629f03be380fc34', '2018-10-29 15:09:04');
INSERT INTO `flow_instruction` VALUES ('bbcbc3eae517465d8712e2b3afc2aadb', null, null, null, null, null, 'CONTROLLER', '65535', 'bad2aa08c6f7400c87b5558835d6cb87', '2018-10-29 15:15:06');
INSERT INTO `flow_instruction` VALUES ('bc5c60fd66314ab595d21dff67086968', null, null, null, null, null, 'CONTROLLER', '65535', '8abf0087a0074b4e820788b7b0eddfbf', '2018-10-29 15:12:03');
INSERT INTO `flow_instruction` VALUES ('bd937bdc113840eca1271bf48d1c0b34', null, null, null, null, null, 'CONTROLLER', '65535', '408e12d7aa5748829b950137e7fcd139', '2018-10-29 15:27:03');
INSERT INTO `flow_instruction` VALUES ('beb81683c4fa4fbcbcd02e821aabd321', null, null, null, null, null, 'CONTROLLER', '65535', 'c73f4fc5e34f40dcb1b211d9f8e87c4d', '2018-10-29 16:09:05');
INSERT INTO `flow_instruction` VALUES ('bf19eb36bfe54f909fca794b0f61b842', null, null, null, null, null, 'CONTROLLER', '65535', '99749d8fd271411eb92d51b00bfc11e0', '2018-10-29 16:09:01');
INSERT INTO `flow_instruction` VALUES ('bf1c1ad5d82a4d26a11798e11d153c74', null, null, null, null, null, 'CONTROLLER', '65535', 'e38a9e47c57445229e2237890c554afa', '2018-10-29 14:57:07');
INSERT INTO `flow_instruction` VALUES ('bf7bbc785fe54ddbb58ec4448fe249a2', null, null, null, null, null, 'CONTROLLER', '65535', '627b0e2943ef40dfa57ea9e58f768094', '2018-10-29 15:09:06');
INSERT INTO `flow_instruction` VALUES ('c006fad6577f42a5b1135b10688aacce', null, null, null, null, null, 'CONTROLLER', '65535', 'b744f74361194a2faf8203f7ca6b9e51', '2018-10-29 06:03:03');
INSERT INTO `flow_instruction` VALUES ('c0101174cfd54f8bbefba257e599d0e5', null, null, null, null, null, 'CONTROLLER', '65535', '6202710a104d47089c703a084782bb4e', '2018-10-29 15:42:04');
INSERT INTO `flow_instruction` VALUES ('c016ee2da36c4142ad28ca4cea1871ea', null, null, null, null, null, 'CONTROLLER', '65535', '01ec0d3bf2ed44bc974d22f562e1acc0', '2018-10-29 15:39:07');
INSERT INTO `flow_instruction` VALUES ('c040d9284f0243d395ddbeebcbd34a69', null, null, null, null, null, 'CONTROLLER', '65535', '08afe1f181da4701bc801ab56cf02925', '2018-10-29 15:06:05');
INSERT INTO `flow_instruction` VALUES ('c1458bed44624150993f21423604d962', null, null, null, null, null, 'CONTROLLER', '65535', '722069472c7348d7a70ce8b58608a17a', '2018-10-29 15:42:02');
INSERT INTO `flow_instruction` VALUES ('c1e3938968cb47b6990dfe992a08c20b', null, null, null, null, null, 'CONTROLLER', '65535', '42f8d89c31b84539a4721e55983c53da', '2018-10-29 15:45:03');
INSERT INTO `flow_instruction` VALUES ('c1f5a9f8f64b41ccb6a545a1e8d8ee41', null, null, null, null, null, 'CONTROLLER', '65535', '05ac00da9b5e472e82a091b5e6adf699', '2018-10-29 15:03:41');
INSERT INTO `flow_instruction` VALUES ('c1ff414481594dc3a7f613afffdf42bd', null, null, null, null, null, 'CONTROLLER', '65535', '8781e942f5364d7ba20cae2a9da3ff1e', '2018-10-29 15:39:08');
INSERT INTO `flow_instruction` VALUES ('c2619870d6b5478096101b73f9871c80', null, null, null, null, null, 'CONTROLLER', '65535', 'fe264e32255a4f5c956feaf10cfac14e', '2018-10-29 16:06:02');
INSERT INTO `flow_instruction` VALUES ('c2ab0c443cc54b7b9d18a1dc570eddea', null, null, null, null, null, 'CONTROLLER', '65535', '91f84d1a21ae483089517af70c7957d1', '2018-10-29 15:09:06');
INSERT INTO `flow_instruction` VALUES ('c2eea6299f9544f598c3a845727e01bf', null, null, null, null, null, 'CONTROLLER', '65535', '88883c2e6ba7477381db07908591a001', '2018-10-29 15:39:10');
INSERT INTO `flow_instruction` VALUES ('c429228623054584b172ce1c85f126a3', null, null, null, null, null, 'CONTROLLER', '65535', '587bc371c1c14a45a9eccfbc49b3e5e8', '2018-10-29 15:18:01');
INSERT INTO `flow_instruction` VALUES ('c5004979272546029d2ed6021d1eb4eb', null, null, null, null, null, 'CONTROLLER', '65535', '96f6048d0a434fae8f9420b7ab5ed4e3', '2018-10-29 16:09:01');
INSERT INTO `flow_instruction` VALUES ('c5a8dc6b37d746ef82fd43809522e4d4', null, null, null, null, null, 'CONTROLLER', '65535', '3dce1a62c2bf46c4806c8de15207b683', '2018-10-29 15:24:03');
INSERT INTO `flow_instruction` VALUES ('c5f0e2787789454f99eabc7a6f7626ce', null, null, null, null, null, 'CONTROLLER', '65535', 'f74d663403e64b5daa720ad1b70cc480', '2018-10-29 15:15:05');
INSERT INTO `flow_instruction` VALUES ('c83721307fc542ea928288ee64e7f7c9', null, null, null, null, null, 'CONTROLLER', '65535', 'a6c4f0964b904153b35af5eb0b82bc55', '2018-10-29 15:18:02');
INSERT INTO `flow_instruction` VALUES ('c841b00281f7499cb3ab28332bfc9cd8', null, null, null, null, null, 'CONTROLLER', '65535', 'beb6b837577a462981364e68db9caf50', '2018-10-29 16:03:02');
INSERT INTO `flow_instruction` VALUES ('c89910ea481444a1bb7b3fd23800988d', null, null, null, null, null, 'CONTROLLER', '65535', '48cc95c109e54e33963ade438bc803f9', '2018-10-29 15:30:11');
INSERT INTO `flow_instruction` VALUES ('c8e2e395895143c78698fc960e956244', null, null, null, null, null, 'CONTROLLER', '65535', '1f8bc62dc1ad4815aceff311ea2a46fe', '2018-10-29 15:54:02');
INSERT INTO `flow_instruction` VALUES ('c91488872746400dbe91ca8ffe621406', null, null, null, null, null, 'CONTROLLER', '65535', 'fd10ea14175a453b9593cd725040e19e', '2018-10-29 15:03:43');
INSERT INTO `flow_instruction` VALUES ('c95d1f327b3244a0a2851f0af7e8cff1', null, null, null, null, null, 'CONTROLLER', '65535', 'c4b5a349f8804cc8b4401da71d8ad3b8', '2018-10-29 06:03:02');
INSERT INTO `flow_instruction` VALUES ('c9a274b75b964bfa9db4c1f9a8908700', null, null, null, null, null, 'CONTROLLER', '65535', '0556d3c7f8ce464eb2852d6b9e4d250a', '2018-10-29 16:20:33');
INSERT INTO `flow_instruction` VALUES ('c9ba1a4f585343459dbcd290c30bfaa8', null, null, null, null, null, 'CONTROLLER', '65535', '46c19a61ce91437ca5fcf56ead1b312e', '2018-10-29 15:12:02');
INSERT INTO `flow_instruction` VALUES ('c9de609da2814ab592c7aacfeb14cf5b', null, null, null, null, null, 'CONTROLLER', '65535', 'bbeef592d6a040a2b51fcf5e2b0cdf44', '2018-10-29 16:21:05');
INSERT INTO `flow_instruction` VALUES ('cb4716845d154867b069a130a554a0f1', null, null, null, null, null, 'CONTROLLER', '65535', '92abb7c4e623492db673cffe1018f06c', '2018-10-29 14:57:04');
INSERT INTO `flow_instruction` VALUES ('cbedc6ee92ca46289c7c655b79205aaa', null, null, null, null, null, 'CONTROLLER', '65535', '55bd0527ab97410b932533af4371a690', '2018-10-29 15:42:01');
INSERT INTO `flow_instruction` VALUES ('cd326fabc2cc4d7e91bd67b63bd0e459', null, null, null, null, null, 'CONTROLLER', '65535', 'e07f1d0645894c2d8f49544d1c1064cf', '2018-10-29 16:15:01');
INSERT INTO `flow_instruction` VALUES ('cd54509b55834ca19252c8c756e379f5', null, null, null, null, null, 'CONTROLLER', '65535', '1bee58f15dea4771826e68c4be4d6e5a', '2018-10-29 16:09:04');
INSERT INTO `flow_instruction` VALUES ('cdbf04eedf26484e920d760fb222052f', null, null, null, null, null, 'CONTROLLER', '65535', 'c5ce26960432417bb679a67288b937ce', '2018-10-29 15:21:02');
INSERT INTO `flow_instruction` VALUES ('cecdd3f97bb9473788564557cf522551', null, null, null, null, null, 'CONTROLLER', '65535', '487a9a18ef884710a24c5e7d0625b929', '2018-10-29 06:03:01');
INSERT INTO `flow_instruction` VALUES ('cecf8665f3444832b2a7b80d9f50c28a', null, null, null, null, null, 'CONTROLLER', '65535', 'd54bb025196d4ee29ddbcb8148061919', '2018-10-29 15:00:12');
INSERT INTO `flow_instruction` VALUES ('ced3c8dcd6124465b50b467ece3dca63', null, null, null, null, null, 'CONTROLLER', '65535', '47c22d495ecc40e1b8a7c71d609d7281', '2018-10-29 15:54:01');
INSERT INTO `flow_instruction` VALUES ('cf6111ac7f7a447c8615e643f5c53133', null, null, null, null, null, 'CONTROLLER', '65535', 'ea0b31c0cabd4b62a4baec810090fbf0', '2018-10-29 15:21:03');
INSERT INTO `flow_instruction` VALUES ('cf6c09d7b8414bea9a162b3ca9d58aa2', null, null, null, null, null, 'CONTROLLER', '65535', 'dc4ca33fe9ce4e1d858903538f090385', '2018-10-29 15:45:02');
INSERT INTO `flow_instruction` VALUES ('cf8cb55bf4e242fbb17ee87e2d66d109', null, null, null, null, null, 'CONTROLLER', '65535', '0ab5a75370a2457690195ec6ee1c6da9', '2018-10-29 15:54:05');
INSERT INTO `flow_instruction` VALUES ('cffb63cd2e554f3c83e0a8facb16fe22', null, null, null, null, null, 'CONTROLLER', '65535', 'c3122eb8a7434d4e800701db8d26d66e', '2018-10-29 15:06:08');
INSERT INTO `flow_instruction` VALUES ('d10590f50efe49909aeb547ccc5b1ee2', null, null, null, null, null, 'CONTROLLER', '65535', '9e08ec5b2eae4bc6a2b013ebd24eb7ac', '2018-10-29 16:09:02');
INSERT INTO `flow_instruction` VALUES ('d16341bee396400b9a87dd7682f7e31b', null, null, null, null, null, 'CONTROLLER', '65535', '11e93658e3ac4ccc973d94bb38d73a7c', '2018-10-29 15:00:14');
INSERT INTO `flow_instruction` VALUES ('d1ba74950b3742aaa74c932df4eaa53e', null, null, null, null, null, 'CONTROLLER', '65535', '332265cb23424d0991f5f5244028a0ec', '2018-10-29 15:30:10');
INSERT INTO `flow_instruction` VALUES ('d21b202745294ef1ac6ece7d03e4811b', null, null, null, null, null, 'CONTROLLER', '65535', '66b45095382848d2a0502dc6726d6256', '2018-10-29 15:33:02');
INSERT INTO `flow_instruction` VALUES ('d350c5c719e84ce8ae8cd7b6b04033fa', null, null, null, null, null, 'CONTROLLER', '65535', '2dca7d85a90543dd8edff0e4551859bf', '2018-10-29 15:12:06');
INSERT INTO `flow_instruction` VALUES ('d40c93b99b9f4673935a6c5c026c7721', null, null, null, null, null, 'CONTROLLER', '65535', '70d552bcf3ca4afa9a21236c384b2750', '2018-10-29 15:30:09');
INSERT INTO `flow_instruction` VALUES ('d4240b870b7a478c9f048e44fcc8ddb8', null, null, null, null, null, 'CONTROLLER', '65535', '709227cc51934f5cb807560832dcadaa', '2018-10-29 16:15:04');
INSERT INTO `flow_instruction` VALUES ('d4ee69abcc724d6eb143ca43c1b2f909', null, null, null, null, null, 'CONTROLLER', '65535', 'd64d3eb6eb2847a9b01a0c177efa4757', '2018-10-29 14:57:04');
INSERT INTO `flow_instruction` VALUES ('d606e96205434d17869b33ca19e89283', null, null, null, null, null, 'CONTROLLER', '65535', '0b22efb2e84a4a388d500c4d2f004634', '2018-10-29 15:27:01');
INSERT INTO `flow_instruction` VALUES ('d6a2eae156854ed48b6365fc92da7b69', null, null, null, null, null, 'CONTROLLER', '65535', 'd921871961af4022950a356be723d994', '2018-10-29 06:03:01');
INSERT INTO `flow_instruction` VALUES ('d897130ea0f6493f83dd0749cd02b77b', null, null, null, null, null, 'CONTROLLER', '65535', '6851756cf11049f2a61fbf75474308d9', '2018-10-29 15:15:04');
INSERT INTO `flow_instruction` VALUES ('d8b7c016a4614d3e8742da5b085e9546', null, null, null, null, null, 'CONTROLLER', '65535', '4a18bd31650f488eba30d76a22208d2a', '2018-10-29 16:09:03');
INSERT INTO `flow_instruction` VALUES ('d8cc431dfc874ce497ed13990fcd4eea', null, null, null, null, null, 'CONTROLLER', '65535', '1ffe8786d45647c6b868bbcd6c18b31f', '2018-10-29 16:24:03');
INSERT INTO `flow_instruction` VALUES ('dccf77f1eab04baea70ad1f860173ca1', null, null, null, null, null, 'CONTROLLER', '65535', '6d48b5807e204614aa45fd7324a52ddc', '2018-10-29 16:06:01');
INSERT INTO `flow_instruction` VALUES ('de2e34eea52448599461043cd5595b3b', null, null, null, null, null, 'CONTROLLER', '65535', 'f8884aa427eb4692b3bbc4e2610945d9', '2018-10-29 15:21:01');
INSERT INTO `flow_instruction` VALUES ('de34ca89d0744d4f9b8615f445efab59', null, null, null, null, null, 'CONTROLLER', '65535', '0c3809596fca4e49833b966c7368c8a0', '2018-10-29 06:03:01');
INSERT INTO `flow_instruction` VALUES ('de633056832e4c77927e967182871f0b', null, null, null, null, null, 'CONTROLLER', '65535', 'bf7e779e0dd84c17bb7b05913f97c45f', '2018-10-29 16:12:01');
INSERT INTO `flow_instruction` VALUES ('deb00646d80e4ee79dc2091ca252f79e', null, null, null, null, null, 'CONTROLLER', '65535', 'af19ce8c210f4d45b9dfcc9423269ab6', '2018-10-29 15:27:02');
INSERT INTO `flow_instruction` VALUES ('dedfed8629dd44ddbadb094d7886bf47', null, null, null, null, null, 'CONTROLLER', '65535', '646d22cd716b4b16bf6f90d89ec4099d', '2018-10-29 16:20:32');
INSERT INTO `flow_instruction` VALUES ('df2d664ee2394dd9a89fce921734e062', null, null, null, null, null, 'CONTROLLER', '65535', 'd15a6de645654cd8b09cf5a5c733211f', '2018-10-29 15:21:00');
INSERT INTO `flow_instruction` VALUES ('e017b4397fee4ba28a0a30d083f83155', null, null, null, null, null, 'CONTROLLER', '65535', 'd2bfc153415b4489834faf4746509f41', '2018-10-29 15:54:01');
INSERT INTO `flow_instruction` VALUES ('e03849e6bbaa497ba7cd89caa53673b4', null, null, null, null, null, 'CONTROLLER', '65535', 'dc8488849be543f7b82cd1f18ff476c3', '2018-10-29 15:03:43');
INSERT INTO `flow_instruction` VALUES ('e0aebd9ead3746d1a0f7a242afd21457', null, null, null, null, null, 'CONTROLLER', '65535', '2da92373209c4461b8ed625110cc994f', '2018-10-29 16:24:01');
INSERT INTO `flow_instruction` VALUES ('e12f8a6e0a344a69a99f09d109b5eb43', null, null, null, null, null, 'CONTROLLER', '65535', 'b3e6da653980430795628300d8b944e7', '2018-10-29 16:03:02');
INSERT INTO `flow_instruction` VALUES ('e29248e52abd4ab19015255751c0d27c', null, null, null, null, null, 'CONTROLLER', '65535', '82cbbf89c1fb46119b36214ec07afb2b', '2018-10-29 15:30:12');
INSERT INTO `flow_instruction` VALUES ('e340080a8b964fc7bfabfb7ec3ef2d4d', null, null, null, null, null, 'CONTROLLER', '65535', '6bfd2424c81243e9b672bc2ef727b2f1', '2018-10-29 16:21:04');
INSERT INTO `flow_instruction` VALUES ('e3c524e83df74ecba28e5415e91ffaa0', null, null, null, null, null, 'CONTROLLER', '65535', '738620792f834c9cbb2a6a241dd6b64a', '2018-10-29 16:24:01');
INSERT INTO `flow_instruction` VALUES ('e408753236684523a39693849d0594e1', null, null, null, null, null, 'CONTROLLER', '65535', 'cf487065d8f94383a30f9e73c6b894df', '2018-10-29 15:24:01');
INSERT INTO `flow_instruction` VALUES ('e4b3725a1f45444ca4062db618fe5b30', null, null, null, null, null, 'CONTROLLER', '65535', '9b2ff9bcd0cf4b1b808170c86bfd4e5d', '2018-10-29 16:00:11');
INSERT INTO `flow_instruction` VALUES ('e4e49315a2374316aa8817ad8fcdc964', null, null, null, null, null, 'CONTROLLER', '65535', '3f9a25658dd54794838cbe09b014289c', '2018-10-29 15:21:04');
INSERT INTO `flow_instruction` VALUES ('e715b1d8086a41a5baaedcdd02cb37d3', null, null, null, null, null, 'CONTROLLER', '65535', '790b042de7a34987897ce74fe6cb9b64', '2018-10-29 15:30:08');
INSERT INTO `flow_instruction` VALUES ('e7195fdca1bf45f99a7935e9389054b2', null, null, null, null, null, 'CONTROLLER', '65535', 'ef819a64746e4c4bb295efa54ec5bc1b', '2018-10-29 15:12:01');
INSERT INTO `flow_instruction` VALUES ('e71bf594151b4b9eab9ea28308ab76f0', null, null, null, null, null, 'CONTROLLER', '65535', '0bf2680f6997441ba3ed6b8ba728997d', '2018-10-29 16:12:03');
INSERT INTO `flow_instruction` VALUES ('e80346b479f045358705f69816883833', null, null, null, null, null, 'CONTROLLER', '65535', 'd0d809fc82504f7dbce4b18673081af0', '2018-10-29 15:06:07');
INSERT INTO `flow_instruction` VALUES ('e8b063da7bab4c38aaa498de79407b98', null, null, null, null, null, 'CONTROLLER', '65535', '258e8c1c0e164b2a92c5059c3c98eb3c', '2018-10-29 16:00:12');
INSERT INTO `flow_instruction` VALUES ('e8b98a3e2e01488f876ee3039a7369e6', null, null, null, null, null, 'CONTROLLER', '65535', 'ddc3bcac5cee4719848778194fc7ed46', '2018-10-29 06:03:03');
INSERT INTO `flow_instruction` VALUES ('e8c6445a098545679909a70189bcefd9', null, null, null, null, null, 'CONTROLLER', '65535', '382425a871b945bc9e526992d4730354', '2018-10-29 15:09:03');
INSERT INTO `flow_instruction` VALUES ('e8e1f79b982f4ee99defc0a593fdddf4', null, null, null, null, null, 'CONTROLLER', '65535', '40ca7e93da7440b183bd7a5dc1560469', '2018-10-29 15:00:13');
INSERT INTO `flow_instruction` VALUES ('e933cb70a13f40419cbfbb26dc0a19be', null, null, null, null, null, 'CONTROLLER', '65535', 'aafd08d85f144e46932ace5c775563c5', '2018-10-29 15:12:04');
INSERT INTO `flow_instruction` VALUES ('e9fbea797c1e4187a7494a304e4e21d8', null, null, null, null, null, 'CONTROLLER', '65535', '1dd14c61331e497ab049b9f5fa2d0232', '2018-10-29 15:45:05');
INSERT INTO `flow_instruction` VALUES ('eae6f3019d4c4440986f9c945537d661', null, null, null, null, null, 'CONTROLLER', '65535', 'b830d9193aeb41a0a4c1535d91dc0f5f', '2018-10-29 16:09:04');
INSERT INTO `flow_instruction` VALUES ('eb4694f2383344209794faf0c06a9a68', null, null, null, null, null, 'CONTROLLER', '65535', '85f088acdb5e412ba365c28b3f695ecb', '2018-10-29 15:12:05');
INSERT INTO `flow_instruction` VALUES ('ec12fb0fc52e47ac9ab73c3183524207', null, null, null, null, null, 'CONTROLLER', '65535', 'a8651aa005a94125a78452be2e1a852f', '2018-10-29 15:27:04');
INSERT INTO `flow_instruction` VALUES ('eca4ffc81e114acba36ea0c750631ddd', null, null, null, null, null, 'CONTROLLER', '65535', 'aa8d233eff044e93bf77f7a1287b2c3d', '2018-10-29 15:18:03');
INSERT INTO `flow_instruction` VALUES ('ed3cc61f7074442b9f7879e710a8ceec', null, null, null, null, null, 'CONTROLLER', '65535', 'd253b88298b04271ae022eb67145fbc3', '2018-10-29 16:03:05');
INSERT INTO `flow_instruction` VALUES ('ee5048e2e797409d93e935903e6eebcf', null, null, null, null, null, 'CONTROLLER', '65535', '1f4156aeb9fc4d33a16fd0fb33259314', '2018-10-29 15:27:01');
INSERT INTO `flow_instruction` VALUES ('eee5cc8670dc43fa96c87f5e66091b1e', null, null, null, null, null, 'CONTROLLER', '65535', 'f37dbee33a1f44169537a77cb80c3a61', '2018-10-29 15:09:05');
INSERT INTO `flow_instruction` VALUES ('ef08865f7f1a485a9039822ce60d4453', null, null, null, null, null, 'CONTROLLER', '65535', '86fb9db523784d639392cfc5ed1f582a', '2018-10-29 15:24:04');
INSERT INTO `flow_instruction` VALUES ('efee8eab85c64d309a017b8fd87463a8', null, null, null, null, null, 'CONTROLLER', '65535', 'a4e2a89e21254fa6a85f9e653c97389b', '2018-10-29 15:45:01');
INSERT INTO `flow_instruction` VALUES ('f0b6a830a8074dbd8e2f6a7e6490844d', null, null, null, null, null, 'CONTROLLER', '65535', 'be0db374b5c04e71bf10b42124a418df', '2018-10-29 15:09:05');
INSERT INTO `flow_instruction` VALUES ('f134ba10cc224a72817acf83f6de7b4f', null, null, null, null, null, 'CONTROLLER', '65535', 'b0582fba41df494dbe84cfa5d7a3bab3', '2018-10-29 15:12:02');
INSERT INTO `flow_instruction` VALUES ('f1cb8ed3aaf144e5aec86c449038279e', null, null, null, null, null, 'CONTROLLER', '65535', '47637324f74f49dd8b304d16d0da023d', '2018-10-29 16:21:02');
INSERT INTO `flow_instruction` VALUES ('f272de30656a4bda8b84e59133a7591a', null, null, null, null, null, 'CONTROLLER', '65535', '8a694980247d48969a72a39d98a4bd8f', '2018-10-29 15:06:06');
INSERT INTO `flow_instruction` VALUES ('f2ab94b85ecb40d99daf201c87671de9', null, null, null, null, null, 'CONTROLLER', '65535', 'e4509a849d6f4507a49baedfdcf43bbd', '2018-10-29 16:12:01');
INSERT INTO `flow_instruction` VALUES ('f34b042865874bfe9e720d14da53625d', null, null, null, null, null, 'CONTROLLER', '65535', '518d20d0a8574afdb057cba30211ab41', '2018-10-29 16:12:04');
INSERT INTO `flow_instruction` VALUES ('f3d99fed905b4dfe9ebd54dd66c9b15a', null, null, null, null, null, 'CONTROLLER', '65535', 'bb952f29a3ef437c95cabbdc52f07228', '2018-10-29 16:15:04');
INSERT INTO `flow_instruction` VALUES ('f3e9e05a6e694d9182cfcc6abdc268fd', null, null, null, null, null, 'CONTROLLER', '65535', '9188dfe20fb74724a83b3d371711f6a4', '2018-10-29 15:00:09');
INSERT INTO `flow_instruction` VALUES ('f4475040477b46fcb50c504cdfcc9313', null, null, null, null, null, 'CONTROLLER', '65535', 'b3d9fae725b5443187534d4adddbb5b0', '2018-10-29 15:21:01');
INSERT INTO `flow_instruction` VALUES ('f4938b0058f44616974cb3c0e27d320c', null, null, null, null, null, 'CONTROLLER', '65535', 'fc63f42a55bb4c16b63678f8c2b3510b', '2018-10-29 15:45:01');
INSERT INTO `flow_instruction` VALUES ('f4d7c68cb9a04c9d8a56a174853421f6', null, null, null, null, null, 'CONTROLLER', '65535', 'e5c0074fa738467c9c714de761eb3de1', '2018-10-29 16:15:04');
INSERT INTO `flow_instruction` VALUES ('f5db700d9b7e4b088a5c83c7574feb39', null, null, null, null, null, 'CONTROLLER', '65535', '208ef95da0d24c8fa111945195cf7093', '2018-10-29 15:42:03');
INSERT INTO `flow_instruction` VALUES ('f651d3cb503d4dd8ab89723d2009fb43', null, null, null, null, null, 'CONTROLLER', '65535', '816532c6314e4499bf60ef9916a96833', '2018-10-29 15:24:00');
INSERT INTO `flow_instruction` VALUES ('f6746956ce5d42c9b045a64369890dff', null, null, null, null, null, 'CONTROLLER', '65535', '0830af63e3f84debba540515aa819a1c', '2018-10-29 16:06:04');
INSERT INTO `flow_instruction` VALUES ('f922cb6ee32c471991c228a655029281', null, null, null, null, null, 'CONTROLLER', '65535', '04e88ddf39424be199646b45c9813443', '2018-10-29 15:21:04');
INSERT INTO `flow_instruction` VALUES ('fb9b7ab5575d43bd80f774ea73ee031a', null, null, null, null, null, 'CONTROLLER', '65535', 'd4d75fb650304209825ff74ad218fe89', '2018-10-29 15:21:04');
INSERT INTO `flow_instruction` VALUES ('fc05c991f889472c9d9b1d9ba88f31af', null, null, null, null, null, 'CONTROLLER', '65535', 'b946df12c6a346c7bdfb2c7feb3f1dd6', '2018-10-29 15:27:03');
INSERT INTO `flow_instruction` VALUES ('fd59457918964423ad0a262dfb29ab1d', null, null, null, null, null, 'CONTROLLER', '65535', 'f0467dc4ca8242b2b1c52b9816e3565f', '2018-10-29 16:15:04');
INSERT INTO `flow_instruction` VALUES ('ff22c21ae83548bf904c898b63491b84', null, null, null, null, null, 'CONTROLLER', '65535', '69073d7e7d3c439b92d37c2b35f4c8fc', '2018-10-29 16:21:04');
INSERT INTO `flow_instruction` VALUES ('ff5c2e93c51c4d15b8d12a0c25de016b', null, null, null, null, null, 'CONTROLLER', '65535', '82479641183c4067b7699fce81c93617', '2018-10-29 15:24:02');

-- ----------------------------
-- Table structure for flow_session
-- ----------------------------
DROP TABLE IF EXISTS `flow_session`;
CREATE TABLE `flow_session` (
  `sessionId` varchar(32) NOT NULL COMMENT 'session信息id',
  `id` varchar(32) DEFAULT NULL COMMENT 'id',
  `src_v_mac` varchar(32) DEFAULT NULL COMMENT '源虚拟MAC地址',
  `dst_mac` varchar(32) DEFAULT NULL COMMENT '目的真实MAC',
  `dst_port` varchar(6) DEFAULT NULL COMMENT '目的服务端口',
  `proto` varchar(9) DEFAULT NULL COMMENT '协议类型',
  `dst_v_ip` varchar(32) DEFAULT NULL COMMENT '目的虚拟IP',
  `dst_v_mac` varchar(32) DEFAULT NULL COMMENT '目的虚拟MAC地址',
  `src_mac` varchar(32) DEFAULT NULL COMMENT '源真实MAC',
  `dst_ip` varchar(32) DEFAULT NULL COMMENT '目的真实IP',
  `s_type` varchar(32) DEFAULT NULL COMMENT '路径是否动态跳变',
  `src_ip` varchar(32) DEFAULT NULL COMMENT '源真实IP',
  `topo_mutation` varchar(6) DEFAULT NULL COMMENT '路径跳变周期',
  `src_port` varchar(32) DEFAULT NULL COMMENT '源服务端口',
  `ttl` varchar(12) DEFAULT NULL COMMENT '会话生命(存活)周期',
  `src_v_ip` varchar(32) DEFAULT NULL COMMENT '源虚拟ip',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_session
-- ----------------------------
INSERT INTO `flow_session` VALUES ('323213213', '2090578889', '96:51:80:2c:30:49', 'aa:ab:43:1e:6f:89', '5201', 'tcp', '61.234.101.43', '8f:32:da:bf:dd:eb', '76:dc:c8:27:fb:87', '10.0.0.82', 'dynamic', '10.0.0.18', '30', '35548', '1800', '171.13.106.28', '2018-10-16 17:16:36');

-- ----------------------------
-- Table structure for flow_session_path
-- ----------------------------
DROP TABLE IF EXISTS `flow_session_path`;
CREATE TABLE `flow_session_path` (
  `path_id` varchar(32) NOT NULL,
  `id` varchar(32) DEFAULT NULL COMMENT '路径id',
  `flow_session_id` varchar(32) DEFAULT NULL COMMENT 'session对应得id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_session_path
-- ----------------------------
INSERT INTO `flow_session_path` VALUES ('222222', '1', '323213213', '2018-10-17 11:53:15');
INSERT INTO `flow_session_path` VALUES ('4444', '1', '323213213', '2018-10-17 11:53:15');
INSERT INTO `flow_session_path` VALUES ('5555', '1', '323213213', '2018-10-17 11:53:15');
INSERT INTO `flow_session_path` VALUES ('6666', '1', '323213213', '2018-10-17 11:53:15');

-- ----------------------------
-- Table structure for flow_session_path_infos
-- ----------------------------
DROP TABLE IF EXISTS `flow_session_path_infos`;
CREATE TABLE `flow_session_path_infos` (
  `path_info_id` varchar(32) NOT NULL,
  `id` varchar(32) DEFAULT NULL COMMENT '交换机id',
  `node` varchar(32) DEFAULT NULL COMMENT '交换机节点名称',
  `src_nc` varchar(32) DEFAULT NULL COMMENT '数据包接收端口',
  `dst_nc` varchar(32) DEFAULT NULL COMMENT '数据包传送端口',
  `flow_session_path_id` varchar(32) DEFAULT NULL COMMENT 'flowSessionPath对应的id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`path_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_session_path_infos
-- ----------------------------
INSERT INTO `flow_session_path_infos` VALUES ('3333', '2', 'openflow:4', 'openflow:4:4', 'openflow:4:2', '222222', '2018-10-17 14:36:02');

-- ----------------------------
-- Table structure for flow_table
-- ----------------------------
DROP TABLE IF EXISTS `flow_table`;
CREATE TABLE `flow_table` (
  `flow_table_id` varchar(32) NOT NULL COMMENT '交换机的流表id',
  `id` int(10) DEFAULT NULL,
  `active_flows` int(10) DEFAULT NULL,
  `packets_looked_up` varchar(32) DEFAULT NULL COMMENT '该流表查看的包数量',
  `packets_matched` varchar(32) DEFAULT NULL COMMENT '匹配的包数量',
  `switches_id` varchar(32) DEFAULT NULL COMMENT '交换机id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`flow_table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_table
-- ----------------------------
INSERT INTO `flow_table` VALUES ('002bd68cb623477698f6c54e1e255f2e', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:33:03');
INSERT INTO `flow_table` VALUES ('00c656e5b85c477d90afe6515e33a247', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 16:20:33');
INSERT INTO `flow_table` VALUES ('02891b0bdbfa4562810c1371a0024ff6', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 16:24:02');
INSERT INTO `flow_table` VALUES ('02b3a20f135e48a792a268656c5f56a2', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:33:04');
INSERT INTO `flow_table` VALUES ('05902e7804344e6191975c6c63e161db', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:15:05');
INSERT INTO `flow_table` VALUES ('0a14d44c456742598ea6a33cc09065f9', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 16:00:09');
INSERT INTO `flow_table` VALUES ('0de9d73b4c1a4a9abfbaa1f592858cd6', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 15:00:11');
INSERT INTO `flow_table` VALUES ('0ee8e1988e3b451ea56bf2f9dc9d49fd', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:27:00');
INSERT INTO `flow_table` VALUES ('12e071b8ec6c4668a5aed2aa80c6bd61', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:42:02');
INSERT INTO `flow_table` VALUES ('1333dec5637d4cb99f978750181b4848', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 16:15:00');
INSERT INTO `flow_table` VALUES ('139731b58f814cca8307b02e125add96', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 16:24:03');
INSERT INTO `flow_table` VALUES ('13c866074d4e48a9a29249fa9c98085d', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:15:04');
INSERT INTO `flow_table` VALUES ('165d0505d95647d3b084ef25a1115510', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 16:03:04');
INSERT INTO `flow_table` VALUES ('16edc8214e414f179bdba1f2f912aad3', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:30:10');
INSERT INTO `flow_table` VALUES ('1a65b5ddfde44aa8a68137a06db0ea27', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:27:01');
INSERT INTO `flow_table` VALUES ('1dfa0203103747f0aada13b57704830b', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:09:01');
INSERT INTO `flow_table` VALUES ('1eec031987cf417f8720c055ae728f59', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 16:24:01');
INSERT INTO `flow_table` VALUES ('214f428a61b744bf867cbce7df6a2e1c', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 16:20:32');
INSERT INTO `flow_table` VALUES ('222a73a460a74ab2ac186c75dc1230d1', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 16:00:12');
INSERT INTO `flow_table` VALUES ('267cd5f5b4b34793922923c7031ed019', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 16:24:04');
INSERT INTO `flow_table` VALUES ('2b40f6614e424820899ed7bb52f9b007', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:39:08');
INSERT INTO `flow_table` VALUES ('2ba3c76b8b1847a781376945df504044', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:39:10');
INSERT INTO `flow_table` VALUES ('2cbf921c307b4e2d8b5a7301fe79207b', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 16:03:03');
INSERT INTO `flow_table` VALUES ('2ce779d8f4f24432b0f7754045a5a4fa', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 06:03:02');
INSERT INTO `flow_table` VALUES ('2d28692a547641249f24b77435a2b1d9', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:12:01');
INSERT INTO `flow_table` VALUES ('2da5951be28141008081758e71ab9b4a', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:06:07');
INSERT INTO `flow_table` VALUES ('2e0d3e8a1e55443aa003c2a7c0d77d5a', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:42:03');
INSERT INTO `flow_table` VALUES ('2f5505042111423b8520feda4866b6bb', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 16:09:00');
INSERT INTO `flow_table` VALUES ('2f72b8dbca1542b7b8edb7f584cf0150', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:18:03');
INSERT INTO `flow_table` VALUES ('2fcfe12fc8ca43258e4d3e8382c70ce6', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 16:06:03');
INSERT INTO `flow_table` VALUES ('31a5b7123e0c40759015fbfd3c97f519', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 15:03:41');
INSERT INTO `flow_table` VALUES ('31d605d922f84f4b865cebbf8d074f25', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:21:01');
INSERT INTO `flow_table` VALUES ('322ebda4e25d447fba4effd0bfb5c369', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:12:04');
INSERT INTO `flow_table` VALUES ('32487edbcfc54f6a8a0fe1c101b60eb5', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:27:03');
INSERT INTO `flow_table` VALUES ('3291b001a3884a5b863f50fe6d74429e', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:24:02');
INSERT INTO `flow_table` VALUES ('32f03ed7e7db457d8014cbdf7c3d8a13', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:15:03');
INSERT INTO `flow_table` VALUES ('32f549381b8542d6b539a814226a5478', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:09:03');
INSERT INTO `flow_table` VALUES ('358b334feaec4a90819e68b03f4ab114', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:24:00');
INSERT INTO `flow_table` VALUES ('3664907d91764c81be1edda992832209', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 16:20:34');
INSERT INTO `flow_table` VALUES ('3a63b82743b54cdc9c1b9704b2184eb7', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:30:09');
INSERT INTO `flow_table` VALUES ('3a71bf64168d4a519697c4b810a155ad', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 16:12:01');
INSERT INTO `flow_table` VALUES ('3aa8b853e381431baa21db5443fef560', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:21:04');
INSERT INTO `flow_table` VALUES ('3bf34a9d729b4c4bbc9a29ff88be058e', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:42:04');
INSERT INTO `flow_table` VALUES ('4068e9844ca545e8a82d6888104b19a1', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 16:03:01');
INSERT INTO `flow_table` VALUES ('40adb80e8ffe491386fe9a0141a85b77', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 16:06:00');
INSERT INTO `flow_table` VALUES ('461aedf7659345339973b9ced3791a86', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 06:03:01');
INSERT INTO `flow_table` VALUES ('470f157d77ff4dc3a932c95715c92ee2', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:15:07');
INSERT INTO `flow_table` VALUES ('4ac3b4e6360e42d4a65e9797e1adf827', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 15:03:42');
INSERT INTO `flow_table` VALUES ('4bb9f3e0ed2e4c7a9355734bad61b720', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 16:21:03');
INSERT INTO `flow_table` VALUES ('4db5e850767741368bf54604a216fb23', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 16:06:02');
INSERT INTO `flow_table` VALUES ('4dd8e96953a14856ac52b958db8ce45e', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:27:02');
INSERT INTO `flow_table` VALUES ('4ee8de322f75449cb7cfc85b3fd7d84d', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 14:57:04');
INSERT INTO `flow_table` VALUES ('4f899bddc9ed4c3ab44da8bcad84f425', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 06:03:01');
INSERT INTO `flow_table` VALUES ('525ee1d40445461494b165f3434c35dc', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:45:01');
INSERT INTO `flow_table` VALUES ('52882f8d57bf4ab891818de6e7f4abe3', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 14:57:03');
INSERT INTO `flow_table` VALUES ('53e3d493ba824cf3aee7fbe00a2670bb', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:21:02');
INSERT INTO `flow_table` VALUES ('5555', '5', '5', '5', '5', '1111', '2018-10-23 16:48:49');
INSERT INTO `flow_table` VALUES ('5628d04965f247eaa092fbba1b421296', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 16:03:02');
INSERT INTO `flow_table` VALUES ('566db1a8018b41cfa7b93cc73061652c', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 16:12:03');
INSERT INTO `flow_table` VALUES ('594c6c24269646b7a6c181fa414ab679', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 16:21:02');
INSERT INTO `flow_table` VALUES ('5b48c2401b164d50a2945455e995792c', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 16:00:10');
INSERT INTO `flow_table` VALUES ('5b628dc9e9df4312867e90b604da6fd5', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:09:04');
INSERT INTO `flow_table` VALUES ('5fa0cf44f96e4b9795daccce16fd8085', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:54:01');
INSERT INTO `flow_table` VALUES ('6496d86943434a00934f6988c31b370f', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 16:15:04');
INSERT INTO `flow_table` VALUES ('65d983905d184106bfa49e29589f952e', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 15:00:09');
INSERT INTO `flow_table` VALUES ('6666', '6', '6', '6', '6', '2222', '2018-10-15 16:49:05');
INSERT INTO `flow_table` VALUES ('68c0945d9a82438eb955eb5d5cd3f349', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 15:03:39');
INSERT INTO `flow_table` VALUES ('68f9ba82cc2d45f789811c5967c91a34', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:24:04');
INSERT INTO `flow_table` VALUES ('6d60c8c64f4741a59fa9afc083663fbb', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:12:05');
INSERT INTO `flow_table` VALUES ('6f06375f89df4253a36d37e323c2c2a2', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 15:00:12');
INSERT INTO `flow_table` VALUES ('6f7b29c0f7144faaa28820ad6bace0b7', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 16:21:01');
INSERT INTO `flow_table` VALUES ('71613313526748caa433c84117ad2255', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 15:00:10');
INSERT INTO `flow_table` VALUES ('77309319a25d4091aee3b46891e19185', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:45:03');
INSERT INTO `flow_table` VALUES ('7af51fdbed60457389f53f88d7fbbb6c', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:45:00');
INSERT INTO `flow_table` VALUES ('804a137e008248adb4bbb282215fb658', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:12:02');
INSERT INTO `flow_table` VALUES ('835d4e7ecb2d4333ab49e51ad709e8bf', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:42:00');
INSERT INTO `flow_table` VALUES ('88516728318e4686906a6d064ad48cdf', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:39:07');
INSERT INTO `flow_table` VALUES ('88788c266b9b4b9bb74c66c1943d8536', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:21:00');
INSERT INTO `flow_table` VALUES ('88acc7d9c5cc49b78f6dabe8c7178462', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:18:04');
INSERT INTO `flow_table` VALUES ('8a10859019704ac0b0c8c74453c6b24e', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 06:03:02');
INSERT INTO `flow_table` VALUES ('8b64d274999b43adb27a32021ccd2873', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 16:12:02');
INSERT INTO `flow_table` VALUES ('8cb4696290fc4d729fad9c34f9d90362', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 16:21:00');
INSERT INTO `flow_table` VALUES ('8d3dc0d3befb49a2b02b9a7945462a62', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 14:57:06');
INSERT INTO `flow_table` VALUES ('8d5e5a6d509449ce90490f92575ae8ca', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:12:03');
INSERT INTO `flow_table` VALUES ('8e6b6a41860e4de6b689c5b2af727e6d', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:24:01');
INSERT INTO `flow_table` VALUES ('93d1c23f8f094cbeb68193f6793e3ee8', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:33:00');
INSERT INTO `flow_table` VALUES ('946e657dbf944416956f41b15f861f0d', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:54:04');
INSERT INTO `flow_table` VALUES ('959190478ef34b0ebacc3ce4082ffa0a', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:15:06');
INSERT INTO `flow_table` VALUES ('97aad152b0a4400bb9f203353798bf05', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:33:01');
INSERT INTO `flow_table` VALUES ('97fea92a7cb04b70a911b44c15d72436', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 16:09:01');
INSERT INTO `flow_table` VALUES ('9aab68903b404fc8bd65181966924a19', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 16:12:00');
INSERT INTO `flow_table` VALUES ('9ccd6f018f6a44ae91dfd41f4fbc1a5b', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 16:15:02');
INSERT INTO `flow_table` VALUES ('9e166e96e52d4ea7937dd90be1f3ba22', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:27:04');
INSERT INTO `flow_table` VALUES ('a069f9274939444a9c741cb5c5bc8150', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:24:03');
INSERT INTO `flow_table` VALUES ('a1f0aa80cb254675a3dbabc0abc23a39', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:06:05');
INSERT INTO `flow_table` VALUES ('a5ccc86d348f4e34ba23c6b435506774', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:33:02');
INSERT INTO `flow_table` VALUES ('a5cee5cdaea148bda4bc2b30f502c756', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 16:09:03');
INSERT INTO `flow_table` VALUES ('aa7d74f81a734763ba13cb784f6c0076', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:30:08');
INSERT INTO `flow_table` VALUES ('ad8f9291a1a04887a8658570467b2138', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:18:01');
INSERT INTO `flow_table` VALUES ('b03360953abe414688a6da49607d6189', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 16:15:01');
INSERT INTO `flow_table` VALUES ('b17c4254122b45d9835c9f199b26194b', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 16:00:11');
INSERT INTO `flow_table` VALUES ('b7eced8931334fa284b58ca36ae2f168', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 06:03:00');
INSERT INTO `flow_table` VALUES ('b9430fe211484dbb80d2e3774bdf1b60', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 16:20:35');
INSERT INTO `flow_table` VALUES ('be843cbd9f35483fa88f2d3a77a9af1e', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 14:57:07');
INSERT INTO `flow_table` VALUES ('bed8f9bb55da4716885d757210c8c803', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 15:00:13');
INSERT INTO `flow_table` VALUES ('c0167d353aba48769da565a1eb30ac1d', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 15:03:40');
INSERT INTO `flow_table` VALUES ('c2c9217759b04f1bbf8a03e908b5ba17', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:18:02');
INSERT INTO `flow_table` VALUES ('c2e33ec292554668bb8073f1881d17a4', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 14:57:05');
INSERT INTO `flow_table` VALUES ('c464ce3089e74afeb127f0676e463f2e', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:54:00');
INSERT INTO `flow_table` VALUES ('c523ad19ed5c45a78e255f9b04663c67', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 16:06:04');
INSERT INTO `flow_table` VALUES ('c5f5f8e176da466393829b21c671650a', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 16:03:00');
INSERT INTO `flow_table` VALUES ('c8e19eeb344a4296be7cd244d86f5bc2', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:45:04');
INSERT INTO `flow_table` VALUES ('ccab86b89aa84162b6a035732b8dcd3e', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:30:11');
INSERT INTO `flow_table` VALUES ('cec360aa124c4e6e9d3e0bb196c694b9', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:18:00');
INSERT INTO `flow_table` VALUES ('cf7f3cac7327441f8bec7a03c896c28f', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:39:09');
INSERT INTO `flow_table` VALUES ('cffe4c5bf1eb43648b70bf5170e856ea', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 16:21:04');
INSERT INTO `flow_table` VALUES ('cffe803a993748369f3d82d9c5542cae', '0', '4', '18446744073709551615', '18446744073709551615', null, '2018-10-29 15:03:43');
INSERT INTO `flow_table` VALUES ('d34aa652a30f40a7935bb60b824ae71d', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 16:09:04');
INSERT INTO `flow_table` VALUES ('d58f3b3e3d6a42eab1fad22f47a56a57', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:54:03');
INSERT INTO `flow_table` VALUES ('dab6f60e802b49908fa41db291341c31', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:21:03');
INSERT INTO `flow_table` VALUES ('dc636eaf8e664121ac70059217f4399c', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 16:20:32');
INSERT INTO `flow_table` VALUES ('ddb2dfbac6be4562ada079f9c1e13109', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:06:08');
INSERT INTO `flow_table` VALUES ('e0891d93624b443796a43d4df8ec3b5b', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 15:09:02');
INSERT INTO `flow_table` VALUES ('e0aa0bb7800646ef8e5282ff2d80bd3d', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 16:06:01');
INSERT INTO `flow_table` VALUES ('e1b8922f45ba4358bf31c26491cdc320', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 16:00:13');
INSERT INTO `flow_table` VALUES ('e3c3d1208ae34658a922f684a5fcf7a1', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 15:09:05');
INSERT INTO `flow_table` VALUES ('ebb4cc98f15a4e3d8f7bffb0b759cecc', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:11882651047521214913', '2018-10-29 16:15:03');
INSERT INTO `flow_table` VALUES ('ec01138c5e274161bb9aa0d27996d33d', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 16:09:02');
INSERT INTO `flow_table` VALUES ('ed6985cae06d4f83b259390da7d00004', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2037944993637447489', '2018-10-29 15:45:02');
INSERT INTO `flow_table` VALUES ('ef781f6682344297b478f4f3a4cc2d90', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 16:24:00');
INSERT INTO `flow_table` VALUES ('f15b1aaaf5944f74b9ec133a6b946b12', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737066023809', '2018-10-29 16:12:04');
INSERT INTO `flow_table` VALUES ('f66205d09241432d82ef4da889e0f537', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:06:04');
INSERT INTO `flow_table` VALUES ('f951820d6627430f88a9c5491833d574', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:54:02');
INSERT INTO `flow_table` VALUES ('f954d0bf2f6f4db1a3b97e824330fa3b', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:42:01');
INSERT INTO `flow_table` VALUES ('fbb747803abe4737a651898b19344b63', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:39:06');
INSERT INTO `flow_table` VALUES ('fe32b9bed356438aa86080b90efe8a18', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:10308452565238866008', '2018-10-29 15:06:06');
INSERT INTO `flow_table` VALUES ('fe99c08332b84cf5b7cc4b189793c53b', '0', '4', '18446744073709551615', '18446744073709551615', 'openflow:2038063737063325569', '2018-10-29 15:30:12');

-- ----------------------------
-- Table structure for flow_table_details
-- ----------------------------
DROP TABLE IF EXISTS `flow_table_details`;
CREATE TABLE `flow_table_details` (
  `flow_table_details_id` varchar(32) NOT NULL COMMENT '流表详情id',
  `id` varchar(32) DEFAULT NULL COMMENT '流规则id',
  `idle_timeout` int(10) DEFAULT NULL,
  `cookie` int(10) DEFAULT NULL,
  `flags` varchar(32) DEFAULT NULL,
  `hard_timeout` int(10) DEFAULT NULL,
  `cookie_mask` int(10) DEFAULT NULL,
  `duration_nanosecond` int(10) DEFAULT NULL,
  `second` int(10) DEFAULT NULL,
  `byte_count` int(10) DEFAULT NULL COMMENT '该流规则转发的比特数',
  `packet_count` varchar(32) DEFAULT NULL COMMENT '该流规则转发的包数量',
  `priority` int(10) DEFAULT NULL,
  `table_id` int(10) DEFAULT NULL,
  `match_tcp_destination_port` int(10) DEFAULT NULL,
  `match_tcp_source_port` int(10) DEFAULT NULL,
  `match_ip_protocol` int(10) DEFAULT NULL,
  `match_ipv4_source` varchar(32) DEFAULT NULL,
  `match_ipv4_destination` varchar(32) DEFAULT NULL,
  `match_ethernet_type` int(10) DEFAULT NULL,
  `flow_table_id` varchar(32) DEFAULT NULL COMMENT '流表id',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`flow_table_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_table_details
-- ----------------------------
INSERT INTO `flow_table_details` VALUES ('0175a4c7533241febc18f125082107d9', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'ddb2dfbac6be4562ada079f9c1e13109', '2018-10-29 15:06:08');
INSERT INTO `flow_table_details` VALUES ('01de49e64d1f4a34ac9582267f9d2b7e', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', 'aa7d74f81a734763ba13cb784f6c0076', '2018-10-29 15:30:08');
INSERT INTO `flow_table_details` VALUES ('01ec0d3bf2ed44bc974d22f562e1acc0', 'Initial-22', null, null, null, null, null, null, null, '238080', '18446744073709551615', null, null, null, null, null, null, null, '2054', '88516728318e4686906a6d064ad48cdf', '2018-10-29 15:39:07');
INSERT INTO `flow_table_details` VALUES ('023b3c100a8d499c9325500841d9b698', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'b03360953abe414688a6da49607d6189', '2018-10-29 16:15:02');
INSERT INTO `flow_table_details` VALUES ('0407775b17974bcea4c4c39b1f458d9f', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '594c6c24269646b7a6c181fa414ab679', '2018-10-29 16:21:03');
INSERT INTO `flow_table_details` VALUES ('0458e076b64348a2ae2cdb9487ae2d75', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '02b3a20f135e48a792a268656c5f56a2', '2018-10-29 15:33:04');
INSERT INTO `flow_table_details` VALUES ('04e88ddf39424be199646b45c9813443', 'Initial-13', null, null, null, null, null, null, null, '28617794', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'dab6f60e802b49908fa41db291341c31', '2018-10-29 15:21:03');
INSERT INTO `flow_table_details` VALUES ('0556d3c7f8ce464eb2852d6b9e4d250a', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'dc636eaf8e664121ac70059217f4399c', '2018-10-29 16:20:33');
INSERT INTO `flow_table_details` VALUES ('055e641288f84a99b243db515175b9c4', 'Initial-15', null, null, null, null, null, null, null, '237120', '18446744073709551615', null, null, null, null, null, null, null, '2054', '8d3dc0d3befb49a2b02b9a7945462a62', '2018-10-29 14:57:06');
INSERT INTO `flow_table_details` VALUES ('05ac00da9b5e472e82a091b5e6adf699', 'Initial-13', null, null, null, null, null, null, null, '28538583', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'c0167d353aba48769da565a1eb30ac1d', '2018-10-29 15:03:40');
INSERT INTO `flow_table_details` VALUES ('0702b478ce3849a98434782252e115cf', 'Initial-27', null, null, null, null, null, null, null, '28880745', '18446744073709551615', null, null, null, null, null, null, null, '35020', '3664907d91764c81be1edda992832209', '2018-10-29 16:20:34');
INSERT INTO `flow_table_details` VALUES ('0830af63e3f84debba540515aa819a1c', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '2fcfe12fc8ca43258e4d3e8382c70ce6', '2018-10-29 16:06:04');
INSERT INTO `flow_table_details` VALUES ('08afe1f181da4701bc801ab56cf02925', 'Initial-7', null, null, null, null, null, null, null, '28749944', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'f66205d09241432d82ef4da889e0f537', '2018-10-29 15:06:05');
INSERT INTO `flow_table_details` VALUES ('097fae7cdeb9401fb78a01d730f5c7bb', 'Initial-7', null, null, null, null, null, null, null, '28995915', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'b17c4254122b45d9835c9f199b26194b', '2018-10-29 16:00:12');
INSERT INTO `flow_table_details` VALUES ('09e088945b14454dbfe617311262470c', 'Initial-27', null, null, null, null, null, null, null, '28828719', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'a5cee5cdaea148bda4bc2b30f502c756', '2018-10-29 16:09:03');
INSERT INTO `flow_table_details` VALUES ('0a16e99e50c8419ca26b04504bd0198d', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '566db1a8018b41cfa7b93cc73061652c', '2018-10-29 16:12:04');
INSERT INTO `flow_table_details` VALUES ('0ab5a75370a2457690195ec6ee1c6da9', 'Initial-22', null, null, null, null, null, null, null, '244032', '18446744073709551615', null, null, null, null, null, null, null, '2054', '946e657dbf944416956f41b15f861f0d', '2018-10-29 15:54:05');
INSERT INTO `flow_table_details` VALUES ('0b22efb2e84a4a388d500c4d2f004634', 'Initial-15', null, null, null, null, null, null, null, '237504', '18446744073709551615', null, null, null, null, null, null, null, '2054', '0ee8e1988e3b451ea56bf2f9dc9d49fd', '2018-10-29 15:27:01');
INSERT INTO `flow_table_details` VALUES ('0b309d39d4014293a74f7040249f7ade', 'Initial-15', null, null, null, null, null, null, null, '237184', '18446744073709551615', null, null, null, null, null, null, null, '2054', '2da5951be28141008081758e71ab9b4a', '2018-10-29 15:06:07');
INSERT INTO `flow_table_details` VALUES ('0b37dd5162a4462ba8469f2e2e0f1b59', 'Initial-21', null, null, null, null, null, null, null, '1782933', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'e1b8922f45ba4358bf31c26491cdc320', '2018-10-29 16:00:13');
INSERT INTO `flow_table_details` VALUES ('0b7e99636b664aae9c534ac524ae5e9c', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '9e166e96e52d4ea7937dd90be1f3ba22', '2018-10-29 15:27:04');
INSERT INTO `flow_table_details` VALUES ('0beb897f6ec14f3f98eacd1751103c4f', 'Initial-7', null, null, null, null, null, null, null, '28900407', '18446744073709551615', null, null, null, null, null, null, null, '35020', '2ba3c76b8b1847a781376945df504044', '2018-10-29 15:39:11');
INSERT INTO `flow_table_details` VALUES ('0bf2680f6997441ba3ed6b8ba728997d', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '8b64d274999b43adb27a32021ccd2873', '2018-10-29 16:12:03');
INSERT INTO `flow_table_details` VALUES ('0c20aa99800e43fd9f62618f723b3f4b', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', 'e1b8922f45ba4358bf31c26491cdc320', '2018-10-29 16:00:13');
INSERT INTO `flow_table_details` VALUES ('0c3809596fca4e49833b966c7368c8a0', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'b7eced8931334fa284b58ca36ae2f168', '2018-10-29 06:03:00');
INSERT INTO `flow_table_details` VALUES ('0c3ec99b9ba1499cb0462d3b7c2d391e', 'Initial-13', null, null, null, null, null, null, null, '28523044', '18446744073709551615', null, null, null, null, null, null, null, '35020', '71613313526748caa433c84117ad2255', '2018-10-29 15:00:11');
INSERT INTO `flow_table_details` VALUES ('0cffdc2f77d24a61a61370ee3c4ff27f', 'Initial-23', null, null, null, null, null, null, null, '28698840', '18446744073709551615', null, null, null, null, null, null, null, '35020', '12e071b8ec6c4668a5aed2aa80c6bd61', '2018-10-29 15:42:03');
INSERT INTO `flow_table_details` VALUES ('0d9471f48f434651ac59556f6c81d9e7', 'Initial-13', null, null, null, null, null, null, null, '28659105', '18446744073709551615', null, null, null, null, null, null, null, '35020', '16edc8214e414f179bdba1f2f912aad3', '2018-10-29 15:30:10');
INSERT INTO `flow_table_details` VALUES ('0e3ca0a2ad6f488090e28c90b85e3360', 'Initial-22', null, null, null, null, null, null, null, '238080', '18446744073709551615', null, null, null, null, null, null, null, '2054', '12e071b8ec6c4668a5aed2aa80c6bd61', '2018-10-29 15:42:02');
INSERT INTO `flow_table_details` VALUES ('0e669017d7be46279985fbac31d1f3a4', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'bed8f9bb55da4716885d757210c8c803', '2018-10-29 15:00:14');
INSERT INTO `flow_table_details` VALUES ('0ed6189733094e4dad2d6a648bfcd444', 'Initial-22', null, null, null, null, null, null, null, '254400', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'c523ad19ed5c45a78e255f9b04663c67', '2018-10-29 16:06:04');
INSERT INTO `flow_table_details` VALUES ('0f3a87cfb8c34c9eab7908a9a57d6f55', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '32f03ed7e7db457d8014cbdf7c3d8a13', '2018-10-29 15:15:04');
INSERT INTO `flow_table_details` VALUES ('0f7a601fe37248799c29adc82af93680', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'd58f3b3e3d6a42eab1fad22f47a56a57', '2018-10-29 15:54:04');
INSERT INTO `flow_table_details` VALUES ('0fd228e8aa434f92b665f757884457c9', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '804a137e008248adb4bbb282215fb658', '2018-10-29 15:12:03');
INSERT INTO `flow_table_details` VALUES ('1040b4747b2e4dc8b9f38717b131cc1b', 'Initial-3', null, null, null, null, null, null, null, '28808431', '18446744073709551615', null, null, null, null, null, null, null, '35020', '4068e9844ca545e8a82d6888104b19a1', '2018-10-29 16:03:01');
INSERT INTO `flow_table_details` VALUES ('116980eef3b64c91aeedd9393bf932a0', 'Initial-19', null, null, null, null, null, null, null, '28570851', '18446744073709551615', null, null, null, null, null, null, null, '35020', '804a137e008248adb4bbb282215fb658', '2018-10-29 15:12:02');
INSERT INTO `flow_table_details` VALUES ('11a1ccbeff4342a88ad97f99687613ba', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '40adb80e8ffe491386fe9a0141a85b77', '2018-10-29 16:06:01');
INSERT INTO `flow_table_details` VALUES ('11e93658e3ac4ccc973d94bb38d73a7c', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'bed8f9bb55da4716885d757210c8c803', '2018-10-29 15:00:13');
INSERT INTO `flow_table_details` VALUES ('1378a6feb08c48cfbca63da948944168', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '139731b58f814cca8307b02e125add96', '2018-10-29 16:24:03');
INSERT INTO `flow_table_details` VALUES ('139623697a47428b8d51f93e3ee2cb02', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'a1f0aa80cb254675a3dbabc0abc23a39', '2018-10-29 15:06:05');
INSERT INTO `flow_table_details` VALUES ('14265d2729754f348ca879f6ed20323a', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', '214f428a61b744bf867cbce7df6a2e1c', '2018-10-29 16:20:32');
INSERT INTO `flow_table_details` VALUES ('143f3639340e4c8cae5630a194778e65', 'Initial-22', null, null, null, null, null, null, null, '237504', '18446744073709551615', null, null, null, null, null, null, null, '2054', '97aad152b0a4400bb9f203353798bf05', '2018-10-29 15:33:01');
INSERT INTO `flow_table_details` VALUES ('149501b1c7c64b64b067f80756e79534', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'b9430fe211484dbb80d2e3774bdf1b60', '2018-10-29 16:20:35');
INSERT INTO `flow_table_details` VALUES ('16207fb2f9f44330b4674197a8942f1c', 'Initial-7', null, null, null, null, null, null, null, '28738953', '18446744073709551615', null, null, null, null, null, null, null, '35020', '68c0945d9a82438eb955eb5d5cd3f349', '2018-10-29 15:03:40');
INSERT INTO `flow_table_details` VALUES ('16b9004aba9b49a5861672a729f53661', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', 'c2e33ec292554668bb8073f1881d17a4', '2018-10-29 14:57:05');
INSERT INTO `flow_table_details` VALUES ('16c411c73e854699b2ed2fbb46d91cef', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '2f72b8dbca1542b7b8edb7f584cf0150', '2018-10-29 15:18:03');
INSERT INTO `flow_table_details` VALUES ('16fadea0bc7b4a99ba12e71bc292efd1', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'c8e19eeb344a4296be7cd244d86f5bc2', '2018-10-29 15:45:04');
INSERT INTO `flow_table_details` VALUES ('178995fad1974ae58a77a132812fdce1', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'be843cbd9f35483fa88f2d3a77a9af1e', '2018-10-29 14:57:07');
INSERT INTO `flow_table_details` VALUES ('17b2c55832bf48749704f537ca736504', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'cec360aa124c4e6e9d3e0bb196c694b9', '2018-10-29 15:18:01');
INSERT INTO `flow_table_details` VALUES ('18349b5188744e6db40571a4711c4c50', 'Initial-11', null, null, null, null, null, null, null, '38945100', '18446744073709551615', null, null, null, null, null, null, null, '35020', '267cd5f5b4b34793922923c7031ed019', '2018-10-29 16:24:04');
INSERT INTO `flow_table_details` VALUES ('18660cb7bbde43459b1bf6db245d8dab', 'Initial-19', null, null, null, null, null, null, null, '28517317', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'bed8f9bb55da4716885d757210c8c803', '2018-10-29 15:00:14');
INSERT INTO `flow_table_details` VALUES ('187f0c74c3f04750a9baa6d6415cf913', 'Initial-14', null, null, null, null, null, null, null, '1782403', '18446744073709551615', null, null, null, null, null, null, null, '2048', '358b334feaec4a90819e68b03f4ab114', '2018-10-29 15:24:01');
INSERT INTO `flow_table_details` VALUES ('18c003e1418d48928b47349af31946dc', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'cffe4c5bf1eb43648b70bf5170e856ea', '2018-10-29 16:21:05');
INSERT INTO `flow_table_details` VALUES ('1987efe00edc4fa88ef8921a0976ced0', 'Initial-27', null, null, null, null, null, null, null, '28883007', '18446744073709551615', null, null, null, null, null, null, null, '35020', '594c6c24269646b7a6c181fa414ab679', '2018-10-29 16:21:02');
INSERT INTO `flow_table_details` VALUES ('1a519ff4275c4021bbf4e8b0f3956b2a', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '959190478ef34b0ebacc3ce4082ffa0a', '2018-10-29 15:15:07');
INSERT INTO `flow_table_details` VALUES ('1a840f6bb5e8469bbc37e9a4776805c2', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'c5f5f8e176da466393829b21c671650a', '2018-10-29 16:03:01');
INSERT INTO `flow_table_details` VALUES ('1ac6a5811a4e40c98dde09927dd7d49c', 'Initial-10', null, null, null, null, null, null, null, '38559030', '18446744073709551615', null, null, null, null, null, null, null, '35020', '53e3d493ba824cf3aee7fbe00a2670bb', '2018-10-29 15:21:02');
INSERT INTO `flow_table_details` VALUES ('1b11519ae8504ab6bbdd9b45fbdc25e8', 'Initial-16', null, null, null, null, null, null, null, '28496014', '18446744073709551615', null, null, null, null, null, null, null, '35020', '8d3dc0d3befb49a2b02b9a7945462a62', '2018-10-29 14:57:06');
INSERT INTO `flow_table_details` VALUES ('1bee58f15dea4771826e68c4be4d6e5a', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'a5cee5cdaea148bda4bc2b30f502c756', '2018-10-29 16:09:04');
INSERT INTO `flow_table_details` VALUES ('1c19552ec5f34a80820ab3140d8eb61d', 'Initial-22', null, null, null, null, null, null, null, '251904', '18446744073709551615', null, null, null, null, null, null, null, '2054', '165d0505d95647d3b084ef25a1115510', '2018-10-29 16:03:04');
INSERT INTO `flow_table_details` VALUES ('1d1741ba7f2d45d5934b859ab0640c91', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', 'cffe4c5bf1eb43648b70bf5170e856ea', '2018-10-29 16:21:04');
INSERT INTO `flow_table_details` VALUES ('1d4822a2022f4604a7c38c6172134529', 'Initial-23', null, null, null, null, null, null, null, '28848132', '18446744073709551615', null, null, null, null, null, null, null, '35020', '1333dec5637d4cb99f978750181b4848', '2018-10-29 16:15:01');
INSERT INTO `flow_table_details` VALUES ('1dcbc3f932d14ff895b4e95419c9db03', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'fe32b9bed356438aa86080b90efe8a18', '2018-10-29 15:06:07');
INSERT INTO `flow_table_details` VALUES ('1dd14c61331e497ab049b9f5fa2d0232', 'Initial-7', null, null, null, null, null, null, null, '28927316', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'c8e19eeb344a4296be7cd244d86f5bc2', '2018-10-29 15:45:05');
INSERT INTO `flow_table_details` VALUES ('1e6b6552ed344fffb0e20eafa3e909df', 'Initial-13', null, null, null, null, null, null, null, '28549953', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'a1f0aa80cb254675a3dbabc0abc23a39', '2018-10-29 15:06:05');
INSERT INTO `flow_table_details` VALUES ('1eaf237e122a4a148ba4543a93fb8900', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '3664907d91764c81be1edda992832209', '2018-10-29 16:20:35');
INSERT INTO `flow_table_details` VALUES ('1ef506f94d11490c847a702b874d12ee', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '4dd8e96953a14856ac52b958db8ce45e', '2018-10-29 15:27:02');
INSERT INTO `flow_table_details` VALUES ('1f4156aeb9fc4d33a16fd0fb33259314', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '1a65b5ddfde44aa8a68137a06db0ea27', '2018-10-29 15:27:01');
INSERT INTO `flow_table_details` VALUES ('1f8bc62dc1ad4815aceff311ea2a46fe', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '5fa0cf44f96e4b9795daccce16fd8085', '2018-10-29 15:54:02');
INSERT INTO `flow_table_details` VALUES ('1ffe8786d45647c6b868bbcd6c18b31f', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '02891b0bdbfa4562810c1371a0024ff6', '2018-10-29 16:24:03');
INSERT INTO `flow_table_details` VALUES ('201ebdd6963d4c349dcbbdec76fce74d', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '16edc8214e414f179bdba1f2f912aad3', '2018-10-29 15:30:11');
INSERT INTO `flow_table_details` VALUES ('208ef95da0d24c8fa111945195cf7093', 'Initial-21', null, null, null, null, null, null, null, '1782933', '18446744073709551615', null, null, null, null, null, null, null, '2048', '12e071b8ec6c4668a5aed2aa80c6bd61', '2018-10-29 15:42:03');
INSERT INTO `flow_table_details` VALUES ('2219e69055f84b54aa424fbf25b83f25', 'Initial-7', null, null, null, null, null, null, null, '29009180', '18446744073709551615', null, null, null, null, null, null, null, '35020', '5628d04965f247eaa092fbba1b421296', '2018-10-29 16:03:03');
INSERT INTO `flow_table_details` VALUES ('2304bdcdeb564a8a92c47897f749436f', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '6496d86943434a00934f6988c31b370f', '2018-10-29 16:15:05');
INSERT INTO `flow_table_details` VALUES ('2305e3bd42334b619995392957d0f4c6', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'ad8f9291a1a04887a8658570467b2138', '2018-10-29 15:18:02');
INSERT INTO `flow_table_details` VALUES ('238f4fa97fe543edb71998983b2af823', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '2ce779d8f4f24432b0f7754045a5a4fa', '2018-10-29 06:03:02');
INSERT INTO `flow_table_details` VALUES ('2397807e3061493d8254d3685f4ba13b', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '4bb9f3e0ed2e4c7a9355734bad61b720', '2018-10-29 16:21:04');
INSERT INTO `flow_table_details` VALUES ('23ec05ec1dba40c699251bcb637cede0', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '13c866074d4e48a9a29249fa9c98085d', '2018-10-29 15:15:05');
INSERT INTO `flow_table_details` VALUES ('240a4e27b96349a998cdf61a2c189647', 'Initial-16', null, null, null, null, null, null, null, '28509963', '18446744073709551615', null, null, null, null, null, null, null, '35020', '6f06375f89df4253a36d37e323c2c2a2', '2018-10-29 15:00:12');
INSERT INTO `flow_table_details` VALUES ('258e8c1c0e164b2a92c5059c3c98eb3c', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'b17c4254122b45d9835c9f199b26194b', '2018-10-29 16:00:11');
INSERT INTO `flow_table_details` VALUES ('25d2a672535949d18ce6705b015ceca8', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'b9430fe211484dbb80d2e3774bdf1b60', '2018-10-29 16:20:35');
INSERT INTO `flow_table_details` VALUES ('265c24eb828144f08ee823396402f75f', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '32f03ed7e7db457d8014cbdf7c3d8a13', '2018-10-29 15:15:04');
INSERT INTO `flow_table_details` VALUES ('26b6cb635326488c8161a167b5ecf6fc', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'b9430fe211484dbb80d2e3774bdf1b60', '2018-10-29 16:20:36');
INSERT INTO `flow_table_details` VALUES ('2828305714204effbc96b864b9b35ae0', 'Initial-22', null, null, null, null, null, null, null, '267456', '18446744073709551615', null, null, null, null, null, null, null, '2054', '6f7b29c0f7144faaa28820ad6bace0b7', '2018-10-29 16:21:01');
INSERT INTO `flow_table_details` VALUES ('28c46b633cf64671a4d846a15ff14f90', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '222a73a460a74ab2ac186c75dc1230d1', '2018-10-29 16:00:13');
INSERT INTO `flow_table_details` VALUES ('29035963a48d4924a04860a7824e4306', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '7af51fdbed60457389f53f88d7fbbb6c', '2018-10-29 15:45:01');
INSERT INTO `flow_table_details` VALUES ('290d53757d8a437e8f48145d06fb911c', 'Initial-27', null, null, null, null, null, null, null, '28815147', '18446744073709551615', null, null, null, null, null, null, null, '35020', '2fcfe12fc8ca43258e4d3e8382c70ce6', '2018-10-29 16:06:03');
INSERT INTO `flow_table_details` VALUES ('293d2de8dbee42dd810f38cc726d3568', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '4db5e850767741368bf54604a216fb23', '2018-10-29 16:06:02');
INSERT INTO `flow_table_details` VALUES ('29537beb88dd4e78bf9a209a220db3df', 'Initial-16', null, null, null, null, null, null, null, '28577446', '18446744073709551615', null, null, null, null, null, null, null, '35020', '470f157d77ff4dc3a932c95715c92ee2', '2018-10-29 15:15:07');
INSERT INTO `flow_table_details` VALUES ('2a48f44c2c1f4d94aaef3f39c7345371', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', 'd34aa652a30f40a7935bb60b824ae71d', '2018-10-29 16:09:04');
INSERT INTO `flow_table_details` VALUES ('2a60ea5f5ee443b3888637255b39fbf0', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '8cb4696290fc4d729fad9c34f9d90362', '2018-10-29 16:21:01');
INSERT INTO `flow_table_details` VALUES ('2b4a9921205e480cb0d903432312cbd6', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'f954d0bf2f6f4db1a3b97e824330fa3b', '2018-10-29 15:42:02');
INSERT INTO `flow_table_details` VALUES ('2bc85eae5eba4ed58cdaf505c575860e', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '002bd68cb623477698f6c54e1e255f2e', '2018-10-29 15:33:04');
INSERT INTO `flow_table_details` VALUES ('2c697661120f4e38b689cc2dbdf4208f', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '2f5505042111423b8520feda4866b6bb', '2018-10-29 16:09:01');
INSERT INTO `flow_table_details` VALUES ('2c7b167facdc4bb8b6139e30a9523f3a', 'Initial-11', null, null, null, null, null, null, null, '38871150', '18446744073709551615', null, null, null, null, null, null, null, '35020', '8b64d274999b43adb27a32021ccd2873', '2018-10-29 16:12:02');
INSERT INTO `flow_table_details` VALUES ('2c82df90a86b4970a8d7f9a42eb73645', 'Initial-14', null, null, null, null, null, null, null, '1777099', '18446744073709551615', null, null, null, null, null, null, null, '2048', '6f06375f89df4253a36d37e323c2c2a2', '2018-10-29 15:00:13');
INSERT INTO `flow_table_details` VALUES ('2c8845118f5d4756ace469826268db94', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', '12e071b8ec6c4668a5aed2aa80c6bd61', '2018-10-29 15:42:02');
INSERT INTO `flow_table_details` VALUES ('2c9963acde18498a9cf7ada7f433945a', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '3bf34a9d729b4c4bbc9a29ff88be058e', '2018-10-29 15:42:05');
INSERT INTO `flow_table_details` VALUES ('2cf1c770007e40c4a4d693fe3569c4a5', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '32487edbcfc54f6a8a0fe1c101b60eb5', '2018-10-29 15:27:04');
INSERT INTO `flow_table_details` VALUES ('2d19157139454ddfae6aa5a5d1f02191', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'a1f0aa80cb254675a3dbabc0abc23a39', '2018-10-29 15:06:05');
INSERT INTO `flow_table_details` VALUES ('2d1cbf05e5e9407dbce97dfc8725e668', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '52882f8d57bf4ab891818de6e7f4abe3', '2018-10-29 14:57:04');
INSERT INTO `flow_table_details` VALUES ('2d231d3b57ef4908b3634045e4f9baff', 'Initial-19', null, null, null, null, null, null, null, '28625139', '18446744073709551615', null, null, null, null, null, null, null, '35020', '8e6b6a41860e4de6b689c5b2af727e6d', '2018-10-29 15:24:01');
INSERT INTO `flow_table_details` VALUES ('2da92373209c4461b8ed625110cc994f', 'Initial-3', null, null, null, null, null, null, null, '28903939', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'ef781f6682344297b478f4f3a4cc2d90', '2018-10-29 16:24:01');
INSERT INTO `flow_table_details` VALUES ('2dca7d85a90543dd8edff0e4551859bf', 'Initial-14', null, null, null, null, null, null, null, '1782216', '18446744073709551615', null, null, null, null, null, null, null, '2048', '6d60c8c64f4741a59fa9afc083663fbb', '2018-10-29 15:12:06');
INSERT INTO `flow_table_details` VALUES ('2df9720495c74ecf8c9451a5ea6b904a', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '2cbf921c307b4e2d8b5a7301fe79207b', '2018-10-29 16:03:04');
INSERT INTO `flow_table_details` VALUES ('2dfe1ccbc59b4eb982447e6ea513d239', 'Initial-11', null, null, null, null, null, null, null, '38632980', '18446744073709551615', null, null, null, null, null, null, null, '35020', '93d1c23f8f094cbeb68193f6793e3ee8', '2018-10-29 15:33:00');
INSERT INTO `flow_table_details` VALUES ('2f66ce48a1b94448af891f0bf457427b', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '4068e9844ca545e8a82d6888104b19a1', '2018-10-29 16:03:02');
INSERT INTO `flow_table_details` VALUES ('2fcdad79929142c6bfed8d77c3cd20fc', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'cec360aa124c4e6e9d3e0bb196c694b9', '2018-10-29 15:18:01');
INSERT INTO `flow_table_details` VALUES ('2ff2b50ac71a494fb982a2d02ee368e2', 'Initial-13', null, null, null, null, null, null, null, '28590885', '18446744073709551615', null, null, null, null, null, null, null, '35020', '05902e7804344e6191975c6c63e161db', '2018-10-29 15:15:06');
INSERT INTO `flow_table_details` VALUES ('3097adb6be65409c9c5d1ae2e419604a', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '05902e7804344e6191975c6c63e161db', '2018-10-29 15:15:06');
INSERT INTO `flow_table_details` VALUES ('32e684585ce0452b93402e7189a3ccbd', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'f66205d09241432d82ef4da889e0f537', '2018-10-29 15:06:04');
INSERT INTO `flow_table_details` VALUES ('330150d470724353b471ab042444f0e2', 'Initial-13', null, null, null, null, null, null, null, '28508642', '18446744073709551615', null, null, null, null, null, null, null, '35020', '4ee8de322f75449cb7cfc85b3fd7d84d', '2018-10-29 14:57:04');
INSERT INTO `flow_table_details` VALUES ('332265cb23424d0991f5f5244028a0ec', 'Initial-14', null, null, null, null, null, null, null, '1782590', '18446744073709551615', null, null, null, null, null, null, null, '2048', '3a63b82743b54cdc9c1b9704b2184eb7', '2018-10-29 15:30:10');
INSERT INTO `flow_table_details` VALUES ('33e0b2ffc9cf452ebbc878417007f5f5', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'ef781f6682344297b478f4f3a4cc2d90', '2018-10-29 16:24:01');
INSERT INTO `flow_table_details` VALUES ('342761c7d9a14975bba60b2aa4719430', 'Initial-10', null, null, null, null, null, null, null, '38412660', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'c2e33ec292554668bb8073f1881d17a4', '2018-10-29 14:57:05');
INSERT INTO `flow_table_details` VALUES ('3496948fed044e76a0eb2b8f3d8609d8', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', '6f7b29c0f7144faaa28820ad6bace0b7', '2018-10-29 16:21:01');
INSERT INTO `flow_table_details` VALUES ('34cc5e4826d948e785454df95a42c866', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '68c0945d9a82438eb955eb5d5cd3f349', '2018-10-29 15:03:39');
INSERT INTO `flow_table_details` VALUES ('34f117f780ed4d71b4af1310d93b9825', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', 'c5f5f8e176da466393829b21c671650a', '2018-10-29 16:03:01');
INSERT INTO `flow_table_details` VALUES ('357aba46802541a0bee0850db8d3385c', 'Initial-15', null, null, null, null, null, null, null, '237504', '18446744073709551615', null, null, null, null, null, null, null, '2054', '470f157d77ff4dc3a932c95715c92ee2', '2018-10-29 15:15:08');
INSERT INTO `flow_table_details` VALUES ('367347324d8f41c0917cbfa644b9c051', 'Initial-20', null, null, null, null, null, null, null, '164605', '18446744073709551615', null, null, null, null, null, null, null, '0', '461aedf7659345339973b9ced3791a86', '2018-10-29 06:03:01');
INSERT INTO `flow_table_details` VALUES ('377d7b58cf2b41d7afb626fe1d5a6a98', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'f15b1aaaf5944f74b9ec133a6b946b12', '2018-10-29 16:12:05');
INSERT INTO `flow_table_details` VALUES ('379cf697f44a4b019039be22372cce14', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '2fcfe12fc8ca43258e4d3e8382c70ce6', '2018-10-29 16:06:04');
INSERT INTO `flow_table_details` VALUES ('37efe7284c614ffa9c0b27b7718e0032', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '2e0d3e8a1e55443aa003c2a7c0d77d5a', '2018-10-29 15:42:04');
INSERT INTO `flow_table_details` VALUES ('382425a871b945bc9e526992d4730354', 'Initial-10', null, null, null, null, null, null, null, '38486100', '18446744073709551615', null, null, null, null, null, null, null, '35020', '32f549381b8542d6b539a814226a5478', '2018-10-29 15:09:03');
INSERT INTO `flow_table_details` VALUES ('39fe22cc542b4fc18e979ca8b6fccd74', 'Initial-15', null, null, null, null, null, null, null, '237504', '18446744073709551615', null, null, null, null, null, null, null, '2054', '6d60c8c64f4741a59fa9afc083663fbb', '2018-10-29 15:12:05');
INSERT INTO `flow_table_details` VALUES ('3c6a6524900e49619e10a706c7c77f8e', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '2fcfe12fc8ca43258e4d3e8382c70ce6', '2018-10-29 16:06:03');
INSERT INTO `flow_table_details` VALUES ('3d0baf885b4d459cb7f09a6088e75dd3', 'Initial-1', null, null, null, null, null, null, null, '163775', '18446744073709551615', null, null, null, null, null, null, null, '0', '6f06375f89df4253a36d37e323c2c2a2', '2018-10-29 15:00:13');
INSERT INTO `flow_table_details` VALUES ('3d293d7c535745ad88d4a5717f09094a', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', 'fe99c08332b84cf5b7cc4b189793c53b', '2018-10-29 15:30:12');
INSERT INTO `flow_table_details` VALUES ('3dce1a62c2bf46c4806c8de15207b683', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '3291b001a3884a5b863f50fe6d74429e', '2018-10-29 15:24:03');
INSERT INTO `flow_table_details` VALUES ('3e14821dd6894e93a2c70103f3f4a9e5', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'e0891d93624b443796a43d4df8ec3b5b', '2018-10-29 15:09:03');
INSERT INTO `flow_table_details` VALUES ('3e7622c5d6e541379514e5824a9a4965', 'Initial-27', null, null, null, null, null, null, null, '28760859', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'd58f3b3e3d6a42eab1fad22f47a56a57', '2018-10-29 15:54:03');
INSERT INTO `flow_table_details` VALUES ('3efd6fc13fe54d698a6dccf8e46d1c18', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'a5ccc86d348f4e34ba23c6b435506774', '2018-10-29 15:33:02');
INSERT INTO `flow_table_details` VALUES ('3f1c44fce413481089c66299f0115442', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'fbb747803abe4737a651898b19344b63', '2018-10-29 15:39:07');
INSERT INTO `flow_table_details` VALUES ('3f2c2bd344cd4f418f890a586425a656', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '02b3a20f135e48a792a268656c5f56a2', '2018-10-29 15:33:04');
INSERT INTO `flow_table_details` VALUES ('3f9a25658dd54794838cbe09b014289c', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'dab6f60e802b49908fa41db291341c31', '2018-10-29 15:21:04');
INSERT INTO `flow_table_details` VALUES ('3fc9c7d48f9f4856a45bdf172975d252', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'f66205d09241432d82ef4da889e0f537', '2018-10-29 15:06:04');
INSERT INTO `flow_table_details` VALUES ('3fdd57cc08cb4c89b3da6d87c13cd4be', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '525ee1d40445461494b165f3434c35dc', '2018-10-29 15:45:02');
INSERT INTO `flow_table_details` VALUES ('3ff40ce3f4e64fd8b202183863991a3d', 'Initial-1', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', '3a63b82743b54cdc9c1b9704b2184eb7', '2018-10-29 15:30:09');
INSERT INTO `flow_table_details` VALUES ('403613463ad44793a41a8cbd5f16ba00', 'Initial-22', null, null, null, null, null, null, null, '238080', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'ed6985cae06d4f83b259390da7d00004', '2018-10-29 15:45:03');
INSERT INTO `flow_table_details` VALUES ('408e12d7aa5748829b950137e7fcd139', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '4dd8e96953a14856ac52b958db8ce45e', '2018-10-29 15:27:03');
INSERT INTO `flow_table_details` VALUES ('40ca7e93da7440b183bd7a5dc1560469', 'Initial-15', null, null, null, null, null, null, null, '237184', '18446744073709551615', null, null, null, null, null, null, null, '2054', '6f06375f89df4253a36d37e323c2c2a2', '2018-10-29 15:00:13');
INSERT INTO `flow_table_details` VALUES ('418e0d5b23174a2c80be5e3895d27b88', 'Initial-7', null, null, null, null, null, null, null, '28913672', '18446744073709551615', null, null, null, null, null, null, null, '35020', '3bf34a9d729b4c4bbc9a29ff88be058e', '2018-10-29 15:42:05');
INSERT INTO `flow_table_details` VALUES ('42e1ce4666f7423eb4b62dc6451b351b', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'bed8f9bb55da4716885d757210c8c803', '2018-10-29 15:00:14');
INSERT INTO `flow_table_details` VALUES ('42f8d89c31b84539a4721e55983c53da', 'Initial-21', null, null, null, null, null, null, null, '1782933', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'ed6985cae06d4f83b259390da7d00004', '2018-10-29 15:45:03');
INSERT INTO `flow_table_details` VALUES ('435e30f4731b40b3b32a686d3dc27216', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'a5ccc86d348f4e34ba23c6b435506774', '2018-10-29 15:33:03');
INSERT INTO `flow_table_details` VALUES ('4376047255084c51a23d0275f54a7ad7', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '594c6c24269646b7a6c181fa414ab679', '2018-10-29 16:21:03');
INSERT INTO `flow_table_details` VALUES ('44bbed993212498897902a2f2dcf3890', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'dc636eaf8e664121ac70059217f4399c', '2018-10-29 16:20:33');
INSERT INTO `flow_table_details` VALUES ('44d7996d410643c4b2f3b3d320b2d632', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '3a71bf64168d4a519697c4b810a155ad', '2018-10-29 16:12:01');
INSERT INTO `flow_table_details` VALUES ('458003bc40c6483385faf348f7157776', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '2cbf921c307b4e2d8b5a7301fe79207b', '2018-10-29 16:03:04');
INSERT INTO `flow_table_details` VALUES ('45cf80a78e824418ad46b5f1e441e563', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'ef781f6682344297b478f4f3a4cc2d90', '2018-10-29 16:24:01');
INSERT INTO `flow_table_details` VALUES ('463ce998737d44f4b5cca9caa1d12c56', 'Initial-3', null, null, null, null, null, null, null, '29354191', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'b7eced8931334fa284b58ca36ae2f168', '2018-10-29 06:03:00');
INSERT INTO `flow_table_details` VALUES ('467544363cd5415fa29b76516e1771ec', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '5b48c2401b164d50a2945455e995792c', '2018-10-29 16:00:11');
INSERT INTO `flow_table_details` VALUES ('4684d228349b42a08d735f82c61e8bf3', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '002bd68cb623477698f6c54e1e255f2e', '2018-10-29 15:33:03');
INSERT INTO `flow_table_details` VALUES ('46c19a61ce91437ca5fcf56ead1b312e', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '804a137e008248adb4bbb282215fb658', '2018-10-29 15:12:02');
INSERT INTO `flow_table_details` VALUES ('46d7a64c86844bca89139465cd71e516', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'ccab86b89aa84162b6a035732b8dcd3e', '2018-10-29 15:30:11');
INSERT INTO `flow_table_details` VALUES ('4761cda705f34045bc96302b861e2af0', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', '9aab68903b404fc8bd65181966924a19', '2018-10-29 16:12:00');
INSERT INTO `flow_table_details` VALUES ('47637324f74f49dd8b304d16d0da023d', 'Initial-23', null, null, null, null, null, null, null, '28875276', '18446744073709551615', null, null, null, null, null, null, null, '35020', '6f7b29c0f7144faaa28820ad6bace0b7', '2018-10-29 16:21:02');
INSERT INTO `flow_table_details` VALUES ('47c22d495ecc40e1b8a7c71d609d7281', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'c464ce3089e74afeb127f0676e463f2e', '2018-10-29 15:54:01');
INSERT INTO `flow_table_details` VALUES ('483266d74994407898e1c88e9598cea8', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'e0891d93624b443796a43d4df8ec3b5b', '2018-10-29 15:09:02');
INSERT INTO `flow_table_details` VALUES ('486b11a3cba7431d8cea49be0849136d', 'Initial-10', null, null, null, null, null, null, null, '38467740', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'fe32b9bed356438aa86080b90efe8a18', '2018-10-29 15:06:06');
INSERT INTO `flow_table_details` VALUES ('487a9a18ef884710a24c5e7d0625b929', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'b7eced8931334fa284b58ca36ae2f168', '2018-10-29 06:03:01');
INSERT INTO `flow_table_details` VALUES ('48c665815e004c69ae5bff334ed33c51', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'e0aa0bb7800646ef8e5282ff2d80bd3d', '2018-10-29 16:06:02');
INSERT INTO `flow_table_details` VALUES ('48cc95c109e54e33963ade438bc803f9', 'Initial-19', null, null, null, null, null, null, null, '28653037', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'ccab86b89aa84162b6a035732b8dcd3e', '2018-10-29 15:30:11');
INSERT INTO `flow_table_details` VALUES ('4962ec545af0454d996fee14b8207134', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '9ccd6f018f6a44ae91dfd41f4fbc1a5b', '2018-10-29 16:15:03');
INSERT INTO `flow_table_details` VALUES ('4978de6f6bd54b52b7a343343e870b71', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '05902e7804344e6191975c6c63e161db', '2018-10-29 15:15:05');
INSERT INTO `flow_table_details` VALUES ('4a18bd31650f488eba30d76a22208d2a', 'Initial-7', null, null, null, null, null, null, null, '29036089', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'ec01138c5e274161bb9aa0d27996d33d', '2018-10-29 16:09:03');
INSERT INTO `flow_table_details` VALUES ('4af33bd43cf542acbb1180569489265e', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'c2e33ec292554668bb8073f1881d17a4', '2018-10-29 14:57:06');
INSERT INTO `flow_table_details` VALUES ('4c5f2682b3054a96badfd6161112ccea', 'Initial-7', null, null, null, null, null, null, null, '28968248', '18446744073709551615', null, null, null, null, null, null, null, '35020', '5fa0cf44f96e4b9795daccce16fd8085', '2018-10-29 15:54:02');
INSERT INTO `flow_table_details` VALUES ('4cc228138f2f49beb73f0395c1d6bfd6', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '53e3d493ba824cf3aee7fbe00a2670bb', '2018-10-29 15:21:03');
INSERT INTO `flow_table_details` VALUES ('4d33eea779cc49d482eeda41ca80ab2c', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'be843cbd9f35483fa88f2d3a77a9af1e', '2018-10-29 14:57:07');
INSERT INTO `flow_table_details` VALUES ('4d3c6fbd1aec4d9b8a69dee448baaa49', 'Initial-1', null, null, null, null, null, null, null, '163849', '18446744073709551615', null, null, null, null, null, null, null, '0', '0ee8e1988e3b451ea56bf2f9dc9d49fd', '2018-10-29 15:27:01');
INSERT INTO `flow_table_details` VALUES ('4dbc072fac3a467b8e177b3fa8e137c3', 'Initial-14', null, null, null, null, null, null, null, '1782216', '18446744073709551615', null, null, null, null, null, null, null, '2048', '470f157d77ff4dc3a932c95715c92ee2', '2018-10-29 15:15:08');
INSERT INTO `flow_table_details` VALUES ('4f0969ba69ba4fed8351f69166acc25f', 'Initial-15', null, null, null, null, null, null, null, '237184', '18446744073709551615', null, null, null, null, null, null, null, '2054', '4ac3b4e6360e42d4a65e9797e1adf827', '2018-10-29 15:03:42');
INSERT INTO `flow_table_details` VALUES ('4f5f062fbd7d44e2997ba15c723e15a0', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '93d1c23f8f094cbeb68193f6793e3ee8', '2018-10-29 15:33:01');
INSERT INTO `flow_table_details` VALUES ('502e982e8628446ebc838ce8f1d9b989', 'Initial-21', null, null, null, null, null, null, null, '1783120', '18446744073709551615', null, null, null, null, null, null, null, '2048', '6f7b29c0f7144faaa28820ad6bace0b7', '2018-10-29 16:21:02');
INSERT INTO `flow_table_details` VALUES ('5050f0b48fa94794bc55c07b812a5e5c', 'Initial-27', null, null, null, null, null, null, null, '28842291', '18446744073709551615', null, null, null, null, null, null, null, '35020', '566db1a8018b41cfa7b93cc73061652c', '2018-10-29 16:12:03');
INSERT INTO `flow_table_details` VALUES ('506dfa56121547628dfe89fd4a486ef5', 'Initial-21', null, null, null, null, null, null, null, '1782933', '18446744073709551615', null, null, null, null, null, null, null, '2048', '165d0505d95647d3b084ef25a1115510', '2018-10-29 16:03:05');
INSERT INTO `flow_table_details` VALUES ('512c4ddcc5924b9d8b6f35bcb300e26f', 'Initial-21', null, null, null, null, null, null, null, '1782746', '18446744073709551615', null, null, null, null, null, null, null, '2048', '88516728318e4686906a6d064ad48cdf', '2018-10-29 15:39:08');
INSERT INTO `flow_table_details` VALUES ('51409a59e3e84b518224a166f1e164bb', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '32f549381b8542d6b539a814226a5478', '2018-10-29 15:09:04');
INSERT INTO `flow_table_details` VALUES ('518d20d0a8574afdb057cba30211ab41', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '566db1a8018b41cfa7b93cc73061652c', '2018-10-29 16:12:04');
INSERT INTO `flow_table_details` VALUES ('5336daeb7efb4e76bea8952569d9189f', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'a069f9274939444a9c741cb5c5bc8150', '2018-10-29 15:24:04');
INSERT INTO `flow_table_details` VALUES ('5377f5a24fbd4f10b9a748b239600bc3', 'Initial-7', null, null, null, null, null, null, null, '28845452', '18446744073709551615', null, null, null, null, null, null, null, '35020', '9e166e96e52d4ea7937dd90be1f3ba22', '2018-10-29 15:27:05');
INSERT INTO `flow_table_details` VALUES ('53ec58fd91914014b9fba8fd56c25654', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '16edc8214e414f179bdba1f2f912aad3', '2018-10-29 15:30:10');
INSERT INTO `flow_table_details` VALUES ('54720f0fc22c481fb614859420586426', 'Initial-7', null, null, null, null, null, null, null, '28790876', '18446744073709551615', null, null, null, null, null, null, null, '35020', '959190478ef34b0ebacc3ce4082ffa0a', '2018-10-29 15:15:07');
INSERT INTO `flow_table_details` VALUES ('549c9bc2598f4f189a01845ae6484444', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '3664907d91764c81be1edda992832209', '2018-10-29 16:20:34');
INSERT INTO `flow_table_details` VALUES ('5543363057124f5ba12df3b8d1e3a5db', 'Initial-7', null, null, null, null, null, null, null, '29104688', '18446744073709551615', null, null, null, null, null, null, null, '35020', '139731b58f814cca8307b02e125add96', '2018-10-29 16:24:03');
INSERT INTO `flow_table_details` VALUES ('55bd0527ab97410b932533af4371a690', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '835d4e7ecb2d4333ab49e51ad709e8bf', '2018-10-29 15:42:01');
INSERT INTO `flow_table_details` VALUES ('5636acbc66e6407d846439b2fb88d970', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '8d5e5a6d509449ce90490f92575ae8ca', '2018-10-29 15:12:04');
INSERT INTO `flow_table_details` VALUES ('5667569f6ad246fabd6a62037244f63c', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '267cd5f5b4b34793922923c7031ed019', '2018-10-29 16:24:04');
INSERT INTO `flow_table_details` VALUES ('5697513697b545d9953913ad7cc36cc9', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '5628d04965f247eaa092fbba1b421296', '2018-10-29 16:03:03');
INSERT INTO `flow_table_details` VALUES ('5727f85514964919bf00e1ee0d015fec', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'dab6f60e802b49908fa41db291341c31', '2018-10-29 15:21:03');
INSERT INTO `flow_table_details` VALUES ('57e8ec6dcbdf4c849b506b3f917fd5cd', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '3664907d91764c81be1edda992832209', '2018-10-29 16:20:34');
INSERT INTO `flow_table_details` VALUES ('57ebecf10c9b45c8983cb2e2188f217a', 'Initial-14', null, null, null, null, null, null, null, '1776787', '18446744073709551615', null, null, null, null, null, null, null, '2048', '8d3dc0d3befb49a2b02b9a7945462a62', '2018-10-29 14:57:07');
INSERT INTO `flow_table_details` VALUES ('587bc371c1c14a45a9eccfbc49b3e5e8', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'ad8f9291a1a04887a8658570467b2138', '2018-10-29 15:18:01');
INSERT INTO `flow_table_details` VALUES ('58aa0f2fcf4e4ec5a7fa3d04e54b217b', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '97fea92a7cb04b70a911b44c15d72436', '2018-10-29 16:09:02');
INSERT INTO `flow_table_details` VALUES ('58bc7d53834a44309fd83205b1c4fbd2', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '0a14d44c456742598ea6a33cc09065f9', '2018-10-29 16:00:10');
INSERT INTO `flow_table_details` VALUES ('58c53fda47b24d1bbbc0ef7c9b234755', 'Initial-22', null, null, null, null, null, null, null, '257472', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'd34aa652a30f40a7935bb60b824ae71d', '2018-10-29 16:09:04');
INSERT INTO `flow_table_details` VALUES ('58c8c7eacd0846a4bed157a51dbdd29b', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '4bb9f3e0ed2e4c7a9355734bad61b720', '2018-10-29 16:21:03');
INSERT INTO `flow_table_details` VALUES ('599a0cc8df084832ad971baa9e4d8038', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '31a5b7123e0c40759015fbfd3c97f519', '2018-10-29 15:03:41');
INSERT INTO `flow_table_details` VALUES ('59df6a8baaa14076a9266fadf8253edc', 'Initial-7', null, null, null, null, null, null, null, '28763588', '18446744073709551615', null, null, null, null, null, null, null, '35020', '1dfa0203103747f0aada13b57704830b', '2018-10-29 15:09:02');
INSERT INTO `flow_table_details` VALUES ('5a885d4ce48e473f8d1fecb6efe79b9a', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '2b40f6614e424820899ed7bb52f9b007', '2018-10-29 15:39:09');
INSERT INTO `flow_table_details` VALUES ('5b1c23c99e4f47c394eda9a6fca108a4', 'Initial-10', null, null, null, null, null, null, null, '38522820', '18446744073709551615', null, null, null, null, null, null, null, '35020', '32f03ed7e7db457d8014cbdf7c3d8a13', '2018-10-29 15:15:03');
INSERT INTO `flow_table_details` VALUES ('5b33ee561af648999d48d8b922828e17', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'ec01138c5e274161bb9aa0d27996d33d', '2018-10-29 16:09:02');
INSERT INTO `flow_table_details` VALUES ('5c323cdcad534ba5b1b5bf89ab296a5b', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'ccab86b89aa84162b6a035732b8dcd3e', '2018-10-29 15:30:12');
INSERT INTO `flow_table_details` VALUES ('5d4a3d98d3dd41f8955b06e43e6cec97', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '2d28692a547641249f24b77435a2b1d9', '2018-10-29 15:12:02');
INSERT INTO `flow_table_details` VALUES ('5d6386685b864c4ba44066764ac5f318', 'Initial-23', null, null, null, null, null, null, null, '28658124', '18446744073709551615', null, null, null, null, null, null, null, '35020', '97aad152b0a4400bb9f203353798bf05', '2018-10-29 15:33:02');
INSERT INTO `flow_table_details` VALUES ('5d8419e68a244929bd4e10170baa0f83', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'f15b1aaaf5944f74b9ec133a6b946b12', '2018-10-29 16:12:05');
INSERT INTO `flow_table_details` VALUES ('5d846146687b421aa2c661e54bb9b779', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', '1333dec5637d4cb99f978750181b4848', '2018-10-29 16:15:00');
INSERT INTO `flow_table_details` VALUES ('5dfd1c6977334645b6d7e185164a7ed1', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'a069f9274939444a9c741cb5c5bc8150', '2018-10-29 15:24:03');
INSERT INTO `flow_table_details` VALUES ('5f448715e1bf43c3b360ef1e0cbd60c5', 'Initial-3', null, null, null, null, null, null, null, '28795545', '18446744073709551615', null, null, null, null, null, null, null, '35020', '5b48c2401b164d50a2945455e995792c', '2018-10-29 16:00:10');
INSERT INTO `flow_table_details` VALUES ('5f90610f947540e2ba1b51a7219d77bf', 'Initial-23', null, null, null, null, null, null, null, '28807793', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'c523ad19ed5c45a78e255f9b04663c67', '2018-10-29 16:06:05');
INSERT INTO `flow_table_details` VALUES ('5fafa784b9054ca387706f89520903bc', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '1dfa0203103747f0aada13b57704830b', '2018-10-29 15:09:02');
INSERT INTO `flow_table_details` VALUES ('605b5485510e4e8d928bb8764aac1744', 'Initial-20', null, null, null, null, null, null, null, '164130', '18446744073709551615', null, null, null, null, null, null, null, '0', '1eec031987cf417f8720c055ae728f59', '2018-10-29 16:24:01');
INSERT INTO `flow_table_details` VALUES ('60b5be41ebc548b4bb0ef0f3a7fd5921', 'Initial-23', null, null, null, null, null, null, null, '28834560', '18446744073709551615', null, null, null, null, null, null, null, '35020', '9aab68903b404fc8bd65181966924a19', '2018-10-29 16:12:01');
INSERT INTO `flow_table_details` VALUES ('613b3380f2fc4b1bb0baaf3e393e0df6', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '322ebda4e25d447fba4effd0bfb5c369', '2018-10-29 15:12:04');
INSERT INTO `flow_table_details` VALUES ('6202710a104d47089c703a084782bb4e', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '3bf34a9d729b4c4bbc9a29ff88be058e', '2018-10-29 15:42:04');
INSERT INTO `flow_table_details` VALUES ('6217e7bcb88140fe9231bff4a94d255d', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '2ba3c76b8b1847a781376945df504044', '2018-10-29 15:39:11');
INSERT INTO `flow_table_details` VALUES ('62394fec80414206a03cb12c9489df4b', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', 'fe32b9bed356438aa86080b90efe8a18', '2018-10-29 15:06:06');
INSERT INTO `flow_table_details` VALUES ('6260c934d15a4cd081874c6fd8e4e3e4', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '9e166e96e52d4ea7937dd90be1f3ba22', '2018-10-29 15:27:04');
INSERT INTO `flow_table_details` VALUES ('6275f93ca6e848538d8e486245397112', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '1a65b5ddfde44aa8a68137a06db0ea27', '2018-10-29 15:27:02');
INSERT INTO `flow_table_details` VALUES ('627b0e2943ef40dfa57ea9e58f768094', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'e3c3d1208ae34658a922f684a5fcf7a1', '2018-10-29 15:09:06');
INSERT INTO `flow_table_details` VALUES ('63d8af9279ac4de9ab231f0d8ba137f2', 'Initial-7', null, null, null, null, null, null, null, '28831808', '18446744073709551615', null, null, null, null, null, null, null, '35020', '68f9ba82cc2d45f789811c5967c91a34', '2018-10-29 15:24:05');
INSERT INTO `flow_table_details` VALUES ('6461634e73f343c48ac6771bc16cf039', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '00c656e5b85c477d90afe6515e33a247', '2018-10-29 16:20:34');
INSERT INTO `flow_table_details` VALUES ('646d22cd716b4b16bf6f90d89ec4099d', 'Initial-21', null, null, null, null, null, null, null, '1783120', '18446744073709551615', null, null, null, null, null, null, null, '2048', '214f428a61b744bf867cbce7df6a2e1c', '2018-10-29 16:20:32');
INSERT INTO `flow_table_details` VALUES ('64b06c182e3b4157b93f353913bf6847', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '31a5b7123e0c40759015fbfd3c97f519', '2018-10-29 15:03:41');
INSERT INTO `flow_table_details` VALUES ('64b932144b54474b9d4317b89df09b69', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'f15b1aaaf5944f74b9ec133a6b946b12', '2018-10-29 16:12:05');
INSERT INTO `flow_table_details` VALUES ('659e67e558564739af7bd7899c81b626', 'Initial-3', null, null, null, null, null, null, null, '28888400', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'b9430fe211484dbb80d2e3774bdf1b60', '2018-10-29 16:20:35');
INSERT INTO `flow_table_details` VALUES ('65e4eb42cdbd4cd9a5879c74dd6ba4d7', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '00c656e5b85c477d90afe6515e33a247', '2018-10-29 16:20:34');
INSERT INTO `flow_table_details` VALUES ('666d4bbc57d143a09915bac7530ddcd9', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '13c866074d4e48a9a29249fa9c98085d', '2018-10-29 15:15:04');
INSERT INTO `flow_table_details` VALUES ('66b45095382848d2a0502dc6726d6256', 'Initial-3', null, null, null, null, null, null, null, '28672370', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'a5ccc86d348f4e34ba23c6b435506774', '2018-10-29 15:33:02');
INSERT INTO `flow_table_details` VALUES ('676943ae182949c89152dc289ed55777', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '5b48c2401b164d50a2945455e995792c', '2018-10-29 16:00:10');
INSERT INTO `flow_table_details` VALUES ('68266492f57b484aa4eb79d00bc82f58', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '959190478ef34b0ebacc3ce4082ffa0a', '2018-10-29 15:15:07');
INSERT INTO `flow_table_details` VALUES ('6851756cf11049f2a61fbf75474308d9', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '32f03ed7e7db457d8014cbdf7c3d8a13', '2018-10-29 15:15:04');
INSERT INTO `flow_table_details` VALUES ('68f0ca63f69f4e6992ae1e080cabc59f', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'aa7d74f81a734763ba13cb784f6c0076', '2018-10-29 15:30:09');
INSERT INTO `flow_table_details` VALUES ('68fadd02b6434be891e32a0939fa57ae', 'Initial-27', null, null, null, null, null, null, null, '28788757', '18446744073709551615', null, null, null, null, null, null, null, '35020', '222a73a460a74ab2ac186c75dc1230d1', '2018-10-29 16:00:12');
INSERT INTO `flow_table_details` VALUES ('68feff421af5499083dd26c8e754329e', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '52882f8d57bf4ab891818de6e7f4abe3', '2018-10-29 14:57:03');
INSERT INTO `flow_table_details` VALUES ('69073d7e7d3c439b92d37c2b35f4c8fc', 'Initial-11', null, null, null, null, null, null, null, '38926740', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'cffe4c5bf1eb43648b70bf5170e856ea', '2018-10-29 16:21:04');
INSERT INTO `flow_table_details` VALUES ('6a51aa2914044b64b2af1236fe3db35c', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'f951820d6627430f88a9c5491833d574', '2018-10-29 15:54:03');
INSERT INTO `flow_table_details` VALUES ('6a65ac3d9e654a0aa47de3c56deb1928', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'b03360953abe414688a6da49607d6189', '2018-10-29 16:15:01');
INSERT INTO `flow_table_details` VALUES ('6baea29ab75948c3aff28d1c24c86106', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '16edc8214e414f179bdba1f2f912aad3', '2018-10-29 15:30:10');
INSERT INTO `flow_table_details` VALUES ('6bfd2424c81243e9b672bc2ef727b2f1', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '4bb9f3e0ed2e4c7a9355734bad61b720', '2018-10-29 16:21:04');
INSERT INTO `flow_table_details` VALUES ('6c052608e707450c90acfc07faa13e75', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '2d28692a547641249f24b77435a2b1d9', '2018-10-29 15:12:01');
INSERT INTO `flow_table_details` VALUES ('6c98a93eb31c4b878844b8595fbedc14', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'fe99c08332b84cf5b7cc4b189793c53b', '2018-10-29 15:30:12');
INSERT INTO `flow_table_details` VALUES ('6ccf24ce76bb48d1a9f13c714cb61d13', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '525ee1d40445461494b165f3434c35dc', '2018-10-29 15:45:02');
INSERT INTO `flow_table_details` VALUES ('6d48b5807e204614aa45fd7324a52ddc', 'Initial-3', null, null, null, null, null, null, null, '28822454', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'e0aa0bb7800646ef8e5282ff2d80bd3d', '2018-10-29 16:06:01');
INSERT INTO `flow_table_details` VALUES ('6e0829ee5ba549159e8ba47c14a59044', 'Initial-7', null, null, null, null, null, null, null, '29063756', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'b03360953abe414688a6da49607d6189', '2018-10-29 16:15:02');
INSERT INTO `flow_table_details` VALUES ('6e15dd2fa0234f2ab0372db9e56c535e', 'Initial-10', null, null, null, null, null, null, null, '38540670', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'cec360aa124c4e6e9d3e0bb196c694b9', '2018-10-29 15:18:00');
INSERT INTO `flow_table_details` VALUES ('6e4037b9bb8646488cf20d233aa241e9', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '40adb80e8ffe491386fe9a0141a85b77', '2018-10-29 16:06:01');
INSERT INTO `flow_table_details` VALUES ('6e5524919e6245ea993de139c7b0a1f3', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'fbb747803abe4737a651898b19344b63', '2018-10-29 15:39:07');
INSERT INTO `flow_table_details` VALUES ('6e6b7e3339924f61b9f3c0f80d353950', 'Initial-19', null, null, null, null, null, null, null, '28584423', '18446744073709551615', null, null, null, null, null, null, null, '35020', '13c866074d4e48a9a29249fa9c98085d', '2018-10-29 15:15:05');
INSERT INTO `flow_table_details` VALUES ('6ff342e3043441738aaef6217e1e4a36', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '2cbf921c307b4e2d8b5a7301fe79207b', '2018-10-29 16:03:03');
INSERT INTO `flow_table_details` VALUES ('7007fd64b4c34cdf97bf6c39b470ae1b', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '2b40f6614e424820899ed7bb52f9b007', '2018-10-29 15:39:09');
INSERT INTO `flow_table_details` VALUES ('705152076acc49e1b94a7d1df00f32d5', 'Initial-7', null, null, null, null, null, null, null, '28723035', '18446744073709551615', null, null, null, null, null, null, null, '35020', '65d983905d184106bfa49e29589f952e', '2018-10-29 15:00:10');
INSERT INTO `flow_table_details` VALUES ('707f7a0cff574ea28b3612dde5c15160', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '2ba3c76b8b1847a781376945df504044', '2018-10-29 15:39:10');
INSERT INTO `flow_table_details` VALUES ('7085b6a6c33945bc82d243c6f9dc63d3', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '32487edbcfc54f6a8a0fe1c101b60eb5', '2018-10-29 15:27:04');
INSERT INTO `flow_table_details` VALUES ('709227cc51934f5cb807560832dcadaa', 'Initial-27', null, null, null, null, null, null, null, '28855863', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'ebb4cc98f15a4e3d8f7bffb0b759cecc', '2018-10-29 16:15:03');
INSERT INTO `flow_table_details` VALUES ('70d552bcf3ca4afa9a21236c384b2750', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'aa7d74f81a734763ba13cb784f6c0076', '2018-10-29 15:30:08');
INSERT INTO `flow_table_details` VALUES ('714129c7c74a49fabd62d0cadc5a83c7', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'c2c9217759b04f1bbf8a03e908b5ba17', '2018-10-29 15:18:03');
INSERT INTO `flow_table_details` VALUES ('7147e6227a974a2784afbc298ab73e47', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'cffe803a993748369f3d82d9c5542cae', '2018-10-29 15:03:43');
INSERT INTO `flow_table_details` VALUES ('717f76c8b4954976bf000bb355212216', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '0a14d44c456742598ea6a33cc09065f9', '2018-10-29 16:00:09');
INSERT INTO `flow_table_details` VALUES ('7188b6eca0734ce095f0ab25e7abdf08', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '97fea92a7cb04b70a911b44c15d72436', '2018-10-29 16:09:02');
INSERT INTO `flow_table_details` VALUES ('71d8648e70c74487b197c28e0a2e4358', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', 'f66205d09241432d82ef4da889e0f537', '2018-10-29 15:06:04');
INSERT INTO `flow_table_details` VALUES ('722069472c7348d7a70ce8b58608a17a', 'Initial-11', null, null, null, null, null, null, null, '38687550', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'f954d0bf2f6f4db1a3b97e824330fa3b', '2018-10-29 15:42:01');
INSERT INTO `flow_table_details` VALUES ('72cfb9215fc4485ba90762036b296816', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '7af51fdbed60457389f53f88d7fbbb6c', '2018-10-29 15:45:01');
INSERT INTO `flow_table_details` VALUES ('735338ea07ca46d09629f03be380fc34', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '32f549381b8542d6b539a814226a5478', '2018-10-29 15:09:04');
INSERT INTO `flow_table_details` VALUES ('7380083c660c465b846c7a87ac072890', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'fe99c08332b84cf5b7cc4b189793c53b', '2018-10-29 15:30:12');
INSERT INTO `flow_table_details` VALUES ('738620792f834c9cbb2a6a241dd6b64a', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'ef781f6682344297b478f4f3a4cc2d90', '2018-10-29 16:24:01');
INSERT INTO `flow_table_details` VALUES ('73ca7561276c4d11a0c76fa87599f0f8', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '8cb4696290fc4d729fad9c34f9d90362', '2018-10-29 16:21:01');
INSERT INTO `flow_table_details` VALUES ('73f43c4d2f894dd19fda297f2e26c109', 'Initial-16', null, null, null, null, null, null, null, '28525420', '18446744073709551615', null, null, null, null, null, null, null, '35020', '4ac3b4e6360e42d4a65e9797e1adf827', '2018-10-29 15:03:42');
INSERT INTO `flow_table_details` VALUES ('7431a5efa11d4ac5bb3bc68a43dc205e', 'Initial-11', null, null, null, null, null, null, null, '38798730', '18446744073709551615', null, null, null, null, null, null, null, '35020', '0a14d44c456742598ea6a33cc09065f9', '2018-10-29 16:00:09');
INSERT INTO `flow_table_details` VALUES ('74b7b338019643d1b35d2bc3432c30de', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'be843cbd9f35483fa88f2d3a77a9af1e', '2018-10-29 14:57:08');
INSERT INTO `flow_table_details` VALUES ('7534f2f1f22a4747974ba37f62caa4f4', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'c2c9217759b04f1bbf8a03e908b5ba17', '2018-10-29 15:18:03');
INSERT INTO `flow_table_details` VALUES ('7677329161434ab78944fb639d0f8356', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '2ba3c76b8b1847a781376945df504044', '2018-10-29 15:39:10');
INSERT INTO `flow_table_details` VALUES ('7777', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '5555', '2018-10-23 16:49:55');
INSERT INTO `flow_table_details` VALUES ('778d03342ee043b2a3732ac41039416c', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '65d983905d184106bfa49e29589f952e', '2018-10-29 15:00:10');
INSERT INTO `flow_table_details` VALUES ('7878ee978f4c4a4388b195097d2cc46f', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', '97aad152b0a4400bb9f203353798bf05', '2018-10-29 15:33:01');
INSERT INTO `flow_table_details` VALUES ('78e2425b9e90448586a72c89684b7750', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '3bf34a9d729b4c4bbc9a29ff88be058e', '2018-10-29 15:42:05');
INSERT INTO `flow_table_details` VALUES ('790b042de7a34987897ce74fe6cb9b64', 'Initial-10', null, null, null, null, null, null, null, '38615130', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'aa7d74f81a734763ba13cb784f6c0076', '2018-10-29 15:30:08');
INSERT INTO `flow_table_details` VALUES ('7970cee9b9f64075a1b1f53ddc13c829', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '6496d86943434a00934f6988c31b370f', '2018-10-29 16:15:05');
INSERT INTO `flow_table_details` VALUES ('79f3da92090e4123bcfb977b64ffc388', 'Initial-1', null, null, null, null, null, null, null, '163775', '18446744073709551615', null, null, null, null, null, null, null, '0', '2da5951be28141008081758e71ab9b4a', '2018-10-29 15:06:07');
INSERT INTO `flow_table_details` VALUES ('7aee5c000b3a46ba8c85ac5feb6c794a', 'Initial-1', null, null, null, null, null, null, null, '163775', '18446744073709551615', null, null, null, null, null, null, null, '0', '470f157d77ff4dc3a932c95715c92ee2', '2018-10-29 15:15:08');
INSERT INTO `flow_table_details` VALUES ('7b12d61ea6a84d388b939f68362a7838', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '5b48c2401b164d50a2945455e995792c', '2018-10-29 16:00:11');
INSERT INTO `flow_table_details` VALUES ('7b82ca65a1c3447989142bc3b8726690', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'f954d0bf2f6f4db1a3b97e824330fa3b', '2018-10-29 15:42:02');
INSERT INTO `flow_table_details` VALUES ('7bced239dd9d490198406f54bdb4de4c', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'ddb2dfbac6be4562ada079f9c1e13109', '2018-10-29 15:06:09');
INSERT INTO `flow_table_details` VALUES ('7c125d94746e4297b5fb016cded08756', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '8cb4696290fc4d729fad9c34f9d90362', '2018-10-29 16:21:01');
INSERT INTO `flow_table_details` VALUES ('7d0f9412ada847b6a92ef09918c2ef10', 'Initial-16', null, null, null, null, null, null, null, '28630980', '18446744073709551615', null, null, null, null, null, null, null, '35020', '0ee8e1988e3b451ea56bf2f9dc9d49fd', '2018-10-29 15:27:00');
INSERT INTO `flow_table_details` VALUES ('7d27186db6654329a2abfa79e85036d9', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'ec01138c5e274161bb9aa0d27996d33d', '2018-10-29 16:09:03');
INSERT INTO `flow_table_details` VALUES ('7d4b54aa0d2640938e96861dfac9683b', 'Initial-22', null, null, null, null, null, null, null, '279808', '18446744073709551615', null, null, null, null, null, null, null, '2054', '461aedf7659345339973b9ced3791a86', '2018-10-29 06:03:01');
INSERT INTO `flow_table_details` VALUES ('7f09ad76c96e44dfafeef4cabe2667f4', 'Initial-1', null, null, null, null, null, null, null, '163775', '18446744073709551615', null, null, null, null, null, null, null, '0', '6d60c8c64f4741a59fa9afc083663fbb', '2018-10-29 15:12:05');
INSERT INTO `flow_table_details` VALUES ('7faf7dd1770343668352eb5d2f3d7a02', 'Initial-1', null, null, null, null, null, null, null, '163775', '18446744073709551615', null, null, null, null, null, null, null, '0', '4ac3b4e6360e42d4a65e9797e1adf827', '2018-10-29 15:03:42');
INSERT INTO `flow_table_details` VALUES ('7fd61a4191c44057a8d5acd368b3bd34', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'a1f0aa80cb254675a3dbabc0abc23a39', '2018-10-29 15:06:06');
INSERT INTO `flow_table_details` VALUES ('7fee17eda39c49fa904e635964511e8b', 'Initial-13', null, null, null, null, null, null, null, '28576862', '18446744073709551615', null, null, null, null, null, null, null, '35020', '8d5e5a6d509449ce90490f92575ae8ca', '2018-10-29 15:12:03');
INSERT INTO `flow_table_details` VALUES ('8053a6eb10854dd3bb9c0836a9112287', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '4ee8de322f75449cb7cfc85b3fd7d84d', '2018-10-29 14:57:05');
INSERT INTO `flow_table_details` VALUES ('8126770e454e4a21b59b56b9d0a49fa5', 'Initial-3', null, null, null, null, null, null, null, '28890295', '18446744073709551615', null, null, null, null, null, null, null, '35020', '8cb4696290fc4d729fad9c34f9d90362', '2018-10-29 16:21:00');
INSERT INTO `flow_table_details` VALUES ('816532c6314e4499bf60ef9916a96833', 'Initial-16', null, null, null, null, null, null, null, '28617408', '18446744073709551615', null, null, null, null, null, null, null, '35020', '358b334feaec4a90819e68b03f4ab114', '2018-10-29 15:24:00');
INSERT INTO `flow_table_details` VALUES ('82479641183c4067b7699fce81c93617', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '8e6b6a41860e4de6b689c5b2af727e6d', '2018-10-29 15:24:02');
INSERT INTO `flow_table_details` VALUES ('82cbbf89c1fb46119b36214ec07afb2b', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'ccab86b89aa84162b6a035732b8dcd3e', '2018-10-29 15:30:11');
INSERT INTO `flow_table_details` VALUES ('834aa0be5c304f24b4cf6839df3b1292', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '2f72b8dbca1542b7b8edb7f584cf0150', '2018-10-29 15:18:03');
INSERT INTO `flow_table_details` VALUES ('83883898aba7406aba9e72fff2103ea4', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', 'b17c4254122b45d9835c9f199b26194b', '2018-10-29 16:00:12');
INSERT INTO `flow_table_details` VALUES ('858ce9c5631348688f916ef4864d42f1', 'Initial-16', null, null, null, null, null, null, null, '28590641', '18446744073709551615', null, null, null, null, null, null, null, '35020', '88acc7d9c5cc49b78f6dabe8c7178462', '2018-10-29 15:18:04');
INSERT INTO `flow_table_details` VALUES ('85f088acdb5e412ba365c28b3f695ecb', 'Initial-7', null, null, null, null, null, null, null, '28777232', '18446744073709551615', null, null, null, null, null, null, null, '35020', '322ebda4e25d447fba4effd0bfb5c369', '2018-10-29 15:12:05');
INSERT INTO `flow_table_details` VALUES ('8601ba30b6704b0f83fbc04bb8f3cbb6', 'Initial-13', null, null, null, null, null, null, null, '28563218', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'e0891d93624b443796a43d4df8ec3b5b', '2018-10-29 15:09:03');
INSERT INTO `flow_table_details` VALUES ('864bdaa72f2d43839b21c974ba87c103', 'Initial-11', null, null, null, null, null, null, null, '38669700', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'fbb747803abe4737a651898b19344b63', '2018-10-29 15:39:06');
INSERT INTO `flow_table_details` VALUES ('868a221415d6498ca47e843869bf893e', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '139731b58f814cca8307b02e125add96', '2018-10-29 16:24:03');
INSERT INTO `flow_table_details` VALUES ('86fb9db523784d639392cfc5ed1f582a', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'a069f9274939444a9c741cb5c5bc8150', '2018-10-29 15:24:04');
INSERT INTO `flow_table_details` VALUES ('874fbe9a649e4c8688109ef5a3c42245', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'cf7f3cac7327441f8bec7a03c896c28f', '2018-10-29 15:39:09');
INSERT INTO `flow_table_details` VALUES ('87662f346a81404bb4794802d6dc1790', 'Initial-1', null, null, null, null, null, null, null, '163775', '18446744073709551615', null, null, null, null, null, null, null, '0', '8d3dc0d3befb49a2b02b9a7945462a62', '2018-10-29 14:57:06');
INSERT INTO `flow_table_details` VALUES ('8781e942f5364d7ba20cae2a9da3ff1e', 'Initial-3', null, null, null, null, null, null, null, '28700037', '18446744073709551615', null, null, null, null, null, null, null, '35020', '2b40f6614e424820899ed7bb52f9b007', '2018-10-29 15:39:08');
INSERT INTO `flow_table_details` VALUES ('87f948771f5348e39d116acca1300728', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'c2e33ec292554668bb8073f1881d17a4', '2018-10-29 14:57:05');
INSERT INTO `flow_table_details` VALUES ('884c2748e1d14fc6b9858a978c4086d9', 'Initial-23', null, null, null, null, null, null, null, '28686022', '18446744073709551615', null, null, null, null, null, null, null, '35020', '88516728318e4686906a6d064ad48cdf', '2018-10-29 15:39:08');
INSERT INTO `flow_table_details` VALUES ('8888', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '6666', '2018-10-23 16:50:28');
INSERT INTO `flow_table_details` VALUES ('88883c2e6ba7477381db07908591a001', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'cf7f3cac7327441f8bec7a03c896c28f', '2018-10-29 15:39:10');
INSERT INTO `flow_table_details` VALUES ('88bdfadde74e4af38ac86ce4d22b0f64', 'Initial-3', null, null, null, null, null, null, null, '28713302', '18446744073709551615', null, null, null, null, null, null, null, '35020', '2e0d3e8a1e55443aa003c2a7c0d77d5a', '2018-10-29 15:42:03');
INSERT INTO `flow_table_details` VALUES ('88dbc025fc6c48fd95b6521fc2780d21', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '2ce779d8f4f24432b0f7754045a5a4fa', '2018-10-29 06:03:02');
INSERT INTO `flow_table_details` VALUES ('8a694980247d48969a72a39d98a4bd8f', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'fe32b9bed356438aa86080b90efe8a18', '2018-10-29 15:06:06');
INSERT INTO `flow_table_details` VALUES ('8abf0087a0074b4e820788b7b0eddfbf', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '804a137e008248adb4bbb282215fb658', '2018-10-29 15:12:03');
INSERT INTO `flow_table_details` VALUES ('8b5a56404ee34f67b0b3ed39953fb348', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '8e6b6a41860e4de6b689c5b2af727e6d', '2018-10-29 15:24:02');
INSERT INTO `flow_table_details` VALUES ('8c4f193e8a2d47969cedb8bf370c355d', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '2e0d3e8a1e55443aa003c2a7c0d77d5a', '2018-10-29 15:42:04');
INSERT INTO `flow_table_details` VALUES ('8c8150059a6e4ba599f7c1e15f3e3884', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', 'ec01138c5e274161bb9aa0d27996d33d', '2018-10-29 16:09:03');
INSERT INTO `flow_table_details` VALUES ('8ca6737a996844b2ae3fa23a29853929', 'Initial-19', null, null, null, null, null, null, null, '28597618', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'ad8f9291a1a04887a8658570467b2138', '2018-10-29 15:18:01');
INSERT INTO `flow_table_details` VALUES ('8cb8cfe6895846a28eed540bb78802b2', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'a5cee5cdaea148bda4bc2b30f502c756', '2018-10-29 16:09:04');
INSERT INTO `flow_table_details` VALUES ('8cefeee1888f4dbb8186e4c0154354b4', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'e0891d93624b443796a43d4df8ec3b5b', '2018-10-29 15:09:03');
INSERT INTO `flow_table_details` VALUES ('8d105598c95c45a4881496da96f10ea4', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '5628d04965f247eaa092fbba1b421296', '2018-10-29 16:03:03');
INSERT INTO `flow_table_details` VALUES ('8d5cbc03f9844f9f8d13ca1479b2d782', 'Initial-14', null, null, null, null, null, null, null, '1782403', '18446744073709551615', null, null, null, null, null, null, null, '2048', '88acc7d9c5cc49b78f6dabe8c7178462', '2018-10-29 15:18:05');
INSERT INTO `flow_table_details` VALUES ('8e7e3d56b12a4ca2af235ae0bff6062a', 'Initial-14', null, null, null, null, null, null, null, '1782403', '18446744073709551615', null, null, null, null, null, null, null, '2048', '88788c266b9b4b9bb74c66c1943d8536', '2018-10-29 15:21:01');
INSERT INTO `flow_table_details` VALUES ('8eccdef712044902aba67b954853f3f3', 'Initial-16', null, null, null, null, null, null, null, '28563497', '18446744073709551615', null, null, null, null, null, null, null, '35020', '6d60c8c64f4741a59fa9afc083663fbb', '2018-10-29 15:12:05');
INSERT INTO `flow_table_details` VALUES ('90e8b51c95b5413db8309b4117c987f1', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', 'b03360953abe414688a6da49607d6189', '2018-10-29 16:15:02');
INSERT INTO `flow_table_details` VALUES ('9161be61e8a441a4af4ad75901abdb48', 'Initial-27', null, null, null, null, null, null, null, '28693376', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'cf7f3cac7327441f8bec7a03c896c28f', '2018-10-29 15:39:09');
INSERT INTO `flow_table_details` VALUES ('9188dfe20fb74724a83b3d371711f6a4', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '65d983905d184106bfa49e29589f952e', '2018-10-29 15:00:09');
INSERT INTO `flow_table_details` VALUES ('91f84d1a21ae483089517af70c7957d1', 'Initial-19', null, null, null, null, null, null, null, '28557656', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'e3c3d1208ae34658a922f684a5fcf7a1', '2018-10-29 15:09:05');
INSERT INTO `flow_table_details` VALUES ('92abb7c4e623492db673cffe1018f06c', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '4ee8de322f75449cb7cfc85b3fd7d84d', '2018-10-29 14:57:04');
INSERT INTO `flow_table_details` VALUES ('92ca91c978d54c6b9ab6d714482c75f0', 'Initial-23', null, null, null, null, null, null, null, '28889225', '18446744073709551615', null, null, null, null, null, null, null, '35020', '1eec031987cf417f8720c055ae728f59', '2018-10-29 16:24:02');
INSERT INTO `flow_table_details` VALUES ('935e3fc1885048c9b6e95192da61a28b', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', '946e657dbf944416956f41b15f861f0d', '2018-10-29 15:54:04');
INSERT INTO `flow_table_details` VALUES ('940aa9529f66439da5a050c28b3f8886', 'Initial-27', null, null, null, null, null, null, null, '29344078', '18446744073709551615', null, null, null, null, null, null, null, '35020', '4f899bddc9ed4c3ab44da8bcad84f425', '2018-10-29 06:03:01');
INSERT INTO `flow_table_details` VALUES ('94f369d70f9f4a5fbee380aa25092911', 'Initial-23', null, null, null, null, null, null, null, '28867736', '18446744073709551615', null, null, null, null, null, null, null, '35020', '214f428a61b744bf867cbce7df6a2e1c', '2018-10-29 16:20:32');
INSERT INTO `flow_table_details` VALUES ('955a9eb64ee24bd282b09935034b49ab', 'Initial-27', null, null, null, null, null, null, null, '28665855', '18446744073709551615', null, null, null, null, null, null, null, '35020', '002bd68cb623477698f6c54e1e255f2e', '2018-10-29 15:33:03');
INSERT INTO `flow_table_details` VALUES ('95912be2363e4c858c240e096fa5d09f', 'Initial-1', null, null, null, null, null, null, null, '163775', '18446744073709551615', null, null, null, null, null, null, null, '0', '5b628dc9e9df4312867e90b604da6fd5', '2018-10-29 15:09:04');
INSERT INTO `flow_table_details` VALUES ('95a95fff97014f308e7c95529e8aeb83', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '31a5b7123e0c40759015fbfd3c97f519', '2018-10-29 15:03:42');
INSERT INTO `flow_table_details` VALUES ('95f58e5f8c39477080ffc48225c1f837', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '222a73a460a74ab2ac186c75dc1230d1', '2018-10-29 16:00:12');
INSERT INTO `flow_table_details` VALUES ('9653dd24cb0743c9b4bb860fa870b53f', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '1a65b5ddfde44aa8a68137a06db0ea27', '2018-10-29 15:27:02');
INSERT INTO `flow_table_details` VALUES ('96e4d4154c964b6193d4ece2221203be', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '77309319a25d4091aee3b46891e19185', '2018-10-29 15:45:04');
INSERT INTO `flow_table_details` VALUES ('96f6048d0a434fae8f9420b7ab5ed4e3', 'Initial-3', null, null, null, null, null, null, null, '28835719', '18446744073709551615', null, null, null, null, null, null, null, '35020', '97fea92a7cb04b70a911b44c15d72436', '2018-10-29 16:09:01');
INSERT INTO `flow_table_details` VALUES ('97124022d32441b0816d4d626a28a3dc', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', '165d0505d95647d3b084ef25a1115510', '2018-10-29 16:03:04');
INSERT INTO `flow_table_details` VALUES ('9740baff7f8d49ba9c67807e8241878d', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'f951820d6627430f88a9c5491833d574', '2018-10-29 15:54:03');
INSERT INTO `flow_table_details` VALUES ('97c5d216ba3b4e149c57007e8bcc290a', 'Initial-14', null, null, null, null, null, null, null, '1777099', '18446744073709551615', null, null, null, null, null, null, null, '2048', '2da5951be28141008081758e71ab9b4a', '2018-10-29 15:06:08');
INSERT INTO `flow_table_details` VALUES ('97df96e0f6e74ba3bfd9b3ab6bd27f5f', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '139731b58f814cca8307b02e125add96', '2018-10-29 16:24:03');
INSERT INTO `flow_table_details` VALUES ('97fe5c35d4314a5a934d9c6cb354565d', 'Initial-11', null, null, null, null, null, null, null, '38834430', '18446744073709551615', null, null, null, null, null, null, null, '35020', '40adb80e8ffe491386fe9a0141a85b77', '2018-10-29 16:06:00');
INSERT INTO `flow_table_details` VALUES ('984a93f0e14340bfb37f241eb762534d', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '71613313526748caa433c84117ad2255', '2018-10-29 15:00:11');
INSERT INTO `flow_table_details` VALUES ('99473cf7ce2b401eb3bfde47d617c149', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '4f899bddc9ed4c3ab44da8bcad84f425', '2018-10-29 06:03:02');
INSERT INTO `flow_table_details` VALUES ('99749d8fd271411eb92d51b00bfc11e0', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '2f5505042111423b8520feda4866b6bb', '2018-10-29 16:09:01');
INSERT INTO `flow_table_details` VALUES ('9b2ff9bcd0cf4b1b808170c86bfd4e5d', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'b17c4254122b45d9835c9f199b26194b', '2018-10-29 16:00:11');
INSERT INTO `flow_table_details` VALUES ('9ba16c9eba0949a0a80d57795757fc6e', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'c5f5f8e176da466393829b21c671650a', '2018-10-29 16:03:01');
INSERT INTO `flow_table_details` VALUES ('9bc04fc6089447b1985f62d3de68b886', 'Initial-10', null, null, null, null, null, null, null, '38577900', '18446744073709551615', null, null, null, null, null, null, null, '35020', '3291b001a3884a5b863f50fe6d74429e', '2018-10-29 15:24:02');
INSERT INTO `flow_table_details` VALUES ('9cafecd4ca544608b6290cd214bc8480', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '525ee1d40445461494b165f3434c35dc', '2018-10-29 15:45:02');
INSERT INTO `flow_table_details` VALUES ('9d794d55cabe47c0bd97343d38237f8a', 'Initial-10', null, null, null, null, null, null, null, '38452950', '18446744073709551615', null, null, null, null, null, null, null, '35020', '31a5b7123e0c40759015fbfd3c97f519', '2018-10-29 15:03:41');
INSERT INTO `flow_table_details` VALUES ('9ddfa8dee8734c3f934112f86a0008fc', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '68c0945d9a82438eb955eb5d5cd3f349', '2018-10-29 15:03:39');
INSERT INTO `flow_table_details` VALUES ('9e08ec5b2eae4bc6a2b013ebd24eb7ac', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '97fea92a7cb04b70a911b44c15d72436', '2018-10-29 16:09:02');
INSERT INTO `flow_table_details` VALUES ('9f84be131758455d848ba2896e544ab9', 'Initial-21', null, null, null, null, null, null, null, '1782933', '18446744073709551615', null, null, null, null, null, null, null, '2048', '946e657dbf944416956f41b15f861f0d', '2018-10-29 15:54:05');
INSERT INTO `flow_table_details` VALUES ('9fdbecf5fab147d0acb3a3da9fb99601', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'c8e19eeb344a4296be7cd244d86f5bc2', '2018-10-29 15:45:05');
INSERT INTO `flow_table_details` VALUES ('a0ca9ee110494a96a33e7fbfbc54d928', 'Initial-11', null, null, null, null, null, null, null, '38761500', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'f951820d6627430f88a9c5491833d574', '2018-10-29 15:54:02');
INSERT INTO `flow_table_details` VALUES ('a129ac6cbaa8495888873ca5670f65e8', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '3aa8b853e381431baa21db5443fef560', '2018-10-29 15:21:05');
INSERT INTO `flow_table_details` VALUES ('a17883a222724b4ba8440df18a0b4d8c', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '3291b001a3884a5b863f50fe6d74429e', '2018-10-29 15:24:03');
INSERT INTO `flow_table_details` VALUES ('a255070babd048d9bd6d33d2ec334422', 'Initial-1', null, null, null, null, null, null, null, '163849', '18446744073709551615', null, null, null, null, null, null, null, '0', '358b334feaec4a90819e68b03f4ab114', '2018-10-29 15:24:01');
INSERT INTO `flow_table_details` VALUES ('a2fc7bed7be044b6ae3f493a6532d2c7', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '2ce779d8f4f24432b0f7754045a5a4fa', '2018-10-29 06:03:02');
INSERT INTO `flow_table_details` VALUES ('a3419fabb23d45e5a302ee55c000e439', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'd58f3b3e3d6a42eab1fad22f47a56a57', '2018-10-29 15:54:04');
INSERT INTO `flow_table_details` VALUES ('a3f8acc783aa4b6b9c49193679618758', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '02891b0bdbfa4562810c1371a0024ff6', '2018-10-29 16:24:02');
INSERT INTO `flow_table_details` VALUES ('a428dd9d729241e6a43e95f41600e5a6', 'Initial-3', null, null, null, null, null, null, null, '28726946', '18446744073709551615', null, null, null, null, null, null, null, '35020', '77309319a25d4091aee3b46891e19185', '2018-10-29 15:45:03');
INSERT INTO `flow_table_details` VALUES ('a4e2a89e21254fa6a85f9e653c97389b', 'Initial-27', null, null, null, null, null, null, null, '28720143', '18446744073709551615', null, null, null, null, null, null, null, '35020', '7af51fdbed60457389f53f88d7fbbb6c', '2018-10-29 15:45:00');
INSERT INTO `flow_table_details` VALUES ('a6c4f0964b904153b35af5eb0b82bc55', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'c2c9217759b04f1bbf8a03e908b5ba17', '2018-10-29 15:18:02');
INSERT INTO `flow_table_details` VALUES ('a8651aa005a94125a78452be2e1a852f', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '9e166e96e52d4ea7937dd90be1f3ba22', '2018-10-29 15:27:04');
INSERT INTO `flow_table_details` VALUES ('a95f5af18e0442b1815be24b1c6c875c', 'Initial-22', null, null, null, null, null, null, null, '269888', '18446744073709551615', null, null, null, null, null, null, null, '2054', '1eec031987cf417f8720c055ae728f59', '2018-10-29 16:24:01');
INSERT INTO `flow_table_details` VALUES ('a9a8cf88bb3448c68669e11443ebd73d', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '1dfa0203103747f0aada13b57704830b', '2018-10-29 15:09:01');
INSERT INTO `flow_table_details` VALUES ('aa8d233eff044e93bf77f7a1287b2c3d', 'Initial-13', null, null, null, null, null, null, null, '28604150', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'c2c9217759b04f1bbf8a03e908b5ba17', '2018-10-29 15:18:02');
INSERT INTO `flow_table_details` VALUES ('aafd08d85f144e46932ace5c775563c5', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '322ebda4e25d447fba4effd0bfb5c369', '2018-10-29 15:12:04');
INSERT INTO `flow_table_details` VALUES ('ad295c3070fd470788c8cf5e137c9030', 'Initial-1', null, null, null, null, null, null, null, '163775', '18446744073709551615', null, null, null, null, null, null, null, '0', '88acc7d9c5cc49b78f6dabe8c7178462', '2018-10-29 15:18:04');
INSERT INTO `flow_table_details` VALUES ('ad52d98ce7284a42ae407c5d5df50db4', 'Initial-11', null, null, null, null, null, null, null, '38890020', '18446744073709551615', null, null, null, null, null, null, null, '35020', '9ccd6f018f6a44ae91dfd41f4fbc1a5b', '2018-10-29 16:15:02');
INSERT INTO `flow_table_details` VALUES ('ad69c9c0462442b795f92494496563ba', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '566db1a8018b41cfa7b93cc73061652c', '2018-10-29 16:12:04');
INSERT INTO `flow_table_details` VALUES ('ad9fcc0a870049e8ac3c34f93e58bf7a', 'Initial-23', null, null, null, null, null, null, null, '29336724', '18446744073709551615', null, null, null, null, null, null, null, '35020', '461aedf7659345339973b9ced3791a86', '2018-10-29 06:03:01');
INSERT INTO `flow_table_details` VALUES ('aeec2baf88b44cda81de0ede58b09dcc', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '267cd5f5b4b34793922923c7031ed019', '2018-10-29 16:24:04');
INSERT INTO `flow_table_details` VALUES ('af19ce8c210f4d45b9dfcc9423269ab6', 'Initial-10', null, null, null, null, null, null, null, '38596260', '18446744073709551615', null, null, null, null, null, null, null, '35020', '4dd8e96953a14856ac52b958db8ce45e', '2018-10-29 15:27:02');
INSERT INTO `flow_table_details` VALUES ('af74a0945c9a41a08c0b427f6a009d14', 'Initial-27', null, null, null, null, null, null, null, '28896579', '18446744073709551615', null, null, null, null, null, null, null, '35020', '02891b0bdbfa4562810c1371a0024ff6', '2018-10-29 16:24:02');
INSERT INTO `flow_table_details` VALUES ('b028a3e903544006b0f37f03a9a526ca', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'c0167d353aba48769da565a1eb30ac1d', '2018-10-29 15:03:41');
INSERT INTO `flow_table_details` VALUES ('b050031e5e674ab995de25b391ee9007', 'Initial-7', null, null, null, null, null, null, null, '28872740', '18446744073709551615', null, null, null, null, null, null, null, '35020', '02b3a20f135e48a792a268656c5f56a2', '2018-10-29 15:33:05');
INSERT INTO `flow_table_details` VALUES ('b0582fba41df494dbe84cfa5d7a3bab3', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '2d28692a547641249f24b77435a2b1d9', '2018-10-29 15:12:01');
INSERT INTO `flow_table_details` VALUES ('b0b59a9680b84f3595522a78393e7996', 'Initial-27', null, null, null, null, null, null, null, '28706194', '18446744073709551615', null, null, null, null, null, null, null, '35020', '835d4e7ecb2d4333ab49e51ad709e8bf', '2018-10-29 15:42:00');
INSERT INTO `flow_table_details` VALUES ('b149f64462094c7a8b7c7935252b54b5', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '31d605d922f84f4b865cebbf8d074f25', '2018-10-29 15:21:02');
INSERT INTO `flow_table_details` VALUES ('b2e407139eb54c8f801a91d4cf29aa94', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '71613313526748caa433c84117ad2255', '2018-10-29 15:00:10');
INSERT INTO `flow_table_details` VALUES ('b3d9fae725b5443187534d4adddbb5b0', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '31d605d922f84f4b865cebbf8d074f25', '2018-10-29 15:21:01');
INSERT INTO `flow_table_details` VALUES ('b3dc2de15c7f47ff8f44ff6493f78c4f', 'Initial-21', null, null, null, null, null, null, null, '1782668', '18446744073709551615', null, null, null, null, null, null, null, '2048', '97aad152b0a4400bb9f203353798bf05', '2018-10-29 15:33:02');
INSERT INTO `flow_table_details` VALUES ('b3e6da653980430795628300d8b944e7', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '5628d04965f247eaa092fbba1b421296', '2018-10-29 16:03:02');
INSERT INTO `flow_table_details` VALUES ('b54006f2b84c4bb2bfbba580192aa55b', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '68f9ba82cc2d45f789811c5967c91a34', '2018-10-29 15:24:05');
INSERT INTO `flow_table_details` VALUES ('b5c372ee0cca4f00b2a3d1cf4ce27513', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '5fa0cf44f96e4b9795daccce16fd8085', '2018-10-29 15:54:02');
INSERT INTO `flow_table_details` VALUES ('b738f77a1c4a40a897c34fd02a73609a', 'Initial-27', null, null, null, null, null, null, null, '28801575', '18446744073709551615', null, null, null, null, null, null, null, '35020', '2cbf921c307b4e2d8b5a7301fe79207b', '2018-10-29 16:03:03');
INSERT INTO `flow_table_details` VALUES ('b744f74361194a2faf8203f7ca6b9e51', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '8a10859019704ac0b0c8c74453c6b24e', '2018-10-29 06:03:03');
INSERT INTO `flow_table_details` VALUES ('b772ed1552ce41d0975b087b31cdd8e8', 'Initial-7', null, null, null, null, null, null, null, '29049733', '18446744073709551615', null, null, null, null, null, null, null, '35020', '3a71bf64168d4a519697c4b810a155ad', '2018-10-29 16:12:02');
INSERT INTO `flow_table_details` VALUES ('b799d348141a4ac186797c9397410dd1', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '4ee8de322f75449cb7cfc85b3fd7d84d', '2018-10-29 14:57:05');
INSERT INTO `flow_table_details` VALUES ('b830d9193aeb41a0a4c1535d91dc0f5f', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'a5cee5cdaea148bda4bc2b30f502c756', '2018-10-29 16:09:04');
INSERT INTO `flow_table_details` VALUES ('b946df12c6a346c7bdfb2c7feb3f1dd6', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '32487edbcfc54f6a8a0fe1c101b60eb5', '2018-10-29 15:27:03');
INSERT INTO `flow_table_details` VALUES ('b9668a458e9c4c6fb6452763a63b8c71', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '4068e9844ca545e8a82d6888104b19a1', '2018-10-29 16:03:02');
INSERT INTO `flow_table_details` VALUES ('b9816c9ec4ba46478cb8483366705c53', 'Initial-21', null, null, null, null, null, null, null, '1782933', '18446744073709551615', null, null, null, null, null, null, null, '2048', '1333dec5637d4cb99f978750181b4848', '2018-10-29 16:15:01');
INSERT INTO `flow_table_details` VALUES ('b9dcbd39ffd34e48b003b3f00a86694f', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', '88516728318e4686906a6d064ad48cdf', '2018-10-29 15:39:07');
INSERT INTO `flow_table_details` VALUES ('ba2a0f4d444745dfbdd18f7d05d2a54b', 'Initial-3', null, null, null, null, null, null, null, '28849742', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'f15b1aaaf5944f74b9ec133a6b946b12', '2018-10-29 16:12:04');
INSERT INTO `flow_table_details` VALUES ('babc320dca5e45a584d6fa8bf28b8bdb', 'Initial-22', null, null, null, null, null, null, null, '266112', '18446744073709551615', null, null, null, null, null, null, null, '2054', '214f428a61b744bf867cbce7df6a2e1c', '2018-10-29 16:20:32');
INSERT INTO `flow_table_details` VALUES ('bad2aa08c6f7400c87b5558835d6cb87', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '05902e7804344e6191975c6c63e161db', '2018-10-29 15:15:06');
INSERT INTO `flow_table_details` VALUES ('bb89fc97a8a8405f974766b5da1aa466', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '3291b001a3884a5b863f50fe6d74429e', '2018-10-29 15:24:02');
INSERT INTO `flow_table_details` VALUES ('bb952f29a3ef437c95cabbdc52f07228', 'Initial-3', null, null, null, null, null, null, null, '28863386', '18446744073709551615', null, null, null, null, null, null, null, '35020', '6496d86943434a00934f6988c31b370f', '2018-10-29 16:15:04');
INSERT INTO `flow_table_details` VALUES ('bbd4b377688f41df912ddb96ae4b2453', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'ebb4cc98f15a4e3d8f7bffb0b759cecc', '2018-10-29 16:15:04');
INSERT INTO `flow_table_details` VALUES ('bbe3636c66a9405d861bcf40bf997cef', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '322ebda4e25d447fba4effd0bfb5c369', '2018-10-29 15:12:04');
INSERT INTO `flow_table_details` VALUES ('bbeef592d6a040a2b51fcf5e2b0cdf44', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'cffe4c5bf1eb43648b70bf5170e856ea', '2018-10-29 16:21:05');
INSERT INTO `flow_table_details` VALUES ('bd9fe49149654f7eb436bda8caf5094e', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'c0167d353aba48769da565a1eb30ac1d', '2018-10-29 15:03:40');
INSERT INTO `flow_table_details` VALUES ('be0db374b5c04e71bf10b42124a418df', 'Initial-14', null, null, null, null, null, null, null, '1781842', '18446744073709551615', null, null, null, null, null, null, null, '2048', '5b628dc9e9df4312867e90b604da6fd5', '2018-10-29 15:09:05');
INSERT INTO `flow_table_details` VALUES ('be44de0e08144fa3946113cfe19d9ed2', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '77309319a25d4091aee3b46891e19185', '2018-10-29 15:45:04');
INSERT INTO `flow_table_details` VALUES ('beb6b837577a462981364e68db9caf50', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '4068e9844ca545e8a82d6888104b19a1', '2018-10-29 16:03:02');
INSERT INTO `flow_table_details` VALUES ('bed22725a5a84a2095f2db0511dd0e6f', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '4db5e850767741368bf54604a216fb23', '2018-10-29 16:06:02');
INSERT INTO `flow_table_details` VALUES ('bf0b891ce756405f80523074d70e142c', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '594c6c24269646b7a6c181fa414ab679', '2018-10-29 16:21:03');
INSERT INTO `flow_table_details` VALUES ('bf7e779e0dd84c17bb7b05913f97c45f', 'Initial-22', null, null, null, null, null, null, null, '260288', '18446744073709551615', null, null, null, null, null, null, null, '2054', '9aab68903b404fc8bd65181966924a19', '2018-10-29 16:12:01');
INSERT INTO `flow_table_details` VALUES ('bff9652dc643470aacaab811f47bad4d', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', 'ed6985cae06d4f83b259390da7d00004', '2018-10-29 15:45:02');
INSERT INTO `flow_table_details` VALUES ('c060748cb6164fbd92f66b2d92ee2d69', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'cffe803a993748369f3d82d9c5542cae', '2018-10-29 15:03:44');
INSERT INTO `flow_table_details` VALUES ('c06d463139844e83b203fd6d2df29464', 'Initial-15', null, null, null, null, null, null, null, '237504', '18446744073709551615', null, null, null, null, null, null, null, '2054', '88acc7d9c5cc49b78f6dabe8c7178462', '2018-10-29 15:18:05');
INSERT INTO `flow_table_details` VALUES ('c08e92746a9a447287c43e1375a212e2', 'Initial-11', null, null, null, null, null, null, null, '38816070', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'c5f5f8e176da466393829b21c671650a', '2018-10-29 16:03:00');
INSERT INTO `flow_table_details` VALUES ('c13e8d2081d74a44b36c23b14564dfe1', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'e3c3d1208ae34658a922f684a5fcf7a1', '2018-10-29 15:09:06');
INSERT INTO `flow_table_details` VALUES ('c1dc242c512c43ae9b75ae40e4d9345f', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '8a10859019704ac0b0c8c74453c6b24e', '2018-10-29 06:03:03');
INSERT INTO `flow_table_details` VALUES ('c21c94893ae349a6b846485346943164', 'Initial-3', null, null, null, null, null, null, null, '28767499', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'c464ce3089e74afeb127f0676e463f2e', '2018-10-29 15:54:01');
INSERT INTO `flow_table_details` VALUES ('c2b8a6f6aeae46c78b0863b50cca0055', 'Initial-22', null, null, null, null, null, null, null, '249600', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'e1b8922f45ba4358bf31c26491cdc320', '2018-10-29 16:00:13');
INSERT INTO `flow_table_details` VALUES ('c2f9d6d9e0334012a2cef77076415659', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '4db5e850767741368bf54604a216fb23', '2018-10-29 16:06:03');
INSERT INTO `flow_table_details` VALUES ('c30e7001c51f4057b20f0c88f6a72665', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '53e3d493ba824cf3aee7fbe00a2670bb', '2018-10-29 15:21:03');
INSERT INTO `flow_table_details` VALUES ('c3122eb8a7434d4e800701db8d26d66e', 'Initial-19', null, null, null, null, null, null, null, '28544084', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'ddb2dfbac6be4562ada079f9c1e13109', '2018-10-29 15:06:08');
INSERT INTO `flow_table_details` VALUES ('c31a386b51e847689950c5e70effdd33', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'b7eced8931334fa284b58ca36ae2f168', '2018-10-29 06:03:01');
INSERT INTO `flow_table_details` VALUES ('c37b6b1ff13f40e18fe7e198f6e27d5d', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '71613313526748caa433c84117ad2255', '2018-10-29 15:00:11');
INSERT INTO `flow_table_details` VALUES ('c3f5ea9380194359bf53439f19186246', 'Initial-11', null, null, null, null, null, null, null, '39550980', '18446744073709551615', null, null, null, null, null, null, null, '35020', '8a10859019704ac0b0c8c74453c6b24e', '2018-10-29 06:03:02');
INSERT INTO `flow_table_details` VALUES ('c4b5a349f8804cc8b4401da71d8ad3b8', 'Initial-7', null, null, null, null, null, null, null, '29554561', '18446744073709551615', null, null, null, null, null, null, null, '35020', '2ce779d8f4f24432b0f7754045a5a4fa', '2018-10-29 06:03:02');
INSERT INTO `flow_table_details` VALUES ('c4c90d551fb64f60bb14cb09be96e6b3', 'Initial-13', null, null, null, null, null, null, null, '28631438', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'a069f9274939444a9c741cb5c5bc8150', '2018-10-29 15:24:03');
INSERT INTO `flow_table_details` VALUES ('c4cb35d85a534b559dbe2c4dd1577c8f', 'Initial-7', null, null, null, null, null, null, null, '28859854', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'fe99c08332b84cf5b7cc4b189793c53b', '2018-10-29 15:30:12');
INSERT INTO `flow_table_details` VALUES ('c52ee43ad2fa49b989c86d1f7a155d04', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '02891b0bdbfa4562810c1371a0024ff6', '2018-10-29 16:24:02');
INSERT INTO `flow_table_details` VALUES ('c55984286b55415d8c751dca52f1fc05', 'Initial-1', null, null, null, null, null, null, null, '163849', '18446744073709551615', null, null, null, null, null, null, null, '0', '88788c266b9b4b9bb74c66c1943d8536', '2018-10-29 15:21:01');
INSERT INTO `flow_table_details` VALUES ('c5ce26960432417bb679a67288b937ce', 'Initial-19', null, null, null, null, null, null, null, '28611567', '18446744073709551615', null, null, null, null, null, null, null, '35020', '31d605d922f84f4b865cebbf8d074f25', '2018-10-29 15:21:02');
INSERT INTO `flow_table_details` VALUES ('c6a5110c156d48ff8dfefc2468bb8d0e', 'Initial-14', null, null, null, null, null, null, null, '1782590', '18446744073709551615', null, null, null, null, null, null, null, '2048', '0ee8e1988e3b451ea56bf2f9dc9d49fd', '2018-10-29 15:27:01');
INSERT INTO `flow_table_details` VALUES ('c6d8fd9b03b648bc86e9efc7861283f0', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', 'f951820d6627430f88a9c5491833d574', '2018-10-29 15:54:03');
INSERT INTO `flow_table_details` VALUES ('c6f40652ae0146099fe80a4ed0a54105', 'Initial-16', null, null, null, null, null, null, null, '28645306', '18446744073709551615', null, null, null, null, null, null, null, '35020', '3a63b82743b54cdc9c1b9704b2184eb7', '2018-10-29 15:30:09');
INSERT INTO `flow_table_details` VALUES ('c73f4fc5e34f40dcb1b211d9f8e87c4d', 'Initial-21', null, null, null, null, null, null, null, '1782933', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'd34aa652a30f40a7935bb60b824ae71d', '2018-10-29 16:09:05');
INSERT INTO `flow_table_details` VALUES ('c7889eb020e842a0bc141ced7abcaa2b', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '3a71bf64168d4a519697c4b810a155ad', '2018-10-29 16:12:02');
INSERT INTO `flow_table_details` VALUES ('c85850fdbdbc4365902e9a449e6de744', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '9ccd6f018f6a44ae91dfd41f4fbc1a5b', '2018-10-29 16:15:03');
INSERT INTO `flow_table_details` VALUES ('c9159a6cdfad4de9a1ea0987cac17cc4', 'Initial-15', null, null, null, null, null, null, null, '237504', '18446744073709551615', null, null, null, null, null, null, null, '2054', '5b628dc9e9df4312867e90b604da6fd5', '2018-10-29 15:09:05');
INSERT INTO `flow_table_details` VALUES ('c93696ee56d648f9b01f90de04e9f181', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', 'dc636eaf8e664121ac70059217f4399c', '2018-10-29 16:20:33');
INSERT INTO `flow_table_details` VALUES ('ca6a63d927b346808f4f38a152d6f8e9', 'Initial-20', null, null, null, null, null, null, null, '164056', '18446744073709551615', null, null, null, null, null, null, null, '0', 'c523ad19ed5c45a78e255f9b04663c67', '2018-10-29 16:06:04');
INSERT INTO `flow_table_details` VALUES ('cbb42d57b44f404cab780fe72aea6d03', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '2e0d3e8a1e55443aa003c2a7c0d77d5a', '2018-10-29 15:42:04');
INSERT INTO `flow_table_details` VALUES ('ce30cc79fad54602a8df4c17d90c194c', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '68c0945d9a82438eb955eb5d5cd3f349', '2018-10-29 15:03:40');
INSERT INTO `flow_table_details` VALUES ('ce75aec274264c499fe64ce6098b8c36', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', 'f954d0bf2f6f4db1a3b97e824330fa3b', '2018-10-29 15:42:02');
INSERT INTO `flow_table_details` VALUES ('ce79b89aca3b4b0089a18a35f3b65087', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'dab6f60e802b49908fa41db291341c31', '2018-10-29 15:21:04');
INSERT INTO `flow_table_details` VALUES ('cf487065d8f94383a30f9e73c6b894df', 'Initial-15', null, null, null, null, null, null, null, '237504', '18446744073709551615', null, null, null, null, null, null, null, '2054', '358b334feaec4a90819e68b03f4ab114', '2018-10-29 15:24:01');
INSERT INTO `flow_table_details` VALUES ('d05d1f9756c84572b58b710cee1f4831', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '93d1c23f8f094cbeb68193f6793e3ee8', '2018-10-29 15:33:01');
INSERT INTO `flow_table_details` VALUES ('d0d809fc82504f7dbce4b18673081af0', 'Initial-16', null, null, null, null, null, null, null, '28536730', '18446744073709551615', null, null, null, null, null, null, null, '35020', '2da5951be28141008081758e71ab9b4a', '2018-10-29 15:06:07');
INSERT INTO `flow_table_details` VALUES ('d15a6de645654cd8b09cf5a5c733211f', 'Initial-16', null, null, null, null, null, null, null, '28604213', '18446744073709551615', null, null, null, null, null, null, null, '35020', '88788c266b9b4b9bb74c66c1943d8536', '2018-10-29 15:21:00');
INSERT INTO `flow_table_details` VALUES ('d163f6b0f5134bb69ec9ac744d9abe12', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '3a71bf64168d4a519697c4b810a155ad', '2018-10-29 16:12:02');
INSERT INTO `flow_table_details` VALUES ('d1f83546ad9d4ff595b161271efe32ec', 'Initial-23', null, null, null, null, null, null, null, '28753505', '18446744073709551615', null, null, null, null, null, null, null, '35020', '946e657dbf944416956f41b15f861f0d', '2018-10-29 15:54:05');
INSERT INTO `flow_table_details` VALUES ('d253b88298b04271ae022eb67145fbc3', 'Initial-23', null, null, null, null, null, null, null, '28794221', '18446744073709551615', null, null, null, null, null, null, null, '35020', '165d0505d95647d3b084ef25a1115510', '2018-10-29 16:03:05');
INSERT INTO `flow_table_details` VALUES ('d27c0e1726f94e47bceeeb6fcc167fe3', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '68f9ba82cc2d45f789811c5967c91a34', '2018-10-29 15:24:04');
INSERT INTO `flow_table_details` VALUES ('d292cfc019de47079fd6bc2b905273c5', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '3aa8b853e381431baa21db5443fef560', '2018-10-29 15:21:04');
INSERT INTO `flow_table_details` VALUES ('d2bfc153415b4489834faf4746509f41', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'c464ce3089e74afeb127f0676e463f2e', '2018-10-29 15:54:01');
INSERT INTO `flow_table_details` VALUES ('d37287a76d7c4583a66ed4e4a3dbd4c4', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', 'c8e19eeb344a4296be7cd244d86f5bc2', '2018-10-29 15:45:05');
INSERT INTO `flow_table_details` VALUES ('d4d75fb650304209825ff74ad218fe89', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '3aa8b853e381431baa21db5443fef560', '2018-10-29 15:21:04');
INSERT INTO `flow_table_details` VALUES ('d54bb025196d4ee29ddbcb8148061919', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '0de9d73b4c1a4a9abfbaa1f592858cd6', '2018-10-29 15:00:12');
INSERT INTO `flow_table_details` VALUES ('d58149729c334cc6a45cd5ffd450b4f9', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '31d605d922f84f4b865cebbf8d074f25', '2018-10-29 15:21:02');
INSERT INTO `flow_table_details` VALUES ('d5b7a1fdb6b344faa4cacd27c6f5d84e', 'Initial-23', null, null, null, null, null, null, null, '28821365', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'd34aa652a30f40a7935bb60b824ae71d', '2018-10-29 16:09:05');
INSERT INTO `flow_table_details` VALUES ('d5bc8a480536479897ccbb62f00383dc', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '835d4e7ecb2d4333ab49e51ad709e8bf', '2018-10-29 15:42:01');
INSERT INTO `flow_table_details` VALUES ('d64d3eb6eb2847a9b01a0c177efa4757', 'Initial-7', null, null, null, null, null, null, null, '28709012', '18446744073709551615', null, null, null, null, null, null, null, '35020', '52882f8d57bf4ab891818de6e7f4abe3', '2018-10-29 14:57:04');
INSERT INTO `flow_table_details` VALUES ('d766176825f34f1ea2dbaebef88a6456', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '77309319a25d4091aee3b46891e19185', '2018-10-29 15:45:04');
INSERT INTO `flow_table_details` VALUES ('d791b4ecef244be1a8aa7b12ea6f6d8f', 'Initial-2', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', 'ad8f9291a1a04887a8658570467b2138', '2018-10-29 15:18:02');
INSERT INTO `flow_table_details` VALUES ('d7cff4ca14b448e2972d14f47429ee6e', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '00c656e5b85c477d90afe6515e33a247', '2018-10-29 16:20:34');
INSERT INTO `flow_table_details` VALUES ('d8e45a36eefe4567bbfcf957bfa05e0a', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '8b64d274999b43adb27a32021ccd2873', '2018-10-29 16:12:03');
INSERT INTO `flow_table_details` VALUES ('d921871961af4022950a356be723d994', 'Initial-21', null, null, null, null, null, null, null, '1802114', '18446744073709551615', null, null, null, null, null, null, null, '2048', '461aedf7659345339973b9ced3791a86', '2018-10-29 06:03:01');
INSERT INTO `flow_table_details` VALUES ('d9625975326e49cc9425a7b4634bf211', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '40adb80e8ffe491386fe9a0141a85b77', '2018-10-29 16:06:01');
INSERT INTO `flow_table_details` VALUES ('da1996e66e08472da362b5edcf7b799c', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '0a14d44c456742598ea6a33cc09065f9', '2018-10-29 16:00:10');
INSERT INTO `flow_table_details` VALUES ('db82383d4ebd48bfa48a4589d046ec7b', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '4f899bddc9ed4c3ab44da8bcad84f425', '2018-10-29 06:03:02');
INSERT INTO `flow_table_details` VALUES ('db8cc33a821c42e0ba2792baf66efb42', 'Initial-24', null, null, null, null, null, null, null, '17458', '18446744073709551615', null, null, null, null, null, null, null, '0', '002bd68cb623477698f6c54e1e255f2e', '2018-10-29 15:33:03');
INSERT INTO `flow_table_details` VALUES ('dc4ca33fe9ce4e1d858903538f090385', 'Initial-11', null, null, null, null, null, null, null, '38706420', '18446744073709551615', null, null, null, null, null, null, null, '35020', '525ee1d40445461494b165f3434c35dc', '2018-10-29 15:45:01');
INSERT INTO `flow_table_details` VALUES ('dc8488849be543f7b82cd1f18ff476c3', 'Initial-19', null, null, null, null, null, null, null, '28533151', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'cffe803a993748369f3d82d9c5542cae', '2018-10-29 15:03:43');
INSERT INTO `flow_table_details` VALUES ('dd66b5d58a8042f6b07a53d1317bb7ca', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '8e6b6a41860e4de6b689c5b2af727e6d', '2018-10-29 15:24:01');
INSERT INTO `flow_table_details` VALUES ('ddc3bcac5cee4719848778194fc7ed46', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '8a10859019704ac0b0c8c74453c6b24e', '2018-10-29 06:03:03');
INSERT INTO `flow_table_details` VALUES ('ddfc8c1f4e884a4693cf8739da21627a', 'Initial-15', null, null, null, null, null, null, null, '237504', '18446744073709551615', null, null, null, null, null, null, null, '2054', '3a63b82743b54cdc9c1b9704b2184eb7', '2018-10-29 15:30:09');
INSERT INTO `flow_table_details` VALUES ('df888da3ad2a493c903e2fb41b155bc5', 'Initial-8', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '32f549381b8542d6b539a814226a5478', '2018-10-29 15:09:04');
INSERT INTO `flow_table_details` VALUES ('df94b98dcd144ef290bd6f43a7fd28bd', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '4dd8e96953a14856ac52b958db8ce45e', '2018-10-29 15:27:02');
INSERT INTO `flow_table_details` VALUES ('dfd8a04669e14b7ab00e630f6d33f620', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'e0aa0bb7800646ef8e5282ff2d80bd3d', '2018-10-29 16:06:02');
INSERT INTO `flow_table_details` VALUES ('e02369cec1a747e4a664d9d4def76e8a', 'Initial-21', null, null, null, null, null, null, null, '1782933', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'c523ad19ed5c45a78e255f9b04663c67', '2018-10-29 16:06:04');
INSERT INTO `flow_table_details` VALUES ('e07f1d0645894c2d8f49544d1c1064cf', 'Initial-22', null, null, null, null, null, null, null, '262656', '18446744073709551615', null, null, null, null, null, null, null, '2054', '1333dec5637d4cb99f978750181b4848', '2018-10-29 16:15:00');
INSERT INTO `flow_table_details` VALUES ('e0b5d60687074f86a8c7f39667308066', '#UF$TABLE*0-23', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', 'c464ce3089e74afeb127f0676e463f2e', '2018-10-29 15:54:01');
INSERT INTO `flow_table_details` VALUES ('e14ca7b2ce5240a48a54c1d2eedc8ffc', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', 'fbb747803abe4737a651898b19344b63', '2018-10-29 15:39:06');
INSERT INTO `flow_table_details` VALUES ('e2cade58143941bcb2f1546e402ce2eb', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '6496d86943434a00934f6988c31b370f', '2018-10-29 16:15:05');
INSERT INTO `flow_table_details` VALUES ('e38a9e47c57445229e2237890c554afa', 'Initial-19', null, null, null, null, null, null, null, '28503368', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'be843cbd9f35483fa88f2d3a77a9af1e', '2018-10-29 14:57:07');
INSERT INTO `flow_table_details` VALUES ('e39a0fd9cda34709b38296f5dd763b70', 'Initial-7', null, null, null, null, null, null, null, '28818164', '18446744073709551615', null, null, null, null, null, null, null, '35020', '3aa8b853e381431baa21db5443fef560', '2018-10-29 15:21:05');
INSERT INTO `flow_table_details` VALUES ('e3c27a80c7e747758308c8ff9f6f6e62', 'Initial-19', null, null, null, null, null, null, null, '28638334', '18446744073709551615', null, null, null, null, null, null, null, '35020', '1a65b5ddfde44aa8a68137a06db0ea27', '2018-10-29 15:27:01');
INSERT INTO `flow_table_details` VALUES ('e4509a849d6f4507a49baedfdcf43bbd', 'Initial-21', null, null, null, null, null, null, null, '1782933', '18446744073709551615', null, null, null, null, null, null, null, '2048', '9aab68903b404fc8bd65181966924a19', '2018-10-29 16:12:01');
INSERT INTO `flow_table_details` VALUES ('e4caab322a854f8e9cda557eb8d74bbb', 'Initial-7', null, null, null, null, null, null, null, '29088770', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'dc636eaf8e664121ac70059217f4399c', '2018-10-29 16:20:33');
INSERT INTO `flow_table_details` VALUES ('e57839182f9e426792b5b42751a8eed3', 'Initial-11', null, null, null, null, null, null, null, '38923680', '18446744073709551615', null, null, null, null, null, null, null, '35020', '00c656e5b85c477d90afe6515e33a247', '2018-10-29 16:20:33');
INSERT INTO `flow_table_details` VALUES ('e58f648492584ff480fb98bd012647d1', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '8b64d274999b43adb27a32021ccd2873', '2018-10-29 16:12:03');
INSERT INTO `flow_table_details` VALUES ('e598e61153864635b10c7adbf3c4ef2b', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '0de9d73b4c1a4a9abfbaa1f592858cd6', '2018-10-29 15:00:12');
INSERT INTO `flow_table_details` VALUES ('e5c0074fa738467c9c714de761eb3de1', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'ebb4cc98f15a4e3d8f7bffb0b759cecc', '2018-10-29 16:15:04');
INSERT INTO `flow_table_details` VALUES ('e61def0085b844858d2d4c2065dfdba3', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', '4f899bddc9ed4c3ab44da8bcad84f425', '2018-10-29 06:03:02');
INSERT INTO `flow_table_details` VALUES ('e6cf4ecc276846f9bd1d8206bab21b30', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '0de9d73b4c1a4a9abfbaa1f592858cd6', '2018-10-29 15:00:12');
INSERT INTO `flow_table_details` VALUES ('e6fb3c5c3101498c8a4de8f956c56998', 'Initial-0', null, null, null, null, null, null, null, '6907', '18446744073709551615', null, null, null, null, null, null, null, '0', '8d5e5a6d509449ce90490f92575ae8ca', '2018-10-29 15:12:04');
INSERT INTO `flow_table_details` VALUES ('ea08636ed2054ffd821ee9ee843e0eaa', 'Initial-23', null, null, null, null, null, null, null, '28712789', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'ed6985cae06d4f83b259390da7d00004', '2018-10-29 15:45:03');
INSERT INTO `flow_table_details` VALUES ('ea0b31c0cabd4b62a4baec810090fbf0', 'Initial-9', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '53e3d493ba824cf3aee7fbe00a2670bb', '2018-10-29 15:21:03');
INSERT INTO `flow_table_details` VALUES ('ea3d0a843d804e7db95c7ef43cdb0d36', 'Initial-25', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'd58f3b3e3d6a42eab1fad22f47a56a57', '2018-10-29 15:54:04');
INSERT INTO `flow_table_details` VALUES ('eaa7cb6235be4e0699651f52c623e993', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '2b40f6614e424820899ed7bb52f9b007', '2018-10-29 15:39:08');
INSERT INTO `flow_table_details` VALUES ('ebb1be328e844b94a28e6c8c61da8575', 'Initial-10', null, null, null, null, null, null, null, '38432040', '18446744073709551615', null, null, null, null, null, null, null, '35020', '0de9d73b4c1a4a9abfbaa1f592858cd6', '2018-10-29 15:00:11');
INSERT INTO `flow_table_details` VALUES ('ec53479498ae44dfbbf34fa18d81c702', 'Initial-11', null, null, null, null, null, null, null, '38852790', '18446744073709551615', null, null, null, null, null, null, null, '35020', '2f5505042111423b8520feda4866b6bb', '2018-10-29 16:09:00');
INSERT INTO `flow_table_details` VALUES ('ed02321415fe4ab983f5ecda4d50be44', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '1dfa0203103747f0aada13b57704830b', '2018-10-29 15:09:02');
INSERT INTO `flow_table_details` VALUES ('ed4724998d294566a8dc630ebe38dafc', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '02b3a20f135e48a792a268656c5f56a2', '2018-10-29 15:33:04');
INSERT INTO `flow_table_details` VALUES ('ee4fa1afe9e94dcbbe9cbf458629e09d', 'Initial-4', null, null, null, null, null, null, null, '7920662', '18446744073709551615', null, null, null, null, null, null, null, '0', '2f72b8dbca1542b7b8edb7f584cf0150', '2018-10-29 15:18:04');
INSERT INTO `flow_table_details` VALUES ('ee77495d407847589c191f56a72de6a8', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '222a73a460a74ab2ac186c75dc1230d1', '2018-10-29 16:00:12');
INSERT INTO `flow_table_details` VALUES ('eec94471c0954fb79e438a47f07b901b', 'Initial-7', null, null, null, null, null, null, null, '29022824', '18446744073709551615', null, null, null, null, null, null, null, '35020', '4db5e850767741368bf54604a216fb23', '2018-10-29 16:06:03');
INSERT INTO `flow_table_details` VALUES ('ef4c290c46444f6bbb1667e95e75d7a7', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '267cd5f5b4b34793922923c7031ed019', '2018-10-29 16:24:04');
INSERT INTO `flow_table_details` VALUES ('ef819a64746e4c4bb295efa54ec5bc1b', 'Initial-10', null, null, null, null, null, null, null, '38504460', '18446744073709551615', null, null, null, null, null, null, null, '35020', '2d28692a547641249f24b77435a2b1d9', '2018-10-29 15:12:01');
INSERT INTO `flow_table_details` VALUES ('efa13994d6bd4f30adb1977e0d288365', 'Initial-13', null, null, null, null, null, null, null, '28645082', '18446744073709551615', null, null, null, null, null, null, null, '35020', '32487edbcfc54f6a8a0fe1c101b60eb5', '2018-10-29 15:27:03');
INSERT INTO `flow_table_details` VALUES ('efc69ebd060549c08b681e834c99db85', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '52882f8d57bf4ab891818de6e7f4abe3', '2018-10-29 14:57:03');
INSERT INTO `flow_table_details` VALUES ('eff538698d9d49089b777e8189488a85', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '68f9ba82cc2d45f789811c5967c91a34', '2018-10-29 15:24:04');
INSERT INTO `flow_table_details` VALUES ('f0467dc4ca8242b2b1c52b9816e3565f', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'ebb4cc98f15a4e3d8f7bffb0b759cecc', '2018-10-29 16:15:04');
INSERT INTO `flow_table_details` VALUES ('f0d6056d447a4530ba80560b100b8ed0', '#UF$TABLE*0-26', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', '9ccd6f018f6a44ae91dfd41f4fbc1a5b', '2018-10-29 16:15:03');
INSERT INTO `flow_table_details` VALUES ('f13707e7cc6443e480d07dd861581cbb', 'Initial-7', null, null, null, null, null, null, null, '28804520', '18446744073709551615', null, null, null, null, null, null, null, '35020', '2f72b8dbca1542b7b8edb7f584cf0150', '2018-10-29 15:18:04');
INSERT INTO `flow_table_details` VALUES ('f142d786d1134d6b955c1773c59d2ae4', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '959190478ef34b0ebacc3ce4082ffa0a', '2018-10-29 15:15:06');
INSERT INTO `flow_table_details` VALUES ('f1972ad9c3de4c999dff058df35faae2', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'cffe803a993748369f3d82d9c5542cae', '2018-10-29 15:03:43');
INSERT INTO `flow_table_details` VALUES ('f253f0b94f2c4519ab904fea143d03b8', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '835d4e7ecb2d4333ab49e51ad709e8bf', '2018-10-29 15:42:01');
INSERT INTO `flow_table_details` VALUES ('f37dbee33a1f44169537a77cb80c3a61', 'Initial-17', null, null, null, null, null, null, null, '983349', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'e3c3d1208ae34658a922f684a5fcf7a1', '2018-10-29 15:09:05');
INSERT INTO `flow_table_details` VALUES ('f4be88fd5f804b8aa910fcc73d5a9931', 'Initial-6', null, null, null, null, null, null, null, '7880064', '18446744073709551615', null, null, null, null, null, null, null, '2054', '5fa0cf44f96e4b9795daccce16fd8085', '2018-10-29 15:54:02');
INSERT INTO `flow_table_details` VALUES ('f5824b3e33a74cf8b28a76953bce4479', 'Initial-16', null, null, null, null, null, null, null, '28549925', '18446744073709551615', null, null, null, null, null, null, null, '35020', '5b628dc9e9df4312867e90b604da6fd5', '2018-10-29 15:09:04');
INSERT INTO `flow_table_details` VALUES ('f7383c6a44fa43d9a944f947d60c69ec', '#UF$TABLE*0-24', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', '93d1c23f8f094cbeb68193f6793e3ee8', '2018-10-29 15:33:01');
INSERT INTO `flow_table_details` VALUES ('f74d663403e64b5daa720ad1b70cc480', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '13c866074d4e48a9a29249fa9c98085d', '2018-10-29 15:15:05');
INSERT INTO `flow_table_details` VALUES ('f7ef11f17c79402eaf05355f16f78b34', 'Initial-18', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'ddb2dfbac6be4562ada079f9c1e13109', '2018-10-29 15:06:08');
INSERT INTO `flow_table_details` VALUES ('f839ff70fd5e4904a711b1a4e50d66f4', 'Initial-23', null, null, null, null, null, null, null, '28781403', '18446744073709551615', null, null, null, null, null, null, null, '35020', 'e1b8922f45ba4358bf31c26491cdc320', '2018-10-29 16:00:14');
INSERT INTO `flow_table_details` VALUES ('f8884aa427eb4692b3bbc4e2610945d9', 'Initial-15', null, null, null, null, null, null, null, '237504', '18446744073709551615', null, null, null, null, null, null, null, '2054', '88788c266b9b4b9bb74c66c1943d8536', '2018-10-29 15:21:01');
INSERT INTO `flow_table_details` VALUES ('f95e240461cb4e518a1a05f7b545830c', 'Initial-3', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '0', 'cec360aa124c4e6e9d3e0bb196c694b9', '2018-10-29 15:18:00');
INSERT INTO `flow_table_details` VALUES ('fb78f370ad384cee9a30979e6d9241f7', 'Initial-7', null, null, null, null, null, null, null, '29091044', '18446744073709551615', null, null, null, null, null, null, null, '35020', '4bb9f3e0ed2e4c7a9355734bad61b720', '2018-10-29 16:21:04');
INSERT INTO `flow_table_details` VALUES ('fb9719af87734d3ebc2c2bcb60e2181a', 'Initial-1', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', 'a5ccc86d348f4e34ba23c6b435506774', '2018-10-29 15:33:03');
INSERT INTO `flow_table_details` VALUES ('fc63f42a55bb4c16b63678f8c2b3510b', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', '7af51fdbed60457389f53f88d7fbbb6c', '2018-10-29 15:45:01');
INSERT INTO `flow_table_details` VALUES ('fccfbb87b10e477699f188eaec03c735', 'Initial-21', null, null, null, null, null, null, null, '1783120', '18446744073709551615', null, null, null, null, null, null, null, '2048', '1eec031987cf417f8720c055ae728f59', '2018-10-29 16:24:02');
INSERT INTO `flow_table_details` VALUES ('fd10ea14175a453b9593cd725040e19e', 'Initial-14', null, null, null, null, null, null, null, '1777099', '18446744073709551615', null, null, null, null, null, null, null, '2048', '4ac3b4e6360e42d4a65e9797e1adf827', '2018-10-29 15:03:43');
INSERT INTO `flow_table_details` VALUES ('fd3c35d01e7242e482b815bdee4cf0c2', 'Initial-11', null, null, null, null, null, null, null, '2768', '18446744073709551615', null, null, null, null, null, null, null, '2048', '8d5e5a6d509449ce90490f92575ae8ca', '2018-10-29 15:12:03');
INSERT INTO `flow_table_details` VALUES ('fe264e32255a4f5c956feaf10cfac14e', 'Initial-2', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'e0aa0bb7800646ef8e5282ff2d80bd3d', '2018-10-29 16:06:01');
INSERT INTO `flow_table_details` VALUES ('fe2c6459b96b4da59c493c427ae94b16', '#UF$TABLE*0-25', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2048', '2f5505042111423b8520feda4866b6bb', '2018-10-29 16:09:01');
INSERT INTO `flow_table_details` VALUES ('fe6ff2dc5aa34756989e66b7d14971f2', 'Initial-12', null, null, null, null, null, null, null, '0', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'c0167d353aba48769da565a1eb30ac1d', '2018-10-29 15:03:41');
INSERT INTO `flow_table_details` VALUES ('fe976499a9924ffdae371ba077e321df', 'Initial-26', null, null, null, null, null, null, null, '440832', '18446744073709551615', null, null, null, null, null, null, null, '2054', 'cf7f3cac7327441f8bec7a03c896c28f', '2018-10-29 15:39:10');
INSERT INTO `flow_table_details` VALUES ('fec0904844ab498ab621d6f88d0793fc', 'Initial-5', null, null, null, null, null, null, null, '10738861', '18446744073709551615', null, null, null, null, null, null, null, '2048', '65d983905d184106bfa49e29589f952e', '2018-10-29 15:00:09');

-- ----------------------------
-- Table structure for honeypot_config
-- ----------------------------
DROP TABLE IF EXISTS `honeypot_config`;
CREATE TABLE `honeypot_config` (
  `honeypot_config_id` varchar(32) NOT NULL COMMENT '蜜罐配置id',
  `honeypot_gateway` varchar(32) DEFAULT NULL,
  `honeypot_ip` varchar(32) DEFAULT NULL COMMENT '蜜罐IP',
  `honeypot_mac` varchar(32) DEFAULT NULL COMMENT '蜜罐服务器mac地址',
  `honeypot_switch_port` varchar(64) DEFAULT NULL COMMENT '蜜罐所接交换机及端口',
  `mtd_id` varchar(11) DEFAULT NULL COMMENT 'mtd的id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`honeypot_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honeypot_config
-- ----------------------------
INSERT INTO `honeypot_config` VALUES ('202457fcc83848c9b48f091378fb20e6', '192.168.6.6', '192.168.8.8', '00:01:6C:06:A6:29', 'openflow:1:2', null, '2018-10-30 16:40:59');
INSERT INTO `honeypot_config` VALUES ('6ed57f1eba9e4eb78b2d9061b9927938', '192.168.88.8', '192.168.8.8', '00:01:6C:06:A6:29', 'openflow:2038063737063325569:50', null, '2018-10-30 16:13:51');
INSERT INTO `honeypot_config` VALUES ('d156bee2082a4a23b88ed7f698856b84', '192.168.3.3', '192.168.8.9', '00:01:6C:06:A6:29', 'openflow:1:2', null, '2018-10-30 16:14:53');

-- ----------------------------
-- Table structure for honeypot_log
-- ----------------------------
DROP TABLE IF EXISTS `honeypot_log`;
CREATE TABLE `honeypot_log` (
  `honeyptlog_id` varchar(32) NOT NULL COMMENT '蜜罐日志id',
  `src_mac` varchar(32) DEFAULT NULL COMMENT '源mac地址',
  `dst_mac` varchar(32) DEFAULT NULL COMMENT '目的mac地址',
  `src_ip` varchar(16) DEFAULT NULL COMMENT '源ip',
  `dst_ip` varchar(16) DEFAULT NULL COMMENT '目的ip',
  `src_port` varchar(10) DEFAULT NULL COMMENT '源端口',
  `dst_port` varchar(10) DEFAULT NULL COMMENT '目的端口',
  `proto` varchar(10) DEFAULT NULL COMMENT '协议',
  `honeypt_ip` varchar(16) DEFAULT NULL COMMENT '蜜罐ip',
  `time` datetime DEFAULT NULL COMMENT '日志时间',
  `create_time` datetime DEFAULT NULL COMMENT '日志入库时间',
  PRIMARY KEY (`honeyptlog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honeypot_log
-- ----------------------------
INSERT INTO `honeypot_log` VALUES ('02bb1a1f4ef042d9a371bb6c38fed46e', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '40836', '21', 'tcp', '192.168.100.100', '2018-11-12 15:25:35', '2018-11-12 15:42:30');
INSERT INTO `honeypot_log` VALUES ('2b1c75b0003d48e2a8f432cdd9ca8adc', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '40836', '21', 'tcp', '192.168.100.100', '2018-11-12 15:25:35', '2018-11-12 15:43:00');
INSERT INTO `honeypot_log` VALUES ('3ca3080dfdda47b38534587c45ed2915', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '50772', '22', 'tcp', '192.168.100.100', '2018-11-12 15:31:39', '2018-11-12 15:42:30');
INSERT INTO `honeypot_log` VALUES ('4c5871ab9c2f4938b5667f6a2330b3e3', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '40836', '21', 'tcp', '192.168.100.100', '2018-11-12 15:25:35', '2018-11-12 15:41:30');
INSERT INTO `honeypot_log` VALUES ('58075e7299f74fd0a5bab80e0a1a42f1', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '40836', '21', 'tcp', '192.168.100.100', '2018-11-12 15:25:35', '2018-11-12 15:42:00');
INSERT INTO `honeypot_log` VALUES ('5af3f9cc941643b087cbed452f873db1', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '50772', '22', 'tcp', '192.168.100.100', '2018-11-12 15:31:39', '2018-11-12 15:41:30');
INSERT INTO `honeypot_log` VALUES ('6c8b05032e654c188a8969b4155fac4f', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '40836', '21', 'tcp', '192.168.100.100', '2018-11-12 15:25:35', '2018-11-12 15:39:30');
INSERT INTO `honeypot_log` VALUES ('6ce4f195f1284294b7c3ffe789dcc9f2', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '40836', '21', 'tcp', '192.168.100.100', '2018-11-12 15:25:35', '2018-11-12 15:40:30');
INSERT INTO `honeypot_log` VALUES ('800fa2e9df814b42a12ef217d478ff13', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '50772', '22', 'tcp', '192.168.100.100', '2018-11-12 15:31:39', '2018-11-12 15:43:00');
INSERT INTO `honeypot_log` VALUES ('8419b4afa31244d3a8fdf7004639baa3', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '40836', '21', 'tcp', '192.168.100.100', '2018-11-12 15:25:35', '2018-11-12 15:41:00');
INSERT INTO `honeypot_log` VALUES ('8dd71cb391c145c593241be83316688e', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '50772', '22', 'tcp', '192.168.100.100', '2018-11-12 15:31:39', '2018-11-12 15:40:00');
INSERT INTO `honeypot_log` VALUES ('8eec8872097b405a9f4044ad96328ae2', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '50772', '22', 'tcp', '192.168.100.100', '2018-11-12 15:31:39', '2018-11-12 15:38:31');
INSERT INTO `honeypot_log` VALUES ('b29240c77feb4af6a0d50361228ad9b8', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '50772', '22', 'tcp', '192.168.100.100', '2018-11-12 15:31:39', '2018-11-12 15:39:00');
INSERT INTO `honeypot_log` VALUES ('bfc105b555194f87ba54889e38830f99', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '50772', '22', 'tcp', '192.168.100.100', '2018-11-12 15:31:39', '2018-11-12 15:39:30');
INSERT INTO `honeypot_log` VALUES ('c62fa894ef624f2d8345ace1229f4fa0', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '50772', '22', 'tcp', '192.168.100.100', '2018-11-12 15:31:39', '2018-11-12 15:42:00');
INSERT INTO `honeypot_log` VALUES ('c84449ce1233461a93ccee76dfc49f9c', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '40836', '21', 'tcp', '192.168.100.100', '2018-11-12 15:25:35', '2018-11-12 15:38:31');
INSERT INTO `honeypot_log` VALUES ('dbf685151f1240c2a91a6a2d460120a1', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '50772', '22', 'tcp', '192.168.100.100', '2018-11-12 15:31:39', '2018-11-12 15:40:30');
INSERT INTO `honeypot_log` VALUES ('e51ef6f94eb1489e87f57ed96e46f7a5', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '50772', '22', 'tcp', '192.168.100.100', '2018-11-12 15:31:39', '2018-11-12 15:41:00');
INSERT INTO `honeypot_log` VALUES ('f6ad2fe4661a4c1aa22a589001fa2546', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '40836', '21', 'tcp', '192.168.100.100', '2018-11-12 15:25:35', '2018-11-12 15:40:00');
INSERT INTO `honeypot_log` VALUES ('f74a7aa27f8d488e895d1df305ed4098', '00:0c:29:95:82:4a', '78:45:c4:2d:32:1d', '20.0.0.14', '100.0.0.1', '40836', '21', 'tcp', '192.168.100.100', '2018-11-12 15:25:35', '2018-11-12 15:39:00');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` varchar(32) NOT NULL,
  `log_user` varchar(32) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `log_ip` varchar(15) DEFAULT NULL,
  `log_action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('0015fa2482e64ba498cf1d2b30bcaff1', 'admin', '2018-09-25 17:05:28', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0023ae0f5d0749dbb2bc0c075de5f4ea', 'admin', '2018-09-14 13:53:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('00cd98a0aca5494db33fab8dc4be3e86', 'admin', '2018-10-10 14:07:01', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0165d85a678543c9beac5960e2be9a02', 'admin', '2018-06-14 15:54:55', '127.0.0.1', '');
INSERT INTO `log` VALUES ('01776f3bbcad4669975a323c20972648', 'admin', '2018-09-13 15:03:35', '127.0.0.1', '');
INSERT INTO `log` VALUES ('02305d9b25214197b9e12bb8f2cd6cc5', 'admin', '2017-11-13 10:47:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('024021f259444cbfbee7b40a2384d43b', 'admin', '2017-03-09 17:23:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0282789cf07c40a594607bc2ca0c6bd8', 'admin', '2018-10-17 08:53:19', '127.0.0.1', '');
INSERT INTO `log` VALUES ('02b1fabcf2984bf3824721d3d3f09f77', 'ceshi', '2018-10-11 10:37:18', '127.0.0.1', '');
INSERT INTO `log` VALUES ('035372fb30204ca2a30b74debc24a6a3', 'admin', '2018-10-09 13:43:13', '127.0.0.1', '');
INSERT INTO `log` VALUES ('03770fb43d3840e18e9d5115ff6fbbdc', 'ceshi', '2018-11-12 14:49:09', '127.0.0.1', '');
INSERT INTO `log` VALUES ('044213bf81524b719a986d42149c9522', 'admin', '2018-10-16 14:34:26', '127.0.0.1', '');
INSERT INTO `log` VALUES ('047a4bd07c89430cac02aa2c6557f3d4', 'admin', '2018-10-15 13:45:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('04f3d665e96d4c38bb0fb2865427768b', 'ceshi', '2018-11-19 14:25:35', '127.0.0.1', '');
INSERT INTO `log` VALUES ('056342b35014482699053c2efa52952e', 'admin', '2018-09-25 14:42:42', '127.0.0.1', '');
INSERT INTO `log` VALUES ('057a98e702884724b7168b6fdd3ca168', 'wph', '2018-09-18 17:54:43', '127.0.0.1', '');
INSERT INTO `log` VALUES ('05bfcd52693949a1a841dd360d3f3425', 'admin', '2018-09-28 10:14:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('083690d4c560443db811c05267e742ff', 'ceshi', '2018-09-26 17:25:02', '127.0.0.1', '');
INSERT INTO `log` VALUES ('08f099209a33459cbee55be41e1e3350', 'admin', '2018-10-18 11:28:42', '127.0.0.1', '');
INSERT INTO `log` VALUES ('08f932c46e5348ba8705edcbd29d87e6', 'admin', '2018-10-09 17:16:19', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0a683ffe6e934a64a5c318093fddebf1', 'admin', '2018-10-08 11:38:20', '59.110.228.223', '');
INSERT INTO `log` VALUES ('0a728ee6a61d4778bdcd39f71234b8bd', 'ceshi', '2018-10-23 11:12:19', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0b03980018104a8f8b58ebd75232fb4b', 'ceshi', '2018-11-19 14:17:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0b83b187a7bf48cc8f93fffd05d1c2d4', 'admin', '2018-10-10 16:44:58', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0bd58d5c8cd240caa8202f0be89527af', 'ceshi', '2018-09-26 17:10:18', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0c7734f5c51947ae8c230b695b32e38a', 'ceshi', '2018-11-01 15:11:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0ca9ba4f65594ac2a44ef65f405ace13', 'admin', '2018-10-08 10:25:37', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0d183e6efa5f423ba183f661e3e93559', 'admin', '2018-10-11 11:07:22', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0dcfd24ad62a4a62b9bd10936ac87dcf', 'ceshi', '2018-10-31 16:42:22', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0e001c623b024d18b28ae3156e50c9d5', 'admin', '2018-09-26 13:52:52', '127.0.0.1', '');
INSERT INTO `log` VALUES ('0e5e07a7190f45718bb7c61270d7a6f1', 'admin', '2018-10-11 14:53:57', '127.0.0.1', '');
INSERT INTO `log` VALUES ('107d3a213c7249c3875cdfff66e834ef', 'admin', '2018-09-26 17:20:09', '127.0.0.1', '');
INSERT INTO `log` VALUES ('10ee5e34694348a39a1134e5252a169b', 'admin', '2018-10-16 09:30:39', '127.0.0.1', '');
INSERT INTO `log` VALUES ('113495ad254245fb820b7d74e05a3509', 'ceshi', '2018-10-30 17:57:31', '10.10.216.23', '');
INSERT INTO `log` VALUES ('119d59ecd7e34300964fe664a6cfc834', 'admin', '2018-09-13 14:51:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('122a5ec172854fe2a6d3fc1c5ffd9362', 'ceshi', '2018-10-29 08:56:17', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1278c5a140704d38a8d9b3d4a08882f8', 'ceshi', '2018-10-22 14:49:34', '127.0.0.1', '');
INSERT INTO `log` VALUES ('13a1fecfa82f45c495ff860fcd144ead', 'admin', '2018-10-11 15:35:44', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1438acf5b2604d78b6900504b99600f4', 'wph', '2018-09-13 14:57:36', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1528ff7e62854858a3d1e1a79a4b464e', 'admin', '2018-10-11 11:11:01', '127.0.0.1', '');
INSERT INTO `log` VALUES ('15d2b067da75478d9197b136c4726cb8', 'ceshi', '2018-10-27 15:20:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('164d9d6cebe945d5bab2d59b7fa52662', 'admin', '2018-09-26 16:15:49', '127.0.0.1', '');
INSERT INTO `log` VALUES ('167012b5e76f48939f6813e23cf92bdc', 'admin', '2018-09-25 16:29:58', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1678f40bc9014392b5d05b931d266379', 'ceshi', '2018-10-24 20:46:31', '61.52.212.242', '');
INSERT INTO `log` VALUES ('169dde283c994732a37bdbf8a0a73d4b', 'admin', '2018-10-11 10:41:34', '127.0.0.1', '');
INSERT INTO `log` VALUES ('16c115c7562744df8110775106cea5c4', 'ceshi', '2018-09-27 14:03:43', '127.0.0.1', '');
INSERT INTO `log` VALUES ('16cc2b4324024b888c919b8738376547', 'admin', '2018-10-11 17:32:03', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1937ec1fe3e94b2087c1f3f8abff6d30', 'admin', '2018-09-21 17:13:04', '127.0.0.1', '');
INSERT INTO `log` VALUES ('19bc505c4fa04f678112c20e61b587ef', 'ceshi', '2018-11-01 16:26:28', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1a0d2a5cdcbd43bbad185489d452c62c', 'wph', '2018-09-14 15:45:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1a833ab6baac411ea1da72b299beb8df', 'ceshi', '2018-11-08 09:54:01', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1b5e9d2aced04bcca6426cae8e363902', 'ceshi', '2018-11-23 14:17:06', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1b6f39b3d8e5413380ffe6baa13cb041', 'admin', '2018-10-11 17:26:31', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1bba650696b84adcb905dbfe549777d4', 'admin', '2018-09-26 17:28:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1bff06c0a48246c8aaf377913f30bfcb', 'ceshi', '2018-10-30 09:31:48', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1c5c061255764b12b075d52cd4c93244', 'ceshi', '2018-09-13 17:21:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1c75f6d3f8c84054b7946d404e4078a4', 'ceshi', '2018-09-25 16:29:08', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1ce31dacce8e4746b327771eae926af0', 'admin', '2018-10-09 09:44:35', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1cf9237d01c948ce9692d3877fc2e9f4', 'admin', '2018-09-21 16:40:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1d6d2b1afb804da5bb125ce310a57509', 'ceshi', '2018-11-19 09:10:01', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1d77d6dcb9c64c2caf2f6af6c0ad1e4d', 'admin', '2018-09-13 14:47:56', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1dab6ef0e4204c1daf61cc87ded7399c', 'admin', '2018-09-18 11:52:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1de1ca5dd4b54498bf1e18337a41bed2', 'ceshi', '2018-11-16 17:17:18', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1df3fa726f2d4b6f96b224c67015a41c', 'admin', '2018-09-18 17:08:26', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1e091409d5304efa9ad7045ab8babeab', 'ceshi', '2018-09-14 09:54:31', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1e0970f8ed984604b16e388089d73320', 'ceshi', '2018-10-24 13:46:10', '59.110.228.223', '');
INSERT INTO `log` VALUES ('1e76c11286ba4d7baee170aba254ea5f', 'admin', '2018-09-21 10:33:49', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1ea9a071808e4bd985cd7c5a0102427f', 'admin', '2018-10-11 17:27:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('1f98e6f8f2f141f6b70742c2c2b7b6a1', 'admin', '2018-09-19 16:48:52', '127.0.0.1', '');
INSERT INTO `log` VALUES ('201cc106e7c843eb8f85085505fed8ac', 'ceshi', '2018-10-27 10:11:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('205c2d2658af4a57a319980a23931b02', 'ceshi', '2018-10-25 10:40:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('20f96f608ad74a8d8b5e7f4c7e0411f1', '222', '2018-10-09 09:23:45', '59.110.228.223', '');
INSERT INTO `log` VALUES ('213de2106fea41c996026f9cb13eb250', 'admin', '2018-09-18 11:55:48', '127.0.0.1', '');
INSERT INTO `log` VALUES ('22191f7eb00f4774b175d920bf00dbab', 'admin', '2018-10-09 11:14:20', '127.0.0.1', '');
INSERT INTO `log` VALUES ('227965c60eb0479ebb25e41348555f8f', 'admin', '2018-09-25 17:07:28', '127.0.0.1', '');
INSERT INTO `log` VALUES ('22d4e31793fb4e08b2ad609921f740ec', 'ceshi', '2018-11-01 19:53:48', '127.0.0.1', '');
INSERT INTO `log` VALUES ('230d06003e154634a24ac6c321a90ddb', 'admin', '2018-09-27 14:04:13', '127.0.0.1', '');
INSERT INTO `log` VALUES ('237c9b657c474e139c53b5114140fe20', 'ceshi', '2018-11-15 11:38:07', '127.0.0.1', '');
INSERT INTO `log` VALUES ('238144411d3f41f0a520c3124ad1c7b1', 'admin', '2018-10-09 09:32:13', '59.110.228.223', '');
INSERT INTO `log` VALUES ('23a97518fd894ab5934d21e7702624c2', 'ceshi', '2018-11-15 15:33:37', '127.0.0.1', '');
INSERT INTO `log` VALUES ('2498bd6381b24c59a7707df30ab563c0', 'admin', '2018-09-21 16:56:36', '127.0.0.1', '');
INSERT INTO `log` VALUES ('25171d6dfeea4c3f829c7e2bde11fcde', 'admin', '2018-09-25 14:20:02', '127.0.0.1', '');
INSERT INTO `log` VALUES ('2787d9d5c25d45f0b0ca576a81e8a25b', 'admin', '2018-10-21 16:24:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('27df5bbbdf714a36ad18da28bb2e4bc5', 'admin', '2018-10-15 09:16:24', '127.0.0.1', '');
INSERT INTO `log` VALUES ('29243bbd2f8449e2baaa83b9d19904dd', 'ceshi', '2018-11-15 11:36:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('294985e7fb6d40ddb1dadef70580010a', 'ceshi', '2018-11-15 18:37:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('29a00424f99b4555b2d4eb47076aae37', 'admin', '2018-09-27 09:13:21', '127.0.0.1', '');
INSERT INTO `log` VALUES ('29d0352554ca4a04a8cff9b6c772065c', 'admin', '2018-10-09 15:51:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('29d2c58335a542b98832a932495a9ac0', 'admin', '2018-09-18 17:54:13', '127.0.0.1', '');
INSERT INTO `log` VALUES ('29eaeea261b74360b91afe9687e4ee55', 'admin', '2018-10-10 14:56:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('29ec02f10ac248c79ee7fbb673d7fcfc', 'admin', '2018-09-13 14:51:49', '127.0.0.1', '');
INSERT INTO `log` VALUES ('2a028cdd7e4c4a229e97783169b18d27', 'ceshi', '2018-10-23 10:40:17', '59.110.228.223', '');
INSERT INTO `log` VALUES ('2b1ae3ec855f4dba96a7e1e4779d0c6e', 'ceshi', '2018-10-25 17:03:36', '127.0.0.1', '');
INSERT INTO `log` VALUES ('2b5fcd6a2ea946a1b26aec4239ffd6f3', 'admin', '2018-10-08 16:35:38', '59.110.228.223', '');
INSERT INTO `log` VALUES ('2bdd47d075734664a03410a5c3309653', 'admin', '2018-09-16 15:12:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('2c2ff1dc5e994eb7ab0c0f15095c0972', 'ceshi', '2018-11-06 09:49:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('2db9bb1f8b47404cb83efbf0ad21b670', 'admin', '2018-10-11 10:54:45', '127.0.0.1', '');
INSERT INTO `log` VALUES ('2e9a413470e64a2db477eafb3e9d55d7', 'admin', '2018-10-19 15:18:00', '127.0.0.1', '');
INSERT INTO `log` VALUES ('2ede9294561c4a10ab776e3bfdb7d87f', 'admin', '2018-10-18 11:31:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('2f8b224f7f44460ab0292210eabf0c63', 'ceshi', '2018-11-23 09:42:57', '127.0.0.1', '');
INSERT INTO `log` VALUES ('2fb5503e57884d108d1dc536b1e433e5', 'admin', '2018-10-10 17:00:36', '127.0.0.1', '');
INSERT INTO `log` VALUES ('30687511afc04c35a285511dac1a9fca', 'admin', '2018-09-21 17:07:58', '127.0.0.1', '');
INSERT INTO `log` VALUES ('30e7c4c68cad47f899838cfe3c35b8f6', 'admin', '2018-09-13 15:05:08', '127.0.0.1', '');
INSERT INTO `log` VALUES ('311b86e643674b3dbe8dd20635e7e8e7', 'admin', '2018-09-13 14:23:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('327cf5aec9f540e193ffa9358c34eed9', 'admin', '2018-10-12 09:49:25', '127.0.0.1', '');
INSERT INTO `log` VALUES ('328197fae4b445b6b88eba95dd84957f', 'admin', '2018-10-17 13:32:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('32d5465e1e89467380e38afdcc38cedd', 'admin', '2018-09-16 15:23:38', '127.0.0.1', '');
INSERT INTO `log` VALUES ('33d26b996f2342439ce86d905c9f78e2', 'ceshi', '2018-11-15 17:02:22', '127.0.0.1', '');
INSERT INTO `log` VALUES ('35411f4f57ad4c719a2970d9087c720b', 'admin', '2018-10-16 13:57:37', '127.0.0.1', '');
INSERT INTO `log` VALUES ('35aa4cdb6744438fbd5b55bc7104b60e', 'admin', '2018-09-30 16:49:05', '59.110.228.223', '');
INSERT INTO `log` VALUES ('368670a1640a46f0b8d07da3ee81d3db', 'ceshi', '2018-10-02 23:52:22', '127.0.0.1', '');
INSERT INTO `log` VALUES ('369993b0a49c4fa2b045220dd69ee9dd', 'admin', '2018-09-17 16:48:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('37331df9681749adb9fe40f0d4e97969', 'admin', '2018-10-11 09:12:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('37510139c7d74c02aafbfd1858b8ab06', 'flyshy', '2018-10-11 10:36:37', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3846ba772ba242e4b610ad4d22aec8c2', 'ceshi', '2018-10-24 10:32:33', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3855be211249429aa8d744ba01d67a34', 'admin', '2018-10-12 11:15:18', '127.0.0.1', '');
INSERT INTO `log` VALUES ('39f0c7f26e5f4104822e00954ac02225', 'admin', '2018-09-13 15:26:07', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3a109dbbb1d547f1980881bc230daff9', 'ceshi', '2018-10-24 13:40:47', '59.110.228.223', '');
INSERT INTO `log` VALUES ('3a1e48af8bb849deb36e6cd208ede23a', 'ceshi', '2018-11-01 09:13:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3a7263ffe80148c9bbfb617f2e0e4d99', 'admin', '2018-09-14 17:09:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3acdefdd40744f5ea72a9ca595506e3d', 'ceshi', '2018-11-15 16:57:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3b0f5c3f9b024d02a82608da4dc0c302', 'admin', '2018-10-09 16:18:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3b55eff81db3408482769403b0f718ab', 'admin', '2018-09-13 15:02:07', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3b7fe6faaad342db9bd6b904fcb97611', 'admin', '2018-09-30 16:56:36', '59.110.228.223', '');
INSERT INTO `log` VALUES ('3b83cdf552bf4a85b2ee462cf93dda57', 'ceshi', '2018-10-24 13:49:22', '59.110.228.223', '');
INSERT INTO `log` VALUES ('3c2ddfdc0d584b9b8453ba64f69540b3', 'ceshi', '2018-11-16 10:56:34', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3cfc27909312498abf960fa253fb8b57', 'admin', '2018-10-10 17:00:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3d52b62756bf4a2e908ee3d4d6a57497', 'ceshi', '2018-10-24 18:43:41', '59.110.228.223', '');
INSERT INTO `log` VALUES ('3d7103d856b0442e84d4f0a6a6385d52', 'admin', '2018-10-04 21:16:23', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3d9b7de721dc413e851da07806da6e43', 'ceshi', '2018-10-26 09:42:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3dd98d91130c4704a5bbe8ad958371a4', 'wph', '2018-09-13 15:03:51', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3f7abbe414d44a22a2cd67a642e8f156', 'ceshi', '2018-11-05 19:24:50', '59.110.228.223', '');
INSERT INTO `log` VALUES ('3f9d1611cd0c4342b21fe6e614a8defe', 'ceshi', '2018-11-15 16:54:30', '127.0.0.1', '');
INSERT INTO `log` VALUES ('3fd4ab7bc84f4d6f9fece7afb3f63db5', 'admin', '2018-10-11 10:32:48', '127.0.0.1', '');
INSERT INTO `log` VALUES ('40cdf2bbe97346b5ac380afa6e97fe8f', 'admin', '2018-09-13 16:35:37', '127.0.0.1', '');
INSERT INTO `log` VALUES ('412960e8051e4c8fb6b5f9cd40d745f0', 'admin', '2018-09-13 16:42:56', '127.0.0.1', '');
INSERT INTO `log` VALUES ('412de4486cee436d902a439001745e65', 'admin', '2018-09-18 15:18:49', '127.0.0.1', '');
INSERT INTO `log` VALUES ('41a1671acc984478a370e39c79c0ad12', 'admin', '2018-09-13 16:43:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('41a84e86e894408585da9f683d44de7d', 'admin', '2018-09-25 14:19:38', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4245e806137e4d3dbb2a67155c429327', 'admin', '2018-09-26 16:14:04', '127.0.0.1', '');
INSERT INTO `log` VALUES ('431d3530eae24e18aadea76a25d87e71', 'admin', '2018-09-13 15:49:43', '127.0.0.1', '');
INSERT INTO `log` VALUES ('43a7c136ea50430b9e63f3b717610d21', 'ceshi', '2018-10-29 22:33:13', '127.0.0.1', '');
INSERT INTO `log` VALUES ('440c3382bec04116b5e11e637cb26c8c', 'ceshi', '2018-11-05 19:24:51', '59.110.228.223', '');
INSERT INTO `log` VALUES ('452a4b6fdfc148c48382bd2b14700717', 'ceshi', '2018-10-02 23:53:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('462f7508ab564d80b327e1eb522b9a6c', 'admin', '2018-09-18 16:20:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4643bef6e0d9432fac364d57135b586b', 'ceshi', '2018-10-29 23:04:52', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4678ec1354514fbd9bfaeac52a9bb83b', 'admin', '2018-09-18 14:40:52', '127.0.0.1', '');
INSERT INTO `log` VALUES ('46a3415dade240bfa66f4fb83e3126b5', 'ceshi', '2018-11-16 16:13:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('47c223ce0f07444ca1ec7ff6ee6fed4a', 'ceshi', '2018-11-15 14:37:11', '127.0.0.1', '');
INSERT INTO `log` VALUES ('481c521aee124561b97c3d8fad8dc927', 'admin', '2018-09-14 09:54:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('482510c1653042a880231e671142b7af', 'admin', '2018-09-18 17:22:35', '127.0.0.1', '');
INSERT INTO `log` VALUES ('48a827869d9f48e59f1f7db6f2042627', 'ceshi', '2018-09-26 17:18:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('48aefe2bc994470788456d105044b6cf', 'ceshi', '2018-10-11 14:03:50', '127.0.0.1', '');
INSERT INTO `log` VALUES ('48ff36af3ae245a79b9aa5dec4114433', 'admin', '2018-09-17 16:41:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('496db4e6674c496ab27fadeeba5d3dcd', 'admin', '2018-10-21 10:52:36', '127.0.0.1', '');
INSERT INTO `log` VALUES ('49a06c3b8457450aa1fc2befaa3b84b8', 'admin', '2018-09-13 17:21:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('49d5438c8c98444f88a3e99b2b78308a', 'admin', '2018-10-12 14:15:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4a4ab278080b4ac58fcf59b30027c444', 'ceshi', '2018-10-10 14:46:51', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4b59a1374c4344bd8efd46a29e2e2708', 'ceshi', '2018-10-26 17:56:44', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4bae6182d0db454a9c3b887ab746a403', 'admin', '2018-10-12 15:10:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4bdc89c2ddd847998be345e10e4460d5', 'admin', '2018-09-19 15:44:52', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4c5af8a567844b7580f5494a6fda22d3', 'ceshi', '2018-10-11 14:04:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4d4614a8aa4e44068c5494b7fa05707a', 'ceshi', '2018-11-08 15:23:11', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4e630794d89b4723badc96315ad29c9f', 'admin', '2018-09-18 17:58:39', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4ebfc18514ae4276972c0b1eccff9373', 'ceshi', '2018-10-21 17:19:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4ed631dd17ae4985a896e2debee3f6b1', 'ceshi', '2018-11-14 17:27:45', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4f05b004f77946e7a7e86dd3c9fa4c15', 'admin', '2018-10-19 11:21:56', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4f35fd89000e4e95ab7f6ccb18ac996d', 'admin', '2018-09-26 17:00:29', '127.0.0.1', '');
INSERT INTO `log` VALUES ('4f518182f561428db7b16ce6c6563146', 'ceshi', '2018-10-11 14:05:29', '127.0.0.1', '');
INSERT INTO `log` VALUES ('505e50f5fc704a67bd756bf33d9e9d6f', 'admin', '2018-10-12 15:05:00', '127.0.0.1', '');
INSERT INTO `log` VALUES ('50da089b435641bb9c915b2eeee27eaf', 'admin', '2018-09-27 09:01:37', '127.0.0.1', '');
INSERT INTO `log` VALUES ('511bf2273cc24909b7e0071d0c927e27', 'admin', '2018-10-11 13:39:19', '127.0.0.1', '');
INSERT INTO `log` VALUES ('511c9eb1607f47eaa31463b2b4089285', 'ceshi', '2018-10-12 11:23:26', '127.0.0.1', '');
INSERT INTO `log` VALUES ('513da46bc54840a0a60fd83411ecf93c', 'admin', '2018-10-18 13:43:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('51c40807a6654dc283cf746e33dac77f', 'admin', '2018-09-13 15:40:04', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5203973537f74b168adbb5b1c73017f8', 'ceshi', '2018-10-28 10:33:23', '127.0.0.1', '');
INSERT INTO `log` VALUES ('52c3a45f135a4fc1aad2c9dea114f79d', 'admin', '2018-09-25 17:12:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('53af42c182fc4184bf9baea624202ab7', 'admin', '2018-09-14 09:27:13', '127.0.0.1', '');
INSERT INTO `log` VALUES ('53f49a024d1148a38f9065b75f280c99', 'ceshi', '2018-10-25 09:15:06', '59.110.228.223', '');
INSERT INTO `log` VALUES ('54ed956e750747d48db651e93076c0ef', 'admin', '2018-09-26 16:25:18', '127.0.0.1', '');
INSERT INTO `log` VALUES ('552286ed91fd46a7bdf6decf3b5b3422', 'admin', '2018-09-26 16:17:55', '127.0.0.1', '');
INSERT INTO `log` VALUES ('55df340bbec74e0983bc11687d6b07f6', 'admin', '2018-10-10 14:35:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5636d112d25e416299a19d61bb03eacf', 'admin', '2018-09-18 16:42:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('566c8439fcbe411db307c83b01974a04', 'admin', '2018-10-12 11:20:28', '127.0.0.1', '');
INSERT INTO `log` VALUES ('56af9f52cc314edbbbf0f7a86585fd2c', 'admin', '2018-10-11 16:56:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('578f4bef2f224dfd93cdd61b45babba8', 'admin', '2018-10-08 12:43:56', '59.110.228.223', '');
INSERT INTO `log` VALUES ('57bb7d0067194dd482d1ab0500fc96f2', 'admin', '2018-09-13 14:39:16', '127.0.0.1', '');
INSERT INTO `log` VALUES ('57f5ed059f44490eb9646d0dee38290f', 'admin', '2018-10-09 16:33:17', '127.0.0.1', '');
INSERT INTO `log` VALUES ('58d3657fd1904dfa926bfeb0f5f3d9bf', 'admin', '2018-09-26 16:51:23', '127.0.0.1', '');
INSERT INTO `log` VALUES ('59234c32cc5a4ad9a066d281d53e5a31', 'admin', '2018-09-27 13:48:55', '127.0.0.1', '');
INSERT INTO `log` VALUES ('592ae6a1fdc34994a8e3e633e3e734ca', 'ceshi', '2018-11-15 15:00:02', '127.0.0.1', '');
INSERT INTO `log` VALUES ('59b74cf1b9894df78b86ca8882a16112', 'ceshi', '2018-10-04 21:13:31', '127.0.0.1', '');
INSERT INTO `log` VALUES ('59cf45bb19624c258361e0ca1ffc6a6b', 'admin', '2018-09-30 16:47:18', '59.110.228.223', '');
INSERT INTO `log` VALUES ('59f826ac1aec4f01b829abde96ab6214', 'admin', '2018-09-25 11:29:38', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5ad9e0a8d2294177b06a7e05b797d492', 'wph', '2018-09-13 15:00:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5af9c0dac5564a1e932926b366856e95', 'ceshi', '2018-11-15 14:54:41', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5b48b4ee14f84422b8e61e0282d8f55a', 'ceshi', '2018-09-26 17:00:16', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5b49def949f341878295fab2edfafa41', 'ceshi', '2018-11-15 11:31:44', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5b60355d462f44a39c2467db1abb65b7', 'admin', '2018-10-12 11:19:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5bf3d5b02d77464bb1104142cd103b7e', 'admin', '2018-09-28 14:32:55', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5c0c06f88e9a41e5af960fedf2a7bc7a', 'ceshi', '2018-11-02 15:40:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5c4a939b284f42d687f0a8e74b1b5515', 'admin', '2018-10-15 09:41:36', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5cfdf435442142f885c0b371f1c93385', 'admin', '2018-10-23 15:25:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5d5e03714eb44e9f80dc8cabab29e76c', 'ceshi', '2018-11-15 16:59:11', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5d7ce2e7d61f4c1baa465e8d9ca9e957', 'ceshi', '2018-09-14 09:47:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5d8bbf4dc53747eba478517a5afc2733', 'admin', '2018-10-21 17:20:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5dd8bf3198f64c74ac0ad75295b2767e', 'admin', '2018-10-09 11:00:34', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5ec3135457e3421ab89bbebfa3bd5ca1', 'ceshi', '2018-10-24 12:58:48', '59.110.228.223', '');
INSERT INTO `log` VALUES ('5f3afc16d50e4f9d9f49cbce3e4038bb', 'ceshi', '2018-11-06 14:12:03', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5f5d18f60e36481692bb51614fc63345', 'admin', '2018-09-18 14:28:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5f5d221c2bae4c12b352cc9c76141ee9', 'admin', '2018-10-17 09:44:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('5fa1b0ee77ba4209a7fc2e6302155cf3', 'ceshi', '2018-10-23 15:27:35', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6028d63e499443008d8c0cd484c62e12', 'admin', '2018-09-14 11:38:56', '127.0.0.1', '');
INSERT INTO `log` VALUES ('604d64c096e84e21a853e58bea1b7669', 'ceshi', '2018-11-16 17:18:06', '10.10.216.10', '');
INSERT INTO `log` VALUES ('60af55d03c184b1d945f21576bfd4227', 'admin', '2018-10-09 16:33:17', '127.0.0.1', '');
INSERT INTO `log` VALUES ('620dc0ea5e6848bbaa69b6324062aff6', 'wph', '2018-09-13 17:12:52', '127.0.0.1', '');
INSERT INTO `log` VALUES ('624810660f314c87b57730d844432b69', 'admin', '2018-09-13 16:41:11', '127.0.0.1', '');
INSERT INTO `log` VALUES ('62724a44523840249321a0b29bad3e90', 'ceshi', '2018-11-15 11:53:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6364f93d39f84ce8a7a7c8e261492ad2', 'admin', '2018-10-09 17:09:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('63f391ef83314a62aac80284c0a86568', 'admin', '2018-10-12 09:35:29', '127.0.0.1', '');
INSERT INTO `log` VALUES ('643ca59ac8fb4ea4ba3cbf130caed508', 'ceshi', '2018-09-26 16:59:25', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6493e58675ba4ce5873a879a2a59e2f8', 'ceshi', '2018-11-15 11:48:20', '127.0.0.1', '');
INSERT INTO `log` VALUES ('64fb7198662e46f1a9ad159da142d294', 'ceshi', '2018-09-26 17:07:29', '127.0.0.1', '');
INSERT INTO `log` VALUES ('650b608c2c574f8bb3fa59e28ef70664', 'admin', '2018-10-12 10:11:50', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6511708aaa3e4eca8caffb9d4c43c0ec', 'admin', '2018-09-14 10:36:58', '127.0.0.1', '');
INSERT INTO `log` VALUES ('65d212b0743a45818a0c60c78fa5ac2f', 'admin', '2018-09-29 10:37:16', '127.0.0.1', '');
INSERT INTO `log` VALUES ('66027570ae314a21ad6cb3dccf8ae0bf', 'wph', '2018-09-13 16:42:38', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6620cebfaaff491a85f06f2176c44e97', 'admin', '2018-10-12 09:34:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('67e4d06bd65d4eafa1598aa2d38e789d', 'ceshi', '2018-10-29 11:24:00', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6822cca109c64058a8d302114210d94e', 'admin', '2018-09-14 10:18:04', '127.0.0.1', '');
INSERT INTO `log` VALUES ('68e688b69ca74769bba4281f1c995a3a', 'admin', '2018-09-18 11:24:48', '127.0.0.1', '');
INSERT INTO `log` VALUES ('690f9961474340aea3de0ede0e383a9f', 'admin', '2018-10-02 16:19:15', '59.110.228.223', '');
INSERT INTO `log` VALUES ('69653c17b5044bf39e22f0c929eceb0b', 'admin', '2018-09-13 14:59:58', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6970fbae643b45b5a4e88103ce667bcf', 'ceshi', '2018-11-15 14:22:06', '127.0.0.1', '');
INSERT INTO `log` VALUES ('69b8a8fa3b9f41408fb22688de7cddf2', 'ceshi', '2018-11-16 18:47:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('69e9e788d71349a683859f45f696b66c', 'admin', '2018-10-16 17:37:20', '127.0.0.1', '');
INSERT INTO `log` VALUES ('69f2211078f24a029e58aa34ee460ec3', 'admin', '2018-10-12 10:34:11', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6a83de1465d34e9d8f9d1a5369c2e13f', 'admin', '2018-09-14 14:10:08', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6af801690023404baff72e77856d8be7', 'admin', '2018-10-19 16:20:35', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6b4ccb09397f4434b0847fbb510c4274', 'admin', '2018-10-09 17:18:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6b6a9f4d407d4fec9495c9c5dac0827f', 'ceshi', '2018-09-25 17:09:04', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6bb7dbe848b74a509443dee51af8c817', 'admin', '2018-10-11 11:02:50', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6c7e1cc6f0134e709e23ffc0e5549b6c', 'ceshi', '2018-09-13 17:24:03', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6c8b614285e340c28c51f3e0dd748a37', 'ceshi', '2018-10-29 23:06:20', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6ead9027c27e4a5781cd2e4f53870e2b', 'admin', '2018-10-11 10:48:28', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6f25cdf96a6b468c8c71d922798458b3', 'admin', '2018-09-26 16:13:58', '127.0.0.1', '');
INSERT INTO `log` VALUES ('6f639cab6fab4f3fb9e921551f08dfb7', 'ceshi', '2018-10-24 13:48:10', '59.110.228.223', '');
INSERT INTO `log` VALUES ('6f75314553b14a08b8e1303d1d93d1db', 'admin', '2018-09-27 14:00:08', '127.0.0.1', '');
INSERT INTO `log` VALUES ('70168a29d83545bd95bf8011eac8cd70', 'admin', '2018-10-12 10:04:26', '127.0.0.1', '');
INSERT INTO `log` VALUES ('71475de66e9341fd8052d0890245367c', 'ceshi', '2018-09-16 15:32:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('71d7426c13f0401dbf63d6c72641634f', 'admin', '2018-10-17 16:43:43', '127.0.0.1', '');
INSERT INTO `log` VALUES ('721cd402024347f3a1ede3a794bdfba2', 'admin', '2018-09-14 15:55:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7253f2b5c709420a86333dc93bb2f78c', 'ceshi', '2018-11-01 16:36:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7275dc687caa4148b3f7a64cc9fb0aff', 'admin', '2018-10-11 17:25:21', '127.0.0.1', '');
INSERT INTO `log` VALUES ('738d681ec6f64e8785077ea208793bb3', 'ceshi', '2018-10-21 17:46:28', '59.110.228.223', '');
INSERT INTO `log` VALUES ('73c5bf59468c4a52a0988f408928a5db', 'ceshi', '2018-11-23 14:18:22', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7468013de99b433c95cb0f5166d47298', 'admin', '2018-09-13 16:49:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('746ffa11ec7e44cdbcbfec10d0256d80', 'wph', '2018-09-14 14:36:09', '127.0.0.1', '');
INSERT INTO `log` VALUES ('74aead94854941b187729a2626fd391e', 'admin', '2018-10-09 14:57:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('754e0a94b93c4636b43007e6d4141a27', 'ceshi', '2018-09-17 16:47:44', '127.0.0.1', '');
INSERT INTO `log` VALUES ('75b17a6bda65410f8618b48754d9d474', 'ceshi', '2018-11-16 09:34:45', '127.0.0.1', '');
INSERT INTO `log` VALUES ('75d79ae09b13405992231aa95833cc64', 'admin', '2018-10-23 14:17:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7641d4b2f3364a1f81d42cfea1ac2f67', 'admin', '2018-10-15 09:18:50', '127.0.0.1', '');
INSERT INTO `log` VALUES ('76c6ab4573804b1bae138308ed056330', 'ceshi', '2018-11-12 16:16:21', '127.0.0.1', '');
INSERT INTO `log` VALUES ('77161a7e48bd43b5aae2fb9bba42900a', 'admin', '2018-09-18 14:55:22', '127.0.0.1', '');
INSERT INTO `log` VALUES ('77f7e825e5a94651b989a194589e81b3', 'admin', '2018-10-10 14:06:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7835700e5630490580f422afcb47331b', 'admin', '2018-10-09 10:24:28', '127.0.0.1', '');
INSERT INTO `log` VALUES ('788d9546d9cf44c8ac623211460d6394', 'ceshi', '2018-10-30 08:57:28', '127.0.0.1', '');
INSERT INTO `log` VALUES ('792c6cf577d44e13a9c472a573221c59', 'ceshi', '2018-10-12 11:32:04', '127.0.0.1', '');
INSERT INTO `log` VALUES ('79858857e3d04b5eb4e1421136df00ec', 'admin', '2018-09-28 10:21:19', '127.0.0.1', '');
INSERT INTO `log` VALUES ('79a3d36ff68d412b8208204f63614fa3', 'admin', '2018-09-27 14:02:30', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7a1f40b13b474d76a86eb4ba2816edda', 'admin', '2018-09-14 10:05:20', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7a67c37a7f304259ac36744051d0a1cf', 'ceshi', '2018-10-25 17:03:35', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7a6b9d4a689e4f378386456b9d8a77ef', 'admin', '2018-09-17 16:33:24', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7a9684ccc0b84987941ee9b6e75fba72', 'admin', '2018-10-04 20:51:39', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7ac473d51dc14599af43238960a6cb04', 'admin', '2018-09-21 16:36:03', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7b18e3a7d75a4e5d89c213fa06f13945', 'admin', '2018-09-26 17:32:24', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7b3913defbb9407cb7fd45688d7d3fdb', 'admin', '2018-09-26 16:17:45', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7b86e6a0e0894dc99e35584eb9965807', 'admin', '2018-10-11 14:43:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7b8fce77af8d4a158378355f39a5dfbb', 'admin', '2018-09-30 16:57:57', '59.110.228.223', '');
INSERT INTO `log` VALUES ('7bad70113218436088b7387bd17f9847', 'admin', '2018-10-09 09:51:11', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7bb8ab4240c94a81979e911779e9da21', 'admin', '2018-09-18 16:20:43', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7bd587705267479d9bc37b1ade5e2bff', 'ceshi', '2018-10-24 08:51:17', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7c6894795f7945c598ed355b653a4eea', 'ceshi', '2018-10-29 22:48:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7d5f96ec4e8c40ecbf4fc269009337b7', 'ceshi', '2018-10-26 17:59:06', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7dd28bb58cb64176bab01589af6c20a6', 'admin', '2018-10-10 14:48:34', '127.0.0.1', '');
INSERT INTO `log` VALUES ('7fe0e3cbcb2c4c7a92795ce2ba23b0ca', 'admin', '2018-10-10 09:18:30', '127.0.0.1', '');
INSERT INTO `log` VALUES ('800595ec969445abbc222905fa49c265', 'ceshi', '2018-10-12 11:24:30', '127.0.0.1', '');
INSERT INTO `log` VALUES ('800cbed065ca400a890cdc739c0f6cd2', 'admin', '2018-10-19 09:27:09', '127.0.0.1', '');
INSERT INTO `log` VALUES ('828113690f4945d19faf5a5d8b1b847a', 'admin', '2018-09-28 16:21:34', '127.0.0.1', '');
INSERT INTO `log` VALUES ('82afd94e7f3244158e7dd3e7144261dc', 'admin', '2018-10-10 16:53:38', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8332660cbafa4d18979f3d18bf6f1c01', 'admin', '2018-10-17 11:20:16', '127.0.0.1', '');
INSERT INTO `log` VALUES ('84b23181ae4d437d8e912405cca3139a', 'ceshi', '2018-10-30 14:35:25', '127.0.0.1', '');
INSERT INTO `log` VALUES ('84b4768714994ce1a16a6c800067d327', 'ceshi', '2018-10-11 10:41:55', '127.0.0.1', '');
INSERT INTO `log` VALUES ('84c8df3a62f2450aa140d0657dde757a', 'admin', '2018-09-27 09:15:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('84f183fbce7c48cf8a6df40e66513e0c', 'admin', '2018-10-11 09:15:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('854f39eb7eef49fda661e9cba8b11658', 'ceshi', '2018-11-16 15:45:11', '127.0.0.1', '');
INSERT INTO `log` VALUES ('85a28d62c28646ce8f5110c1d3ee99d4', 'ceshi', '2018-10-24 15:43:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('86215ad9b7394f29b322997d8c611c16', 'ceshi', '2018-10-02 23:54:07', '127.0.0.1', '');
INSERT INTO `log` VALUES ('864599c206ac46abb328f88bb661f643', 'ceshi', '2018-09-18 11:58:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('86606b582de649c589d4fc195381c971', 'admin', '2018-10-09 09:52:43', '127.0.0.1', '');
INSERT INTO `log` VALUES ('869dc79172df4b2eba130d6ecb4f9aff', 'ceshi', '2018-09-26 17:20:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('86c274202ab948848ed374d3ecbb2088', 'admin', '2018-10-17 08:55:41', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8709730593e94fbfb1af6c918fe1b653', 'admin', '2018-09-17 16:49:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('87663ac0ad66436194fa200065f75c86', 'admin', '2018-10-08 09:21:11', '127.0.0.1', '');
INSERT INTO `log` VALUES ('87893a24f80e4089a528ca27757167f8', 'ceshi', '2018-10-24 13:53:17', '59.110.228.223', '');
INSERT INTO `log` VALUES ('87ae6a41dadb497781569435abd31cdb', 'admin', '2018-09-18 09:42:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('87c5542cdb4d4eba8b0118de709fa0c9', 'ceshi', '2018-10-28 12:05:00', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8860324eb99f4dddb9a08a3e6ed594b6', 'admin', '2018-09-13 16:40:26', '127.0.0.1', '');
INSERT INTO `log` VALUES ('88cebe1ca233410493ee220929e8a309', 'ceshi', '2018-09-26 17:33:01', '127.0.0.1', '');
INSERT INTO `log` VALUES ('88e66279fa46476e8c2313575b6fc8e4', 'admin', '2018-09-18 15:04:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8937602dfc9f48c7a5f1454fbb452baa', 'admin', '2018-10-12 14:40:10', '59.110.228.223', '');
INSERT INTO `log` VALUES ('89dd71ce0f6e4948a52ea144b2b861a6', 'admin', '2018-09-27 11:38:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8a439fcbb42b479c85f2b634e74ff8c5', 'admin', '2018-10-18 13:36:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8a54aa4aa83b46f6937a3ee72160b474', 'admin', '2018-10-10 16:13:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8ab9097b595145b5b3917cf525d0b0b9', 'admin', '2018-10-18 09:13:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8bab4470b4494d7cb2abaf4d4d2f508a', 'admin', '2018-09-28 10:31:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8c881d8c08544a2eaf1deaf5107b63cc', 'admin', '2018-09-18 16:37:50', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8da1b398cc3d4519bc0caddd010620f7', 'admin', '2018-10-17 11:03:37', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8dcf5675e6bb48b6b92e06e474398a51', 'admin', '2018-09-21 16:52:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8e0572ae7369486bba036bd06a3d4591', 'admin', '2018-10-08 11:57:50', '59.110.228.223', '');
INSERT INTO `log` VALUES ('8e7f8d65e34f4fd298e6d310f33a8c57', 'admin', '2018-10-02 23:52:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8edd8d0896574f73b964a2b9c0578e7e', 'ceshi', '2018-11-12 09:10:41', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8fbe7f7cc27e476fb00aea3b1885d475', 'admin', '2018-09-16 15:33:18', '127.0.0.1', '');
INSERT INTO `log` VALUES ('8fd6658bba7c4df6a45fca070df35f2e', 'ceshi', '2018-10-28 16:25:13', '127.0.0.1', '');
INSERT INTO `log` VALUES ('90262c2f88eb4fa9a37dd7a41982519f', 'admin', '2018-09-21 16:38:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9091ee482ffa455f9ba70d3070520274', 'admin', '2018-10-09 09:42:47', '59.110.228.223', '');
INSERT INTO `log` VALUES ('90b426878b454dc1a010ff693ce337ba', 'admin', '2018-10-09 16:33:17', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9165586403af44b4927062d1802a6055', 'admin', '2018-10-10 14:00:20', '127.0.0.1', '');
INSERT INTO `log` VALUES ('91e7b990630642a1a9a39bcaeaf1a6ff', 'ceshi', '2018-10-24 13:44:37', '59.110.228.223', '');
INSERT INTO `log` VALUES ('925969d7eeaf4a4ca10aa41a5ba6b72e', 'ceshi', '2018-10-29 22:46:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('92cd9ab76d2546c9955592b2d53ce360', 'admin', '2018-10-12 10:39:19', '127.0.0.1', '');
INSERT INTO `log` VALUES ('92e9829d46e4405184664e1b5b701da3', 'ceshi', '2018-10-30 10:19:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('93466373cbfd4e20a27a545cd2e8ed07', 'ceshi', '2018-10-23 16:58:44', '127.0.0.1', '');
INSERT INTO `log` VALUES ('934d01425aa34884bf0cf047487bb954', 'admin', '2018-10-11 13:54:44', '127.0.0.1', '');
INSERT INTO `log` VALUES ('93cc3b4704524f36ae32cecdefe1f7e8', 'ceshi', '2018-11-23 10:01:57', '127.0.0.1', '');
INSERT INTO `log` VALUES ('95c43021fc784531b3a5840a82b0929d', 'admin', '2018-09-26 17:33:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9641ebefa39e4a08b036e86b5819d0e7', 'admin', '2018-10-09 10:16:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9673ed80b9434f3c869d010b5dd87339', 'admin', '2018-09-21 17:27:17', '127.0.0.1', '');
INSERT INTO `log` VALUES ('96efc79d07e7465683b23ed90b91e7a4', 'admin', '2018-10-10 16:39:21', '127.0.0.1', '');
INSERT INTO `log` VALUES ('977986c51ddf4d53a956fad53fb27d26', 'ceshi', '2018-10-11 10:35:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('97f5f812dfab47a08920766002aec446', 'admin', '2018-09-27 15:57:34', '127.0.0.1', '');
INSERT INTO `log` VALUES ('990d2beb29f84a65b2a741eb23f3906f', 'admin', '2018-09-25 18:05:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('997e6ba8d3b445ac8061310b1a54ac37', 'ceshi', '2018-10-22 09:28:01', '127.0.0.1', '');
INSERT INTO `log` VALUES ('99d23b9022464128941909110c82318c', 'admin', '2018-10-18 13:43:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9a023697bae84373a12c0a5c4b0234c7', 'admin', '2018-10-18 11:30:00', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9a3864a4506c4356ba73a1d97e514005', 'admin', '2018-09-26 16:48:08', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9a79c5cb137341f1817eae213a3202f4', 'ceshi', '2018-10-25 15:02:19', '59.110.228.223', '');
INSERT INTO `log` VALUES ('9a8a66fc65344b69a4f9cf27b4d9fa70', 'admin', '2018-10-02 16:37:34', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9b00ae726f3b4c168c76b07c003f3c72', 'admin', '2018-09-18 17:40:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9b23125df83c41d6984543bf1990ea41', 'admin', '2018-09-13 11:20:03', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9b65c1ce936f4666926dc48c61a82be7', 'admin', '2018-09-20 10:49:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9bfcbd5c1b9c4654a5680a2e66db93a2', 'admin', '2018-09-13 13:43:55', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9d191bb2d6724760894734ff9d644a40', 'ceshi', '2018-10-23 11:10:52', '59.110.228.223', '');
INSERT INTO `log` VALUES ('9dd694b19b3a46a1aad97503836c48fc', 'admin', '2018-10-12 15:13:55', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9e473f3d813246c2bd8b820d85bb20e7', 'ceshi', '2018-11-08 15:53:29', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9e8d91000b854e36b132e09398b7d116', 'admin', '2018-09-26 16:59:41', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9e9ebd94b50642a9aae7a21d935e7113', 'admin', '2018-10-09 11:19:41', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9eebfb4589124fbc998b4127055a57c1', 'admin', '2018-09-18 15:40:44', '127.0.0.1', '');
INSERT INTO `log` VALUES ('9fd7093ceab94b3e9414eaca4ca27be4', 'admin', '2018-10-08 17:03:53', '59.110.228.223', '');
INSERT INTO `log` VALUES ('a0c5b0028d4548c290db9275ec0eb963', 'ceshi', '2018-10-24 13:39:50', '59.110.228.223', '');
INSERT INTO `log` VALUES ('a0df177e1c30467daaeb9f9ff949bc4f', 'ceshi', '2018-09-14 09:45:13', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a0e2fcf764604ad6ab5545520af68072', 'admin', '2018-09-14 14:35:39', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a110e711c93d41898b2500e326c3aa9a', 'admin', '2018-10-08 13:34:36', '59.110.228.223', '');
INSERT INTO `log` VALUES ('a1a1cb933eb74998ae024183090a1eaa', 'admin', '2018-09-13 15:47:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a2a2e13f9674468e9abd64383454c60b', 'admin', '2018-10-10 14:55:19', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a2da04cd51374a6185831259d5d8a9af', 'ceshi', '2018-11-02 09:29:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a33e4b6346414beaa8ec66191b0dfeb9', 'admin', '2018-10-12 10:20:09', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a3690185087540778ce1b51116837d61', 'admin', '2018-10-11 16:14:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a3afd9ed017a49aa860c0e759a5fc3cb', 'ceshi', '2018-11-15 11:34:21', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a42eb13ebf86416b87864dc50edbad14', 'admin', '2018-10-11 15:52:00', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a479c88babfa4f05bf93f773dcaf8ff2', 'ceshi', '2018-10-26 16:48:48', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a541fb11c15d4362913a83c1c6b62ef2', 'admin', '2018-10-11 10:38:51', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a54c18fbe0654bf6aa10f489905be068', 'admin', '2018-09-17 16:36:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a60cea03a8db40349eac7c1a0cd0ea43', 'admin', '2018-09-13 10:03:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a65cf6c55d3f4116bde402dd4cc1fae2', 'admin', '2018-09-18 16:12:57', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a67e417fc0e142179a4455e785d447c6', 'admin', '2018-10-10 14:07:04', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a70a2fd9c11d4a8ea451ea716ccebe51', 'admin', '2018-10-10 08:58:55', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a88150686d5b465db8a66127e56b1e30', 'admin', '2018-09-30 14:37:16', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a8e0b86b6558443e9f1e36a104fad15a', 'ceshi', '2018-10-31 13:55:08', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a928e0bbdb4948949318930dbc09cbcd', 'admin', '2018-09-25 10:31:57', '127.0.0.1', '');
INSERT INTO `log` VALUES ('a998fcbcd4fb4e988bf20ebf0ee3df09', 'admin', '2018-10-15 09:02:08', '127.0.0.1', '');
INSERT INTO `log` VALUES ('aa3a828ad7664e6db8b5040c78e873f5', 'admin', '2018-10-11 10:21:30', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ab07f21e6ffa403ba27071114f26b5f2', 'ceshi', '2018-10-26 10:28:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ac0087786e9f4d959c48a316a57febfa', 'admin', '2018-11-06 09:50:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ad5d70beb7914ae78cdd5ff2d0154397', 'admin', '2018-09-26 10:01:24', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ae1563a2904249adbe44306798a2dfd2', 'admin', '2018-10-19 15:02:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ae6a5501dec84d918e32a0527b007bc1', 'admin', '2018-09-13 14:42:37', '127.0.0.1', '');
INSERT INTO `log` VALUES ('af1e3cd03b4649be9cfa4edc63c3207f', 'admin', '2018-10-11 09:17:03', '127.0.0.1', '');
INSERT INTO `log` VALUES ('af2a24528535420eaa321a7498789971', 'admin', '2018-10-09 16:50:09', '127.0.0.1', '');
INSERT INTO `log` VALUES ('af5f11bd9cec48f5a5f2b84ed8406718', 'admin', '2018-10-22 09:35:30', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b108b51bf5004a70bbdd1aa83d63b64a', 'ceshi', '2018-11-05 09:24:39', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b12c51c90fcc4dc584de031cbb0da268', 'admin', '2018-10-19 09:39:50', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b181d2dd91cb4a8d89626c961727720a', 'admin', '2018-09-28 08:51:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b182161ce7a0402f8c10be90bccfb7c9', 'admin', '2018-09-29 15:38:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b19273d7b08849998c99dd8afea3f294', 'ceshi', '2018-10-12 11:24:04', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b2c04cb156514e0598e3f1b757af0f4b', 'admin', '2018-10-16 16:44:13', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b315be2aac314cab915f079a9209edd4', 'ceshi', '2018-10-11 14:37:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b321e245cc0c4838834d2c30aae0cda6', 'ceshi', '2018-11-23 15:15:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b350f0cc6b9c4639bb318b3a7dc3fd94', 'ceshi', '2018-11-02 10:25:45', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b370803f3cda46ca8adb9f24719a2763', 'ceshi', '2018-11-15 14:58:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b394d68d88834898a3d5ad273c636d0e', 'admin', '2018-09-21 16:43:01', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b3a691a13ccc4b4a96a93122c5591be5', 'ceshi', '2018-11-06 09:35:38', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b53a8cf1185d47bc858879bf8de88218', 'admin', '2018-09-13 17:19:20', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b54230be550a40a7bb192a250d5c812c', 'admin', '2018-10-12 11:22:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b59ca3bfb2264542a3824bd58a2fe9d1', 'admin', '2018-10-04 21:13:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b6af58921c534bf9be60a6eabed19916', 'admin', '2018-09-21 16:51:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b7a51171507e4693827540415ae5e6ae', 'admin', '2018-10-08 10:56:57', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b8bca8f6be4f4640b1f6bb69cca8e872', 'admin', '2018-10-10 16:53:09', '127.0.0.1', '');
INSERT INTO `log` VALUES ('b9c53a6cff9a42d4b0677d18d921c846', 'admin', '2018-10-11 09:12:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ba21d55d74944857a17f9cb845b32e2e', 'admin', '2018-09-26 16:21:31', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ba4d1e065b32444babbf24830d67c520', 'admin', '2018-10-08 16:54:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ba8a5747eebc4f81883356a1e5e9a4c8', 'admin', '2018-10-19 11:27:48', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ba95d2fb83fa4e1687705df14df03e15', 'admin', '2018-09-26 17:34:18', '127.0.0.1', '');
INSERT INTO `log` VALUES ('badc68c2d7604e77966752192f517f3d', 'admin', '2018-10-09 17:16:21', '127.0.0.1', '');
INSERT INTO `log` VALUES ('bb6237e3429d4a1185179e36939972e1', 'admin', '2018-09-25 17:06:02', '127.0.0.1', '');
INSERT INTO `log` VALUES ('bbed543baf634d41991f7c0973302870', 'admin', '2018-10-18 18:02:13', '127.0.0.1', '');
INSERT INTO `log` VALUES ('bcbbdca980b8423c9612a09b79dcb225', 'ceshi', '2018-11-12 16:15:23', '127.0.0.1', '');
INSERT INTO `log` VALUES ('bebc3f8a4ded486ab844926caf338ae8', 'admin', '2018-10-04 15:21:24', '127.0.0.1', '');
INSERT INTO `log` VALUES ('bfad35ce65714deb8f2b4d1f31fd3056', 'ceshi', '2018-10-23 14:53:47', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c00b4a66a53a4554b22965e58ea43dc3', 'admin', '2018-10-09 09:23:55', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c0a7e91a46f04ccb90657d3d70561a73', 'admin', '2018-09-26 15:42:21', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c0e7b9fab3844b4bb3f9e1b6d2bc0a81', 'admin', '2018-10-09 10:28:08', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c15642b5385249349e2a833363a65ea3', 'ceshi', '2018-10-28 13:42:30', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c1eb1b5adc804f4cb126a75f93d894dc', 'ceshi', '2018-11-16 09:00:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c1f1fd63808a4b5fa8b6ac3c60bbe487', 'ceshi', '2018-10-22 09:37:00', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c2237525112e4356ba356e3b18b353aa', 'admin', '2018-10-11 09:15:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c228ec2f187a495391de2e4567bfc387', 'admin', '2018-09-18 17:51:34', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c24d8e1659eb4e25888e0087d68df7d5', 'ceshi', '2018-09-14 10:05:30', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c32c528e35fa4014ac8b21b4d29f2c50', 'admin', '2018-10-11 10:18:23', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c39f6dde096144acb9bc3e7758a0f209', 'ceshi', '2018-11-01 13:44:37', '59.110.228.223', '');
INSERT INTO `log` VALUES ('c47a36334da4418cb7694d98c37a4ec1', 'ceshi', '2018-10-23 08:53:09', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c58f875488e84fd7b755b84c776c2ba1', 'ceshi', '2018-11-23 11:02:06', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c5e800f1b8454ab39f3d5066ce225e44', 'ceshi', '2018-11-06 16:14:07', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c5f1eb189f9d49fd8b17cb427cafcd39', 'admin', '2018-09-18 16:34:52', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c6df0c0b46ca4de68b42c0dff089d867', 'admin', '2018-09-25 14:02:29', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c784be94685c42fba40c64609aa3085f', 'ceshi', '2018-10-29 06:00:58', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c84080ba09644ebd856743759d526fe0', 'wph', '2018-09-13 16:44:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c91576b5728e4027a17d959ee421201b', 'ceshi', '2018-11-16 15:16:45', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c98f990b39534e4abf227ba41cc64e80', 'admin', '2018-09-14 13:41:58', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c9bc063150dc44a99f57abfecdf0413f', 'admin', '2018-09-16 15:31:33', '127.0.0.1', '');
INSERT INTO `log` VALUES ('c9c653d7459f4a38bddad938187f5ab5', 'ceshi', '2018-10-26 18:13:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('cab25c282bdf46389a813866149adce6', 'ceshi', '2018-10-29 15:16:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('cc2eeea5c20f468b973a70607d25984d', 'admin', '2018-10-09 11:00:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('cc7f71c1a35a406d84b29288830e362f', 'ceshi', '2018-09-17 16:49:28', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ccca446cf2ae4a74999e6c8daa4828e4', 'admin', '2018-10-22 09:33:35', '127.0.0.1', '');
INSERT INTO `log` VALUES ('cdadb3c5fd9d4af5b33164e783b2d200', 'admin', '2018-10-11 14:45:03', '127.0.0.1', '');
INSERT INTO `log` VALUES ('cec040aa48e84825a0c426592f2418df', 'admin', '2018-09-18 17:56:33', '127.0.0.1', '');
INSERT INTO `log` VALUES ('cec1df7dc1364ddd90125f4df4ea3c4b', 'admin', '2018-10-15 09:03:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('cf2ffea2597a4242a92ccd57f9d0defe', 'ceshi', '2018-10-23 14:51:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('cf6fb0f826b14d6a92d12d3e50a055e4', 'admin', '2018-10-19 09:47:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('cfc60eafa54846ee897b76d7a8b1e477', 'admin', '2018-10-11 10:59:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('cff316265a6c42558a04851bd2dd1a71', 'wph', '2018-09-13 14:59:28', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d00e59d0c4b34577a5adc66761542b3d', 'admin', '2018-10-10 17:08:35', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d0946bd8533042fe8d87bdbaacf937a0', 'ceshi', '2018-10-25 09:32:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d0dd3c5884aa47a4952b916110ddf556', 'wph', '2018-09-13 16:42:02', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d17e01d420a84887adbc040c2c5b10aa', 'admin', '2018-09-18 17:23:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d20c2e9c32ca48dbb050e6006ef5f517', 'admin', '2018-09-29 16:19:45', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d2e4e8ac757941aaa76f41da65a14ec6', 'admin', '2018-10-11 14:32:59', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d453c94e239742e8aa8683fb473bd29e', 'ceshi', '2018-11-15 15:47:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d4a0536e73ce4903a18403b3237fdd66', 'admin', '2018-10-19 09:51:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d4e712bfbad84eb28d35dbbfc2f0af64', 'admin', '2018-10-11 10:25:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d4fed47d91c4430385b095369d502c62', 'admin', '2018-09-28 14:39:52', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d52fa583fd234ff5ba2e274286273b61', 'ceshi', '2018-11-09 08:52:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d585529c60884c77bfae8642c5b34578', 'admin', '2018-10-09 10:17:01', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d7167c39e95a463bb69761d41a27b56a', 'admin', '2018-10-11 10:40:25', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d71a00f834b948efa3ab6b84590db22b', 'admin', '2018-10-09 08:37:49', '59.110.228.223', '');
INSERT INTO `log` VALUES ('d71dba92805a482a91515253466ea50f', 'admin', '2018-10-23 14:52:29', '127.0.0.1', '');
INSERT INTO `log` VALUES ('d81c83e69a584dba84740a90aa6cf5bd', 'admin', '2018-10-02 09:47:37', '59.110.228.223', '');
INSERT INTO `log` VALUES ('d9ff5d392c7b453e8d138f2b3740aad9', 'admin', '2018-09-19 14:14:26', '127.0.0.1', '');
INSERT INTO `log` VALUES ('db8602b3df14440e97cea7bf72b032bb', 'admin', '2018-10-09 15:00:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('db997fef844941a188c51db669d6465f', 'admin', '2018-09-25 16:10:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('dbea5d49ac1043cc92d70f607f5350f9', 'admin', '2018-09-25 10:31:57', '127.0.0.1', '');
INSERT INTO `log` VALUES ('dc46e72551624a9eb6ea6c9960efdf5b', 'admin', '2018-10-19 11:31:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('dcd380a84da04706b3ae8d6363c77637', 'admin', '2018-10-02 22:08:44', '127.0.0.1', '');
INSERT INTO `log` VALUES ('dd05fd186b4c465eb0ffd7f80a9e1072', 'admin', '2018-10-10 09:14:04', '127.0.0.1', '');
INSERT INTO `log` VALUES ('dd6a70beaadc426e9c29c249e552c5e5', 'admin', '2018-09-18 16:34:11', '127.0.0.1', '');
INSERT INTO `log` VALUES ('de0a9c143d2d49a28a5c2eb6a7899e85', 'admin', '2018-10-21 17:18:57', '127.0.0.1', '');
INSERT INTO `log` VALUES ('dee80eb58ac94850abb8de1db779a68d', 'ceshi', '2018-11-01 13:57:32', '127.0.0.1', '');
INSERT INTO `log` VALUES ('df1ea51ee61d4842bee61f568d97d4ce', 'ceshi', '2018-10-31 11:23:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('dfa90698e9ef45068462b0b3d52692b5', 'ceshi', '2018-10-27 14:17:54', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e0cd5548b7f84dd4833151c0fc5c9553', 'admin', '2018-10-11 15:30:09', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e0f01c3346704446a25bae9bbc0432d3', 'admin', '2018-09-13 14:58:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e1002872939b4edfbd2b90dcc7df80c9', 'admin', '2018-09-18 14:25:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e14f11bf7cd5447980373fdec5f8503d', 'admin', '2018-10-12 16:01:19', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e1ed4f7276394766ad1e0ca573340e16', 'admin', '2018-09-13 15:34:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e205ab1dbf894ac2815c5ea17c2eb16c', 'admin', '2018-10-17 11:08:02', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e2b66983efe54a629858803a578f8d90', 'ceshi', '2018-10-23 14:14:41', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e44b68ab54704cdb9c5f7a459b18f7d8', 'ceshi', '2018-11-15 15:41:51', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e48666b310ce48a58c7004332c934dba', 'admin', '2018-10-19 11:41:43', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e632e09173d14af88f28714c62886cc5', 'admin', '2018-10-03 15:46:06', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e66fc1e121514e008f1a60d596db5327', 'admin', '2018-09-13 16:35:13', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e6a84c93d34a44d6a9ecaac8a0c48686', 'admin', '2018-09-25 16:51:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e7894194b48a46c79aaf1362ad89077b', 'admin', '2018-10-12 11:21:35', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e8ba71335f2343919e1632eabfcaf762', 'ceshi', '2018-10-11 10:39:44', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e8d9acf30dd340868f05807b7587ab20', 'admin', '2018-10-10 16:25:33', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e8e943b9c06d4bcaa2cf5db224663bed', 'admin', '2018-09-19 17:23:28', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e9bab544311f4e3fb56751163e973acc', 'ceshi', '2018-09-26 17:34:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('e9f387d6d9194b5b817c9ab0a653ac0b', 'admin', '2018-09-26 10:08:16', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ea63744100644388bddebf5d61fced4e', 'admin', '2018-09-26 16:13:18', '127.0.0.1', '');
INSERT INTO `log` VALUES ('eb352f9f08ca49d5b495b57512a2a3c7', 'ceshi', '2018-10-21 17:21:20', '127.0.0.1', '');
INSERT INTO `log` VALUES ('eb36e3192cd44adbb262495822d498f6', 'admin', '2018-09-27 09:13:03', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ebc141909f624e2d8765bbeb7bae9f0f', 'ceshi', '2018-10-23 14:19:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('edc24d87be714e318034cb8f1e22341d', 'ceshi', '2018-10-29 17:53:06', '59.110.228.223', '');
INSERT INTO `log` VALUES ('eeb484fc29ce4d4390a272e31101a894', 'admin', '2018-09-19 14:17:31', '127.0.0.1', '');
INSERT INTO `log` VALUES ('eec1cc9bb5df48bcaac8211e9076a654', 'ceshi', '2018-10-22 09:34:50', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ef477582440c455b9bf6675f41d81d93', 'admin', '2018-10-11 17:50:49', '127.0.0.1', '');
INSERT INTO `log` VALUES ('efc266a603e0472c9a0ae591dc528106', 'admin', '2018-10-10 15:37:12', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f066f9f6cecf44189c7243bf439b1f2a', 'ceshi', '2018-10-24 14:48:45', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f100a6e6909044e09cee0c6af22b096d', 'admin', '2018-09-25 08:51:17', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f11221504fe142208305e6ad2bebb847', 'admin', '2018-10-12 10:37:57', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f1178c478b7f47d7beed793d4fa5af8a', 'admin', '2018-09-27 15:10:45', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f225a347825b4291b977d829730a3977', 'admin', '2018-10-19 08:58:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f36bf5985fa8456fb7b4a97b2ad6f6b1', 'admin', '2018-10-21 13:08:14', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f3cb6555cdae45e39612b3b12408a191', 'admin', '2018-10-09 09:21:25', '59.110.228.223', '');
INSERT INTO `log` VALUES ('f4665b30d836423ebe4de005dfe745cf', 'admin', '2018-09-18 17:04:30', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f50ab2df3ea74ef394993fb42bfd4b90', 'ceshi', '2018-11-06 09:51:36', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f579b1bb8d26424cbd1663af40ba2f05', 'ceshi', '2018-11-16 15:17:11', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f5a452a7a1ae4ccbb2bff2032103fd09', 'ceshi', '2018-09-21 17:19:02', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f67d8655ae864966aa0cd40e70712a62', 'admin', '2018-10-15 15:01:46', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f692b05e82124fc4af32feb6f0568402', 'admin', '2018-09-13 15:25:16', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f7f8cfefc5514556b966bdad755052d3', 'admin', '2018-10-21 17:17:53', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f7ff4136713b4de2bc3daf5a7a698144', 'admin', '2018-09-30 16:37:21', '171.15.16.27', '');
INSERT INTO `log` VALUES ('f87ae0024a494f279ba160528984b2a9', 'admin', '2018-10-09 17:06:41', '127.0.0.1', '');
INSERT INTO `log` VALUES ('f965d58f3df1481c82676f65daedc83d', 'admin', '2018-10-08 10:56:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fa29305504f74318afc3f3d1eb7c1708', 'ceshi', '2018-11-15 16:36:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fc419e6abdde42c6a1cdc435496925c2', 'ceshi', '2018-11-04 14:57:10', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fc4942e73e064ffcad72e52744880bb0', 'ceshi', '2018-11-15 16:50:40', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fc4981aa05c84965a762d4f13ab230d0', 'ceshi', '2018-11-15 14:41:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fc590c952343498f823d95c0471a165a', 'admin', '2018-10-19 15:13:08', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fc6f4b5e4e68480e927a8eeb896aee11', 'admin', '2018-10-17 11:18:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fd42dc6c56474ec49bb9d08b2a8bc837', 'admin', '2018-10-19 13:39:34', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fd7a931913894b9a8ca73d43f4cfbbbc', 'ceshi', '2018-11-12 16:13:05', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fd8c0b3a628546fb8f8e04bd23123082', 'ceshi', '2018-10-11 10:33:27', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fe086f5802c246328b00f4888e4a4902', 'admin', '2018-09-28 14:31:43', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fe77149c53454b0496a0fd90787fe6df', 'ceshi', '2018-11-06 15:58:15', '127.0.0.1', '');
INSERT INTO `log` VALUES ('fea6973863b144f6b532a29384ccbbd2', 'ceshi', '2018-11-16 13:56:45', '127.0.0.1', '');
INSERT INTO `log` VALUES ('feb5224fbec34684a41e1d114602fe02', 'admin', '2018-10-15 09:47:48', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ff54f7e235324f40957e6c83514bb79c', 'admin', '2018-10-19 14:14:18', '127.0.0.1', '');
INSERT INTO `log` VALUES ('ffaef09dde14474dac3bb61972231a34', 'admin', '2018-09-13 14:59:14', '127.0.0.1', '');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `uid` varchar(32) NOT NULL,
  `account` varchar(32) NOT NULL,
  `password` varchar(100) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `salt` varchar(32) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`uid`,`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('287eec6bd5f642ddaa24322fb69abe8f', 'admin', '$2a$10$U6B9xrfyJG0JEAuklMZ4guKPh6GqxRIbZmhzezS8Eqjg3mseIqJdW', '1', '2018-09-13 10:07:29', '', '2018-09-13 10:07:29');
INSERT INTO `member` VALUES ('2e24db984c734192a0ee04349bae2744', 'wangpenghao', '$2a$10$lm0D9nwC19cgi2x7DaPXn.n/Uzd1GD5YTRw1BBAGQCcKopPtaDq02', '1', '2018-09-13 14:47:21', '', '2018-09-13 14:47:21');
INSERT INTO `member` VALUES ('3eb011e6638b4184aef77c3b095883df', 'guest', '$2a$10$MPclaL4uacoMimw3Ia4xfefaRKUTrT.j7FyF4SnpuDZf3ugicOv9K', '1', '2017-03-14 09:44:35', '', '2017-03-14 09:44:35');
INSERT INTO `member` VALUES ('a550d35b160640d0ab67a3409ac214cd', 'wph', '7debd15deaa2d148db3d6f1271363f2c', '1', '2018-09-19 11:29:41', 'b4859f9bca8636da38c07892dd193b8f', '2018-09-19 11:29:41');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `menu_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `menu_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '资源类型，菜单或都按钮(menu,button)',
  `menu_url` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `menu_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `child_num` int(10) NOT NULL DEFAULT '0',
  `listorder` int(10) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('0072d5a15452401b819d89991da49068', '会话信息', 'auth', '/nework/flowsession/index', 'internet:sessionInfo', 'b4b2eea9800e4652939f227b390651f6', null, '0', '0', '2018-09-25 16:18:29', '2018-10-16 16:44:43');
INSERT INTO `menu` VALUES ('00dc5c51e4824f49a30013385f680b0c', '日志管理', 'auth', '/console/log/index', 'log:index', 'e5f52fe2115e46229c60803e478d2e9a', null, '0', '1', '2017-01-06 14:11:23', '2017-05-08 14:55:21');
INSERT INTO `menu` VALUES ('138540c663c04e4682b09f4d1de2d8e6', '外部IP配置', 'auth', '/admin/function/wip', 'functionView:wip', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-09-25 16:27:47', '2018-09-25 16:27:47');
INSERT INTO `menu` VALUES ('1cc3d9ad04e4424db1bb086d1678925e', '菜单删除', 'auth', '/console/menu/delete', 'menu:delete', '736bdf0b9aec4c59928a530e34bd9aad', null, '0', '0', '2017-05-10 16:45:30', '2017-05-10 16:45:30');
INSERT INTO `menu` VALUES ('2191c9efc2fa431bb427b81ad938e8aa', '角色保存', 'auth', '/console/role/save', 'role:save', '6cda978dc9404ba2bf5854b74735b0bc', null, '0', '0', '2017-05-10 16:41:21', '2017-05-10 16:41:21');
INSERT INTO `menu` VALUES ('24934cd337214b0ba4282f8b73fcc82c', '蜜罐日志', 'menu', '/functionView/honeyLog/honeyLogIndex', 'functionView:honeyLog', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-11-06 09:38:52', '2018-11-06 09:38:52');
INSERT INTO `menu` VALUES ('362923d31e064f84adb8c23ba91e54d8', '用户编辑', 'auth', '/console/admin/from', 'admin:edit', 'e0dde3b9227c471eb3bd2ba0a7fab131', null, '0', '0', '2017-05-08 14:57:39', '2017-05-10 16:40:47');
INSERT INTO `menu` VALUES ('38c07d16f40c4118847a5daef365a695', '虚拟IP配置', 'auth', '/admin/function/vip', 'functionView:vip', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-09-25 16:27:15', '2018-09-27 09:03:39');
INSERT INTO `menu` VALUES ('3ac96215e82f40b5bfe442e6828641df', '系统管理', 'menu', '/console/system/admin', 'system:admin', '0', null, '3', '1', '2016-12-07 16:00:00', '2017-05-10 16:46:27');
INSERT INTO `menu` VALUES ('44a06ebccff44313a56544541b381e73', '虚拟IP段', 'menu', '/functionView/vip/vipIndex', 'functionView:vip', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-10-19 16:22:20', '2018-10-19 16:22:20');
INSERT INTO `menu` VALUES ('53016a03639e48ee831e1a4ec140410b', '蜜罐攻击', 'menu', '/functionView/honeypotAttach/honeypotAttachIndex', 'functionView:honeyAttack', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-11-08 15:51:20', '2018-11-08 15:52:02');
INSERT INTO `menu` VALUES ('5453facce22e4b38a112ffdb75fc6038', '终端信息', 'auth', '/admin/function/hosts', 'internet:hosts', 'b4b2eea9800e4652939f227b390651f6', null, '0', '0', '2018-09-25 16:20:20', '2018-09-25 16:20:20');
INSERT INTO `menu` VALUES ('6580896645d046a0acf3c1194d7bbf8e', '用户删除', 'menu', '/console/admin/delete', 'admin:delete', 'e0dde3b9227c471eb3bd2ba0a7fab131', null, '0', '0', '2017-05-10 16:39:44', '2017-05-10 16:39:44');
INSERT INTO `menu` VALUES ('6cda978dc9404ba2bf5854b74735b0bc', '角色管理', 'auth', '/console/role/index', 'role:index', '3ac96215e82f40b5bfe442e6828641df', null, '4', '2', '2016-12-07 16:47:40', '2016-12-07 16:47:40');
INSERT INTO `menu` VALUES ('71b8a5fb73964385a321a11485577df7', '动态配置', 'menu', '/functionView/mtd/mtdIndex', 'functionView:Mtd', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-10-18 14:16:30', '2018-11-15 17:05:40');
INSERT INTO `menu` VALUES ('736bdf0b9aec4c59928a530e34bd9aad', '菜单管理', 'auth', '/console/menu/index', 'menu:index', '3ac96215e82f40b5bfe442e6828641df', null, '3', '3', '2016-12-07 16:50:17', '2016-12-07 16:50:17');
INSERT INTO `menu` VALUES ('77d46f2b5a974b3281a579169fb60929', '交换机信息', 'menu', '/functionView/switches/switchesIndex', 'functionView:switches', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-10-23 14:16:01', '2018-10-23 14:54:07');
INSERT INTO `menu` VALUES ('85dad2bd9023451fab632dcfc4357d3b', '用户保存', 'auth', '/console/admin/save', 'admin:save', 'e0dde3b9227c471eb3bd2ba0a7fab131', null, '0', '0', '2017-05-10 16:38:07', '2017-05-10 16:41:00');
INSERT INTO `menu` VALUES ('86edea90de264305a137fc382d7b64cd', '真实配置', 'auth', '/functionView/rip/index', 'functionView:rip', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-10-18 10:15:38', '2018-11-15 17:05:21');
INSERT INTO `menu` VALUES ('8a653e3fb15642d9be6aad13b02009fb', '角色授权', 'auth', '/console/role/grant', 'role:grant', '6cda978dc9404ba2bf5854b74735b0bc', null, '0', '0', '2017-05-10 16:42:37', '2017-05-10 16:42:37');
INSERT INTO `menu` VALUES ('8e0d62f10eaa448fb6f1eaec3a072166', '日志管理', 'auth', '/admin/function/log', 'functionView:log', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-09-25 16:28:24', '2018-09-25 16:28:24');
INSERT INTO `menu` VALUES ('90b6252b7a034bc7b9030ff57efae405', '黑名单', 'menu', '/functionView/blackList/blackListIndex', 'functionView:blacklist', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-10-30 14:36:43', '2018-10-30 14:39:20');
INSERT INTO `menu` VALUES ('94175a1223f949eea3ddd49a27540afa', '功能初始化', 'auth', '/admin/function/init', 'functionView:init', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-09-25 16:25:43', '2018-09-25 16:25:43');
INSERT INTO `menu` VALUES ('984909260a06410d9be37c300e3df09d', '会员管理', 'menu', '/console/member/default', 'member:default', '0', null, '2', '0', '2017-05-10 16:50:16', '2018-06-13 14:36:46');
INSERT INTO `menu` VALUES ('9f41af1454d046b596023a2822c5078c', '角色编辑', 'auth', '/console/role/from', 'role:edit', '6cda978dc9404ba2bf5854b74735b0bc', null, '0', '0', '2017-05-08 14:59:25', '2017-05-08 14:59:25');
INSERT INTO `menu` VALUES ('aab7966c97db4643a36cb5afa24be38b', '角色删除', 'menu', '/console/role/delete', 'role:delete', '6cda978dc9404ba2bf5854b74735b0bc', null, '0', '0', '2017-05-10 16:43:37', '2017-05-10 16:43:37');
INSERT INTO `menu` VALUES ('ac38e0cf71444caf80450fdfbda4d9dc', '真实IP配置', 'auth', '/admin/function/rip', 'functionView:rip', 'bf1687f9a96e43f794acb55d38d5ec5f', null, '0', '0', '2018-09-25 16:26:29', '2018-09-25 16:26:29');
INSERT INTO `menu` VALUES ('b4b2eea9800e4652939f227b390651f6', '网络视图', 'menu', '/admin/function/networkView', 'system:internet', '0', null, '3', '0', '2018-09-25 16:14:03', '2018-09-25 16:17:41');
INSERT INTO `menu` VALUES ('bf1687f9a96e43f794acb55d38d5ec5f', '系统配置', 'menu', '/admin/function/systemView', 'system:functionView', '0', null, '12', '0', '2018-09-25 16:24:57', '2018-11-15 16:59:42');
INSERT INTO `menu` VALUES ('c5cca135ee534bfeb482fb04b9311982', '菜单编辑', 'auth', '/console/menu/from', 'menu:from', '736bdf0b9aec4c59928a530e34bd9aad', null, '0', '0', '2016-12-07 16:51:31', '2017-05-08 15:00:02');
INSERT INTO `menu` VALUES ('e0dde3b9227c471eb3bd2ba0a7fab131', '用户管理', 'auth', '/console/admin/index', 'admin:index', '3ac96215e82f40b5bfe442e6828641df', null, '3', '1', '2016-12-07 16:45:47', '2017-05-10 16:39:08');
INSERT INTO `menu` VALUES ('e5f52fe2115e46229c60803e478d2e9a', '扩展设置', 'menu', '/console/system/setting', 'system:setting', '0', null, '1', '3', '2016-12-07 16:36:42', '2017-05-10 16:50:00');
INSERT INTO `menu` VALUES ('e85b2fb3e6ee4d0a9711c577bc842821', '会员管理', 'auth', '/console/member/index', 'member:index', '984909260a06410d9be37c300e3df09d', null, '0', '0', '2017-05-10 16:51:20', '2017-05-10 16:51:20');
INSERT INTO `menu` VALUES ('f281e9e7f11c4182b465fe1f754b1ed1', '网络拓扑', 'auth', '/admin/function/topology', 'internet:topology', 'b4b2eea9800e4652939f227b390651f6', null, '0', '0', '2018-09-25 16:19:36', '2018-09-25 16:19:36');
INSERT INTO `menu` VALUES ('f4237d06c0c94906bdc04f5ed19cbaeb', '菜单保存', 'auth', '/console/menu/save', 'menu:save', '736bdf0b9aec4c59928a530e34bd9aad', null, '0', '0', '2017-05-10 16:44:51', '2017-05-10 16:44:51');

-- ----------------------------
-- Table structure for mtd_config
-- ----------------------------
DROP TABLE IF EXISTS `mtd_config`;
CREATE TABLE `mtd_config` (
  `mtd_id` varchar(32) NOT NULL,
  `honeypot_path_idle` varchar(32) DEFAULT NULL COMMENT '导向蜜罐的流量的流表最大空闲时间',
  `k_path` varchar(16) DEFAULT NULL COMMENT '可跳变的最大路径数',
  `path_ttl` varchar(16) DEFAULT NULL COMMENT '路径跳变周期',
  `is_mtd_mode` int(1) DEFAULT '1' COMMENT 'mtd模式开启与否,1-开启，0-关闭',
  `session_idle` varchar(16) DEFAULT NULL COMMENT '流表最大空闲时间',
  `external_address_for_d_port` varchar(32) DEFAULT NULL COMMENT '内网提供的开放服务的地址',
  `external_address_for_dns` varchar(32) DEFAULT NULL COMMENT 'dns转发的采用的外网地址',
  `external_address_for_s_nat` varchar(32) DEFAULT NULL COMMENT '内网访问外网采用的IP地址',
  `is_path_mutation` int(1) DEFAULT '1' COMMENT '路径跳变开启与否,1-开启，0-关闭',
  `dns_forward_address` varchar(32) DEFAULT NULL COMMENT 'dns服务器地址',
  `dns_address` varchar(32) DEFAULT NULL COMMENT '内部dns服务器地址',
  `external_switch_port` varchar(32) DEFAULT NULL COMMENT '出外网的端口',
  `use_honeypot` int(1) DEFAULT '1' COMMENT '使用蜜罐与否,1-开启，0-关闭',
  `external_gateway` varchar(32) DEFAULT NULL COMMENT '出外网的网关',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`mtd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mtd_config
-- ----------------------------
INSERT INTO `mtd_config` VALUES ('05ee7c62f4d14eb984bfda0efbc84b44', '7', '8', '9', '1', '1', null, null, '2', '1', '3', '4', '5', '1', '6', null);
INSERT INTO `mtd_config` VALUES ('0f67484ad72b11e8b22300163e03e0c4', '', '1', '1', '0', '', null, null, '', '1', '', '', '', '0', '', '2018-10-24 09:20:57');
INSERT INTO `mtd_config` VALUES ('123456789', '600', '8', '30', '1', '1800', null, null, '192.168.125.123', '1', '8.8.8.8', '1.1.1.1', 'openfow:1:5', '1', '192.168.125.254', '2018-10-18 17:14:06');
INSERT INTO `mtd_config` VALUES ('124a3d472cdb47499ddc786c2ae553bc', '', '12', '12', '0', '', null, null, '', '1', '', '', '', '0', '', '2018-10-21 15:04:56');
INSERT INTO `mtd_config` VALUES ('1b99050ee18f4670a8816d9871aace76', '7', '8', '9', '1', '1', null, null, '2', '1', '3', '4', '5', '1', '6', null);
INSERT INTO `mtd_config` VALUES ('512dde8d13de4781977b7bd83f56f780', '', '', '', '1', '', null, null, '', '1', '', '', '', '1', '', '2018-10-19 14:44:54');
INSERT INTO `mtd_config` VALUES ('953c6c8b7ee842cdb36cf02c0e8358f3', null, '10', '10', '1', '10', '192.168.1.1', '192.168.1.1', '192.168.1.1', '1', '192.168.1.1', '192.168.1.1', '192.168.1.1', null, '192.168.1.1', '2018-11-23 15:39:36');
INSERT INTO `mtd_config` VALUES ('a6b8fd3725c94843a5c636dde4e01a88', '10', '10', '10', '1', '10', null, null, '192.168.1.1', '1', '192.168.1.1', '192.168.1.1', '80', '1', '192.168.1.1', '2018-10-21 16:51:29');
INSERT INTO `mtd_config` VALUES ('b0b1adedfd9648a3805a5cd530d43263', '7', '8', '9', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `mtd_config` VALUES ('b37c485552f94ef9b701606dcd378a90', '7', '8', '9', '1', '1', null, null, '2', '1', '3', '4', '5', '1', '6', '2018-10-19 14:12:59');
INSERT INTO `mtd_config` VALUES ('cbe2994f310046c8a55df57ae4f21df3', '7', '8', '9', '1', '1', null, null, '2', '1', '3', '4', '5', '1', '6', '2018-10-19 14:16:46');
INSERT INTO `mtd_config` VALUES ('ecc28b7304d046b49a6adfa1d4d4b091', '7', '8', '9', '1', '1', null, null, '2', '1', '3', '4', '5', '1', '6', '2018-10-19 14:11:10');
INSERT INTO `mtd_config` VALUES ('f396fff742bf45eb8ef2b4f222a45733', '', '', '', '1', '', null, null, '', '1', '', '', '', '1', '', '2018-10-19 14:41:02');
INSERT INTO `mtd_config` VALUES ('f400655522d444188e6b677e4f014f35', '12', '12', '12', '1', '123', null, null, '192.168.1.1', '1', '192.168.1.1', '192.168.1.1', '12', '1', '192.168.1.1', '2018-10-21 15:03:46');
INSERT INTO `mtd_config` VALUES ('f5615a869ddb42ad8c34d7fa9179b2c9', '', '', '', '1', '', null, null, '', '1', '', '', '', '1', '', '2018-10-19 14:34:23');

-- ----------------------------
-- Table structure for mtd_dynamic_port
-- ----------------------------
DROP TABLE IF EXISTS `mtd_dynamic_port`;
CREATE TABLE `mtd_dynamic_port` (
  `dynamicport_id` varchar(32) NOT NULL COMMENT '主键id与mtd主表关联',
  `switch_port` varchar(32) DEFAULT NULL COMMENT '交换机端口',
  `mtd_id` varchar(32) DEFAULT NULL COMMENT 'mtd主表关联id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mtd_dynamic_port
-- ----------------------------
INSERT INTO `mtd_dynamic_port` VALUES ('5abba1b3b3b644179332dce3ad95eb5f', 'openflow:2:2', '953c6c8b7ee842cdb36cf02c0e8358f3', '2018-11-23 15:39:36');
INSERT INTO `mtd_dynamic_port` VALUES ('d2cf013eea6e4dbfb3040670cb269dff', 'openflow:1:2', '953c6c8b7ee842cdb36cf02c0e8358f3', '2018-11-23 15:39:36');

-- ----------------------------
-- Table structure for mtd_mapping_port
-- ----------------------------
DROP TABLE IF EXISTS `mtd_mapping_port`;
CREATE TABLE `mtd_mapping_port` (
  `mappingport_id` varchar(32) NOT NULL COMMENT '映射端口id',
  `server_port` varchar(32) DEFAULT NULL COMMENT '映射服务端口',
  `dynamic_port_id` varchar(32) DEFAULT NULL COMMENT '动态端口id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mtd_mapping_port
-- ----------------------------
INSERT INTO `mtd_mapping_port` VALUES ('0350ed02db134d7db2d84e0f1cc96254', '1', '5abba1b3b3b644179332dce3ad95eb5f', '2018-11-23 15:39:36');
INSERT INTO `mtd_mapping_port` VALUES ('4bd20143c3584927bcee4b41c81a38dc', '2', '5abba1b3b3b644179332dce3ad95eb5f', '2018-11-23 15:39:36');
INSERT INTO `mtd_mapping_port` VALUES ('66bf7f8237ce403797184e992c89e9d1', '3', '5abba1b3b3b644179332dce3ad95eb5f', '2018-11-23 15:39:36');
INSERT INTO `mtd_mapping_port` VALUES ('cfe1154f5667494a8992a6660a5386d3', '10', 'd2cf013eea6e4dbfb3040670cb269dff', '2018-11-23 15:39:37');
INSERT INTO `mtd_mapping_port` VALUES ('e5747e5b1d474b31a173a35ee2ee715c', '20', 'd2cf013eea6e4dbfb3040670cb269dff', '2018-11-23 15:39:37');
INSERT INTO `mtd_mapping_port` VALUES ('507bc27b74464a69af5272fcddf3e2ae', '30', 'd2cf013eea6e4dbfb3040670cb269dff', '2018-11-23 15:39:37');

-- ----------------------------
-- Table structure for rips
-- ----------------------------
DROP TABLE IF EXISTS `rips`;
CREATE TABLE `rips` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `net` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `domain_prefix` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gateway` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `start_ip` int(11) NOT NULL,
  `end_ip` int(11) NOT NULL,
  `global_period` int(11) NOT NULL,
  `domain_period` int(11) NOT NULL,
  `virtual_period` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rips
-- ----------------------------
INSERT INTO `rips` VALUES ('09bce06b32624a1192f5aaa58fb40d25', '123', '123', '123', '123', '456', '123', '0', '0', '2018-10-18 09:40:59');
INSERT INTO `rips` VALUES ('16efae5a90f848e6aca0a82941c1bc52', 'dd', 'dd', '2', '1', '2', '2', '2', '2', '2018-10-18 11:21:03');
INSERT INTO `rips` VALUES ('3970b17d7bf247ee9546b1b7bfe638a6', 'ttt', 'tt', '192.168.1.1', '-1062729215', '-1062728961', '20', '20', '20', '2018-10-18 14:05:01');
INSERT INTO `rips` VALUES ('4db76609ec154d76815454690d70d40b', 'test1', 'test1', '192.168.108.100', '-1062704127', '-1062704028', '2000', '2000', '2000', '2018-10-16 14:45:41');
INSERT INTO `rips` VALUES ('6ced68b863a0455ebe07f1175fd5fb1c', 'gg', 'gg', '3', '1', '2', '3', '3', '3', '2018-10-18 11:37:08');
INSERT INTO `rips` VALUES ('8067e3f260fc46079ee3ecd632f3799f', 'wph', 'wph', '123', '1', '2', '123', '123', '123', '2018-10-18 11:08:29');
INSERT INTO `rips` VALUES ('92141b74fa9d48818c7b19f11eea0590', 'network', 'sdn', '192.168.125.1', '-1062699775', '-1062699521', '10000', '10000', '10000', '2018-09-28 11:02:37');
INSERT INTO `rips` VALUES ('a65c81bc3d594429a49da0a9296de249', 'subnet1', 'dns', '192.168.108.1', '-1062704127', '-1062703873', '10', '10', '10', '2018-10-21 13:48:08');
INSERT INTO `rips` VALUES ('b4ce4a710d76434aa11b6c3d42a3c470', 'pp', 'pp', '77', '123', '456', '77', '77', '77', '2018-10-18 11:15:21');
INSERT INTO `rips` VALUES ('bb81f6c093634334bdce19f2afe9f864', 'ccc', 'ccc', '192.168.10.5', '-1062704126', '-1062703903', '20', '20', '20', '2018-10-18 14:05:48');
INSERT INTO `rips` VALUES ('bef38d68980c40e0aa0df64ee64d7b0a', 'a123123', 'a123123', '192.168.108.1', '-1062704127', '-1062703873', '123', '123', '123', '2018-10-10 16:46:05');
INSERT INTO `rips` VALUES ('ce1080d4cf2a42b4b8e439fbe61f09ff', 'a123', 'a123', '192.168.108.100', '-1062704127', '-1062704028', '123', '123', '123', '2018-10-10 16:40:48');
INSERT INTO `rips` VALUES ('d4edfe3f1561430ea4c181d645505ca9', 'wwww', 'wwww', '192.168.108.1', '-1062704127', '-1062703873', '123', '123', '123', '2018-10-10 16:54:07');
INSERT INTO `rips` VALUES ('df24e5055d594b65922ae8b63b6aae3c', 'ww', 'ww', '234', '1', '2', '2', '2', '2', '2018-10-18 11:13:38');
INSERT INTO `rips` VALUES ('f35214dafd554085af86ca888c63f972', 'wph123', 'sdn', '192.168.125.1', '-1062729206', '-1062729196', '10000', '10000', '10000', '2018-09-28 15:12:15');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `role_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role_desc` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name_unique` (`role_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('36f1dd1296674fc08484c5abf6a5806b', '系统管理员', '系统管理员', '1', '2016-12-07 08:53:57', '2018-09-27 09:02:36');
INSERT INTO `role` VALUES ('8ff15972a3f44edf939270c4ec76c528', '测试角色', '测试按钮', '1', '2018-09-13 17:20:00', '2018-09-27 09:02:54');
INSERT INTO `role` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '普通管理员', '普通管理员', '1', '2016-12-07 13:21:21', '2018-09-27 09:02:45');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `role_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `role_menu_foreign` (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '0072d5a15452401b819d89991da49068');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '00dc5c51e4824f49a30013385f680b0c');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '1cc3d9ad04e4424db1bb086d1678925e');
INSERT INTO `role_menu` VALUES ('36f1dd1296674fc08484c5abf6a5806b', '2191c9efc2fa431bb427b81ad938e8aa');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '2191c9efc2fa431bb427b81ad938e8aa');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '24934cd337214b0ba4282f8b73fcc82c');
INSERT INTO `role_menu` VALUES ('8ff15972a3f44edf939270c4ec76c528', '362923d31e064f84adb8c23ba91e54d8');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '362923d31e064f84adb8c23ba91e54d8');
INSERT INTO `role_menu` VALUES ('36f1dd1296674fc08484c5abf6a5806b', '3ac96215e82f40b5bfe442e6828641df');
INSERT INTO `role_menu` VALUES ('8ff15972a3f44edf939270c4ec76c528', '3ac96215e82f40b5bfe442e6828641df');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '3ac96215e82f40b5bfe442e6828641df');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '53016a03639e48ee831e1a4ec140410b');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '6580896645d046a0acf3c1194d7bbf8e');
INSERT INTO `role_menu` VALUES ('36f1dd1296674fc08484c5abf6a5806b', '6cda978dc9404ba2bf5854b74735b0bc');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '6cda978dc9404ba2bf5854b74735b0bc');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '71b8a5fb73964385a321a11485577df7');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '736bdf0b9aec4c59928a530e34bd9aad');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '77d46f2b5a974b3281a579169fb60929');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '85dad2bd9023451fab632dcfc4357d3b');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '86edea90de264305a137fc382d7b64cd');
INSERT INTO `role_menu` VALUES ('36f1dd1296674fc08484c5abf6a5806b', '8a653e3fb15642d9be6aad13b02009fb');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '8a653e3fb15642d9be6aad13b02009fb');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '90b6252b7a034bc7b9030ff57efae405');
INSERT INTO `role_menu` VALUES ('8ff15972a3f44edf939270c4ec76c528', '984909260a06410d9be37c300e3df09d');
INSERT INTO `role_menu` VALUES ('36f1dd1296674fc08484c5abf6a5806b', '9f41af1454d046b596023a2822c5078c');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '9f41af1454d046b596023a2822c5078c');
INSERT INTO `role_menu` VALUES ('36f1dd1296674fc08484c5abf6a5806b', 'aab7966c97db4643a36cb5afa24be38b');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', 'aab7966c97db4643a36cb5afa24be38b');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', 'b4b2eea9800e4652939f227b390651f6');
INSERT INTO `role_menu` VALUES ('8ff15972a3f44edf939270c4ec76c528', 'bf1687f9a96e43f794acb55d38d5ec5f');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', 'bf1687f9a96e43f794acb55d38d5ec5f');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', 'c5cca135ee534bfeb482fb04b9311982');
INSERT INTO `role_menu` VALUES ('8ff15972a3f44edf939270c4ec76c528', 'e0dde3b9227c471eb3bd2ba0a7fab131');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', 'e0dde3b9227c471eb3bd2ba0a7fab131');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', 'e5f52fe2115e46229c60803e478d2e9a');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', 'f281e9e7f11c4182b465fe1f754b1ed1');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', 'f4237d06c0c94906bdc04f5ed19cbaeb');

-- ----------------------------
-- Table structure for switches
-- ----------------------------
DROP TABLE IF EXISTS `switches`;
CREATE TABLE `switches` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of switches
-- ----------------------------

-- ----------------------------
-- Table structure for switches_dip_data
-- ----------------------------
DROP TABLE IF EXISTS `switches_dip_data`;
CREATE TABLE `switches_dip_data` (
  `dip_data_id` varchar(32) NOT NULL,
  `mac` varchar(32) DEFAULT NULL,
  `vdomain` varchar(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `rip` varchar(32) DEFAULT NULL,
  `vip` varchar(32) DEFAULT NULL,
  `vip_last_mutation` int(10) DEFAULT NULL,
  `vdomain_last_mutation` int(10) DEFAULT NULL,
  `vmac` varchar(32) DEFAULT NULL,
  `node_connector_id` varchar(32) DEFAULT NULL COMMENT '交换机端口id,对应表node_connector',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`dip_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of switches_dip_data
-- ----------------------------

-- ----------------------------
-- Table structure for switches_new
-- ----------------------------
DROP TABLE IF EXISTS `switches_new`;
CREATE TABLE `switches_new` (
  `switches_id` varchar(32) NOT NULL,
  `switches_name` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`switches_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of switches_new
-- ----------------------------
INSERT INTO `switches_new` VALUES ('13c9e8c4f27241c6ba1188694cbaa3e7', 'openflow:2', '2018-10-29 16:20:38');
INSERT INTO `switches_new` VALUES ('23235773247848ca97f07375c4736f0e', 'openflow:1', '2018-10-29 16:20:38');
INSERT INTO `switches_new` VALUES ('2b91932c68204d2fbff2643b83d7e542', 'openflow:2038063737066023809', '2018-10-29 16:20:39');
INSERT INTO `switches_new` VALUES ('429f0df7567c4e21847c9f7392e0c281', 'openflow:2037944993637447489', '2018-10-29 16:20:38');
INSERT INTO `switches_new` VALUES ('9732b0382f9642db89d8271c6edec584', 'openflow:11882651047521214913', '2018-10-29 16:20:36');
INSERT INTO `switches_new` VALUES ('a7f1f55fce05472cb1e5e31c403b5565', 'openflow:2038063737063325569', '2018-10-29 16:20:41');
INSERT INTO `switches_new` VALUES ('f50a18a11343447bb64bdefc40a0d69a', 'openflow:10308452565238866008', '2018-10-29 16:20:40');

-- ----------------------------
-- Table structure for switches_node_connector
-- ----------------------------
DROP TABLE IF EXISTS `switches_node_connector`;
CREATE TABLE `switches_node_connector` (
  `node_connector_id` varchar(32) NOT NULL COMMENT '交换机端口id',
  `id` varchar(64) DEFAULT NULL COMMENT '交换机id',
  `transmit_drops` int(10) DEFAULT NULL,
  `receive_frame_error` int(10) DEFAULT NULL,
  `receive_drops` int(10) DEFAULT NULL,
  `receive_crc_error` int(10) DEFAULT NULL,
  `bytes_transmitted` bigint(10) DEFAULT NULL COMMENT '该接口转发的bit数',
  `bytes_received` bigint(10) DEFAULT NULL COMMENT '该接口接收的比特数',
  `nanosecond` int(10) DEFAULT NULL,
  `second` int(10) DEFAULT NULL,
  `receive_errors` int(10) DEFAULT NULL,
  `transmit_errors` int(10) DEFAULT NULL,
  `receive_over_run_error` int(10) DEFAULT NULL,
  `collision_count` int(10) DEFAULT NULL,
  `packets_transmitted` bigint(10) DEFAULT NULL COMMENT '该端口转发的数据包数',
  `packets_received` bigint(10) DEFAULT NULL COMMENT '该端口接收的数据包数',
  `link_down` varchar(32) DEFAULT NULL,
  `live` varchar(32) DEFAULT NULL,
  `blocked` varchar(32) DEFAULT NULL,
  `flow_name` varchar(32) DEFAULT NULL,
  `flow_speed` int(10) DEFAULT NULL,
  `flow_configuration` varchar(32) DEFAULT NULL,
  `flow_supported` varchar(32) DEFAULT NULL,
  `flow_peer_features` varchar(32) DEFAULT NULL,
  `flow_port_number` int(10) DEFAULT NULL,
  `flow_advertised_features` varchar(32) DEFAULT NULL,
  `flow_current_feature` varchar(32) DEFAULT NULL,
  `flow_hardware_address` varchar(32) DEFAULT NULL,
  `flow_current_speed` int(10) DEFAULT NULL,
  `switches_id` varchar(32) DEFAULT NULL COMMENT '对应的交换机id',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`node_connector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of switches_node_connector
-- ----------------------------
INSERT INTO `switches_node_connector` VALUES ('0f9208c73aff443c8519acb59d2036df', 'openflow:2:2', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '13c9e8c4f27241c6ba1188694cbaa3e7', '2018-10-29 16:20:38');
INSERT INTO `switches_node_connector` VALUES ('1716223794894bcc80caf9055aabeb5f', 'openflow:2038063737066023809:2', null, null, null, null, '14116944', '215848293', null, null, null, null, null, null, '141865', '211156', null, null, null, null, null, null, null, null, null, null, null, null, null, '2b91932c68204d2fbff2643b83d7e542', '2018-10-29 16:20:40');
INSERT INTO `switches_node_connector` VALUES ('1b83a4c2c097452380b2bb756aa56d45', 'openflow:2038063737063325569:LOCAL', null, null, null, null, '10211916', '738', null, null, null, null, null, null, '77363', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:42');
INSERT INTO `switches_node_connector` VALUES ('1bb0c56698f249e2aacc717afc007605', 'openflow:2037944993637447489:6', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '429f0df7567c4e21847c9f7392e0c281', '2018-10-29 16:20:39');
INSERT INTO `switches_node_connector` VALUES ('211dd47205db4e319524740299cf3611', 'openflow:2038063737066023809:5', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '2b91932c68204d2fbff2643b83d7e542', '2018-10-29 16:20:40');
INSERT INTO `switches_node_connector` VALUES ('225d87ba43d64d7eac99bd80abedc520', 'openflow:10308452565238866008:4', null, null, null, null, '9834245', '9825101', null, null, null, null, null, null, '77435', '77363', null, null, null, null, null, null, null, null, null, null, null, null, null, 'f50a18a11343447bb64bdefc40a0d69a', '2018-10-29 16:20:41');
INSERT INTO `switches_node_connector` VALUES ('2b0ee46a6c8a4c43aed13776c2f17696', 'openflow:10308452565238866008:2', null, null, null, null, '99638783', '-350207808', null, null, null, null, null, null, '1344314', '2667781', null, null, null, null, null, null, null, null, null, null, null, null, null, 'f50a18a11343447bb64bdefc40a0d69a', '2018-10-29 16:20:41');
INSERT INTO `switches_node_connector` VALUES ('2b536de57ba64c4193cfdc2ec9bbe0c8', 'openflow:10308452565238866008:7', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, 'f50a18a11343447bb64bdefc40a0d69a', '2018-10-29 16:20:41');
INSERT INTO `switches_node_connector` VALUES ('344c3bb35e054601b7f5aca8d813118c', 'openflow:2038063737066023809:8', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '2b91932c68204d2fbff2643b83d7e542', '2018-10-29 16:20:40');
INSERT INTO `switches_node_connector` VALUES ('3783a19cca414373ab455d86aac337aa', 'openflow:2038063737066023809:LOCAL', null, null, null, null, '9901320', '738', null, null, null, null, null, null, '75010', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, '2b91932c68204d2fbff2643b83d7e542', '2018-10-29 16:20:39');
INSERT INTO `switches_node_connector` VALUES ('389569e8900243d6b842e1cf8a8212e4', 'openflow:11882651047521214913:8', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:38');
INSERT INTO `switches_node_connector` VALUES ('3b3feca8e3f44484ac706fecea92bfd4', 'openflow:1:2', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '23235773247848ca97f07375c4736f0e', '2018-10-29 16:20:38');
INSERT INTO `switches_node_connector` VALUES ('3b7ed75b6f6447cbb46ab8daf8ef8a17', 'openflow:2037944993637447489:1', null, null, null, null, '18088804', '285521850', null, null, null, null, null, null, '183420', '263080', null, null, null, null, null, null, null, null, null, null, null, null, null, '429f0df7567c4e21847c9f7392e0c281', '2018-10-29 16:20:39');
INSERT INTO `switches_node_connector` VALUES ('3f0668eb643b4305ab9799f7d640b317', 'openflow:11882651047521214913:LOCAL', null, null, null, null, '10122896', '738', null, null, null, null, null, null, '75544', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:37');
INSERT INTO `switches_node_connector` VALUES ('3f46b14c8cde4f09a12ceccc7c3cc574', 'openflow:2038063737063325569:50', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:42');
INSERT INTO `switches_node_connector` VALUES ('41c52cd957654cfa8f75ef5743a2aff3', 'openflow:2038063737063325569:3', null, null, null, null, '1804789', '19663965', null, null, null, null, null, null, '14487', '242540', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:42');
INSERT INTO `switches_node_connector` VALUES ('4f49cdb13e174380a781f07d43b7efe8', 'openflow:11882651047521214913:5', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:37');
INSERT INTO `switches_node_connector` VALUES ('5402786ac0f54cc1ab0262b019464625', 'openflow:10308452565238866008:5', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, 'f50a18a11343447bb64bdefc40a0d69a', '2018-10-29 16:20:41');
INSERT INTO `switches_node_connector` VALUES ('56ed6d262156462aae7bdb5f92951a76', 'openflow:2037944993637447489:LOCAL', null, null, null, null, '10214028', '738', null, null, null, null, null, null, '77379', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, '429f0df7567c4e21847c9f7392e0c281', '2018-10-29 16:20:39');
INSERT INTO `switches_node_connector` VALUES ('59490e98744b4fcbbe4f6236e5f487c2', 'openflow:11882651047521214913:50', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:38');
INSERT INTO `switches_node_connector` VALUES ('5be3815a6e15496a9410ec9462ecfb21', 'openflow:11882651047521214913:2', null, null, null, null, '12874151', '150415426', null, null, null, null, null, null, '122810', '170500', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:37');
INSERT INTO `switches_node_connector` VALUES ('5ed326e062a245e687bc4fd583c9b375', 'openflow:11882651047521214913:3', null, null, null, null, '240431323', '-131890930', null, null, null, null, null, null, '1467632', '2800762', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:37');
INSERT INTO `switches_node_connector` VALUES ('61a65c2d97314b81a72d70111fcfcbc5', 'openflow:11882651047521214913:49', null, null, null, null, '-350207808', '99638783', null, null, null, null, null, null, '2667781', '1344314', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:37');
INSERT INTO `switches_node_connector` VALUES ('65305e4582d94ebb8a36b087932e1af9', 'openflow:2037944993637447489:5', null, null, null, null, '8250', '0', null, null, null, null, null, null, '66', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '429f0df7567c4e21847c9f7392e0c281', '2018-10-29 16:20:39');
INSERT INTO `switches_node_connector` VALUES ('6766ae22f07e40c78fbdd2f12cf0e6fe', 'openflow:2037944993637447489:49', null, null, null, null, '99631544', '-350118739', null, null, null, null, null, null, '1344257', '2669672', null, null, null, null, null, null, null, null, null, null, null, null, null, '429f0df7567c4e21847c9f7392e0c281', '2018-10-29 16:20:39');
INSERT INTO `switches_node_connector` VALUES ('6f1bb357ea5a42ef89e1e823ed6bc17a', 'openflow:2038063737063325569:5', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:42');
INSERT INTO `switches_node_connector` VALUES ('7074a548cbb24fafac0770fb89575dbd', 'openflow:11882651047521214913:52', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:37');
INSERT INTO `switches_node_connector` VALUES ('71d77162dc5e408baf016dfd40021128', 'openflow:2037944993637447489:7', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '429f0df7567c4e21847c9f7392e0c281', '2018-10-29 16:20:39');
INSERT INTO `switches_node_connector` VALUES ('762e0868a8604b109bd3128a388939ff', 'openflow:2038063737063325569:1', null, null, null, null, '150415426', '12874151', null, null, null, null, null, null, '170500', '122810', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:42');
INSERT INTO `switches_node_connector` VALUES ('773619a254454f32a3239800e40f1971', 'openflow:2038063737066023809:49', null, null, null, null, '9526270', '9794621', null, null, null, null, null, null, '75010', '77123', null, null, null, null, null, null, null, null, null, null, null, null, null, '2b91932c68204d2fbff2643b83d7e542', '2018-10-29 16:20:40');
INSERT INTO `switches_node_connector` VALUES ('7b04bcefea1a4813b303006156bb6799', 'openflow:11882651047521214913:4', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:37');
INSERT INTO `switches_node_connector` VALUES ('7d1929514cc44a59800221beb920cf33', 'openflow:11882651047521214913:1', null, null, null, null, '215885123', '14116944', null, null, null, null, null, null, '211446', '141865', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:37');
INSERT INTO `switches_node_connector` VALUES ('812318dc3e034950947e2e9289e39761', 'openflow:10308452565238866008:6', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, 'f50a18a11343447bb64bdefc40a0d69a', '2018-10-29 16:20:41');
INSERT INTO `switches_node_connector` VALUES ('83a4f4feffa049b5ba6ef02aa29c1f6a', 'openflow:2038063737063325569:8', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:42');
INSERT INTO `switches_node_connector` VALUES ('86143a548cd44235ac07435926663f06', 'openflow:2037944993637447489:8', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '429f0df7567c4e21847c9f7392e0c281', '2018-10-29 16:20:38');
INSERT INTO `switches_node_connector` VALUES ('909372ef187a40cc8e80eec1cd9f53b3', 'openflow:2037944993637447489:3', null, null, null, null, '128662338', '105175599', null, null, null, null, null, null, '2965708', '1463395', null, null, null, null, null, null, null, null, null, null, null, null, null, '429f0df7567c4e21847c9f7392e0c281', '2018-10-29 16:20:39');
INSERT INTO `switches_node_connector` VALUES ('94a5b3c330cf42ab938d9238d8c84278', 'openflow:10308452565238866008:8', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, 'f50a18a11343447bb64bdefc40a0d69a', '2018-10-29 16:20:41');
INSERT INTO `switches_node_connector` VALUES ('97b35a507727445ba30d7624a2db76f9', 'openflow:2038063737063325569:49', null, null, null, null, '9825101', '9834245', null, null, null, null, null, null, '77363', '77435', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:42');
INSERT INTO `switches_node_connector` VALUES ('97b4f9379b7d40789ae91320dafc4d8d', 'openflow:10308452565238866008:LOCAL', null, null, null, null, '0', '408', null, null, null, null, null, null, '0', '4', null, null, null, null, null, null, null, null, null, null, null, null, null, 'f50a18a11343447bb64bdefc40a0d69a', '2018-10-29 16:20:41');
INSERT INTO `switches_node_connector` VALUES ('9cb69cf4f3bc4e858ec254adf508c463', 'openflow:11882651047521214913:7', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:38');
INSERT INTO `switches_node_connector` VALUES ('a10b596c3b7c4c9887bf89636cb32aa6', 'openflow:2038063737066023809:6', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '2b91932c68204d2fbff2643b83d7e542', '2018-10-29 16:20:40');
INSERT INTO `switches_node_connector` VALUES ('a56ab23ec0c6436b90598efcc258b0e3', 'openflow:2037944993637447489:4', null, null, null, null, '29500', '0', null, null, null, null, null, null, '236', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '429f0df7567c4e21847c9f7392e0c281', '2018-10-29 16:20:39');
INSERT INTO `switches_node_connector` VALUES ('a56cca9262a0409ea3892c77e0c49dde', 'openflow:2038063737063325569:7', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:42');
INSERT INTO `switches_node_connector` VALUES ('ab15173eaa2f4c909f4966d7dae2698a', 'openflow:11882651047521214913:6', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:37');
INSERT INTO `switches_node_connector` VALUES ('b0aaaa5179b545f5b475bc2c6d95c00d', 'openflow:2038063737066023809:7', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '2b91932c68204d2fbff2643b83d7e542', '2018-10-29 16:20:40');
INSERT INTO `switches_node_connector` VALUES ('b82a284a657847baa50958a23f6b3f5b', 'openflow:2038063737066023809:4', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '2b91932c68204d2fbff2643b83d7e542', '2018-10-29 16:20:40');
INSERT INTO `switches_node_connector` VALUES ('c7a658e994bc4833b579c56e0a297587', 'openflow:2037944993637447489:2', null, null, null, null, '14410319', '215670079', null, null, null, null, null, null, '144212', '210934', null, null, null, null, null, null, null, null, null, null, null, null, null, '429f0df7567c4e21847c9f7392e0c281', '2018-10-29 16:20:39');
INSERT INTO `switches_node_connector` VALUES ('cac172edba394714a2e63f0c524b4b9b', 'openflow:2038063737063325569:4', null, null, null, null, '13720197', '434042156', null, null, null, null, null, null, '171852', '350178', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:41');
INSERT INTO `switches_node_connector` VALUES ('d65c92e46b6c423395304fe0aaf36479', 'openflow:2038063737063325569:6', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:42');
INSERT INTO `switches_node_connector` VALUES ('d7b38331e32c4774b9effb48ad38342c', 'openflow:10308452565238866008:3', null, null, null, null, '9831451', '9526270', null, null, null, null, null, null, '77413', '75010', null, null, null, null, null, null, null, null, null, null, null, null, null, 'f50a18a11343447bb64bdefc40a0d69a', '2018-10-29 16:20:41');
INSERT INTO `switches_node_connector` VALUES ('de4fffb749b648d4bb27b7dd8e5d04fc', 'openflow:2038063737063325569:2', null, null, null, null, '285521850', '18088804', null, null, null, null, null, null, '263080', '183420', null, null, null, null, null, null, null, null, null, null, null, null, null, 'a7f1f55fce05472cb1e5e31c403b5565', '2018-10-29 16:20:42');
INSERT INTO `switches_node_connector` VALUES ('ebb74c198e9c4a818c1056d87ab0ba43', 'openflow:2038063737066023809:1', null, null, null, null, '215670079', '14380444', null, null, null, null, null, null, '210934', '143973', null, null, null, null, null, null, null, null, null, null, null, null, null, '2b91932c68204d2fbff2643b83d7e542', '2018-10-29 16:20:40');
INSERT INTO `switches_node_connector` VALUES ('edd385626af24324899991819df7278b', 'openflow:2038063737066023809:3', null, null, null, null, '250375', '21627', null, null, null, null, null, null, '2003', '121', null, null, null, null, null, null, null, null, null, null, null, null, null, '2b91932c68204d2fbff2643b83d7e542', '2018-10-29 16:20:40');
INSERT INTO `switches_node_connector` VALUES ('f6b64d75def2437f97d5d003f101eefe', 'openflow:11882651047521214913:51', null, null, null, null, '0', '0', null, null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '9732b0382f9642db89d8271c6edec584', '2018-10-29 16:20:38');
INSERT INTO `switches_node_connector` VALUES ('f85b46efbbd342fa8b14bde3a2e2d4b1', 'openflow:10308452565238866008:1', null, null, null, null, '-350118739', '99631544', null, null, null, null, null, null, '2669672', '1344257', null, null, null, null, null, null, null, null, null, null, null, null, null, 'f50a18a11343447bb64bdefc40a0d69a', '2018-10-29 16:20:41');

-- ----------------------------
-- Table structure for user_test
-- ----------------------------
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_test
-- ----------------------------
INSERT INTO `user_test` VALUES ('11', 'lisi', '111', '111', '2018-11-11 14:14:20');
INSERT INTO `user_test` VALUES ('22', 'zhangsan', '222', '222', '2018-11-12 14:14:38');
INSERT INTO `user_test` VALUES ('33', '33', '33', '33', '2018-11-14 16:49:40');

-- ----------------------------
-- Table structure for vips
-- ----------------------------
DROP TABLE IF EXISTS `vips`;
CREATE TABLE `vips` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `rip_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `start_ip` int(11) NOT NULL,
  `end_ip` int(11) NOT NULL,
  `vip_time` int(11) NOT NULL,
  `vdomain_time` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ID` (`rip_id`),
  CONSTRAINT `FK_ID` FOREIGN KEY (`rip_id`) REFERENCES `rips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vips
-- ----------------------------
INSERT INTO `vips` VALUES ('34c9d892169a4873835884611405e946', '5d5140e67aee435a8aed02814ed1f033', '1684300801', '1684301050', '1200', '1200', '2017-05-09 16:05:34');

-- ----------------------------
-- Table structure for virtual_ip_conf
-- ----------------------------
DROP TABLE IF EXISTS `virtual_ip_conf`;
CREATE TABLE `virtual_ip_conf` (
  `virtual_ip_conf_id` varchar(32) NOT NULL COMMENT '虚拟ip配置id',
  `start_ip` varchar(32) DEFAULT NULL COMMENT '虚拟ip开始',
  `end_ip` varchar(32) DEFAULT NULL COMMENT '虚拟ip结束',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `virtual_ip_conf_status` int(1) DEFAULT '0' COMMENT '虚拟ip池状态，1-开启，0-关闭',
  PRIMARY KEY (`virtual_ip_conf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of virtual_ip_conf
-- ----------------------------
INSERT INTO `virtual_ip_conf` VALUES ('12314', '123', '1234', '2018-10-18 17:20:26', null);
INSERT INTO `virtual_ip_conf` VALUES ('2a1d0c9518be4e1e9883c4e300b72a79', '192.168.1.110', '192.168.1.110', '2018-10-21 16:47:09', null);
INSERT INTO `virtual_ip_conf` VALUES ('31db1fe57ee14e17962fda7463130330', '192.168.1.1', '192.168.1.1', '2018-10-24 10:41:16', null);
INSERT INTO `virtual_ip_conf` VALUES ('34b92e05f4b6475994b8614005b91446', '192.168.1.111', '192.168.1.111', '2018-10-21 16:50:13', null);
INSERT INTO `virtual_ip_conf` VALUES ('4dadc2a3e06e4b9281a48473843ae760', '192.168.3.3', '192.168.3.3', '2018-10-24 11:56:56', null);
INSERT INTO `virtual_ip_conf` VALUES ('575c58a1d25c46458dbab3cca310b5b5', '192.168.2.2', '192.168.2.2', '2018-10-24 11:55:05', null);
INSERT INTO `virtual_ip_conf` VALUES ('6407e6dc3d3d40c1b29c4c5cddf676b2', '2222', '222', '2018-10-19 17:42:11', null);
INSERT INTO `virtual_ip_conf` VALUES ('6db5b7c1772041f99743c443e2f07c12', '111', '111', '2018-10-19 17:42:06', null);
INSERT INTO `virtual_ip_conf` VALUES ('72a26d73ee2e4df2af6e3538de399745', '192.168.1.17', '192.168.1.17', '2018-10-24 15:47:20', null);
INSERT INTO `virtual_ip_conf` VALUES ('77b02c97a3624d488c3ec5164b768847', '192.168.6.6', '192.168.6.6', '2018-10-24 13:00:49', null);
INSERT INTO `virtual_ip_conf` VALUES ('ba354d1d96354c068dbe3246597b381d', '456', '456', '2018-10-21 12:20:26', null);
INSERT INTO `virtual_ip_conf` VALUES ('c28011efeb10442ca5bd702e306f09c0', '192.168.1.1', '192.168.1.255', '2018-10-24 09:26:34', null);
INSERT INTO `virtual_ip_conf` VALUES ('c3c657445fe24830b439c2dd74ff62e0', '123', '123', '2018-10-21 12:20:26', null);
INSERT INTO `virtual_ip_conf` VALUES ('d31426060bc84abb9841611cc19b5da4', '192.168.1.1', '192.168.1.1', '2018-10-24 11:01:15', null);
INSERT INTO `virtual_ip_conf` VALUES ('d7af133bdc0c4427a7df48a9fdf27813', '192.168.1.1', '192.168.1.1', '2018-10-21 15:25:03', null);
INSERT INTO `virtual_ip_conf` VALUES ('ee059bea79c0470781c0351e6d45a11d', '192.168.1.3', '192.168.1.3', '2018-10-21 15:25:03', null);
INSERT INTO `virtual_ip_conf` VALUES ('f64d2180558a407886f52a736bfcb30d', '192.168.16.16', '192.168.16.16', '2018-10-24 15:44:47', null);

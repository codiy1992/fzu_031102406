/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50619
Source Host           : localhost:3306
Source Database       : codiy

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2015-05-26 23:59:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qss_admin
-- ----------------------------
DROP TABLE IF EXISTS `qss_admin`;
CREATE TABLE `qss_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `admin_name` varchar(100) NOT NULL COMMENT '管理员名',
  `admin_pass` varchar(100) NOT NULL COMMENT '管理员密码',
  `salt` varchar(16) NOT NULL COMMENT '盐值',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像url',
  `admin_phone` varchar(30) DEFAULT NULL COMMENT '手机号',
  `admin_email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `login_ip` varchar(30) DEFAULT NULL COMMENT '登录IP',
  `login_time` int(10) DEFAULT '0' COMMENT '最后登陆时间',
  `config` text COMMENT '配置(界面配置，模块配置)',
  `info` text COMMENT '其他信息',
  `auth_level` tinyint(1) unsigned NOT NULL DEFAULT '15' COMMENT '权限级别，1最高',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_name` (`admin_name`),
  UNIQUE KEY `admin_email` (`admin_email`),
  UNIQUE KEY `admin_phone` (`admin_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of qss_admin
-- ----------------------------
INSERT INTO `qss_admin` VALUES ('1', 'codiy', '34cf37ddd7bc3e88701f271c66aa391c', '185006', null, '18650346179', 'mail@codiy.net', '127.0.0.1', '1432642675', null, null, '1', '0');

-- ----------------------------
-- Table structure for qss_city
-- ----------------------------
DROP TABLE IF EXISTS `qss_city`;
CREATE TABLE `qss_city` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `name` varchar(50) NOT NULL COMMENT '名字',
  `full_name` varchar(50) NOT NULL COMMENT '全称',
  `province_id` int(10) NOT NULL COMMENT '所属省份',
  `full_spell` varchar(20) NOT NULL COMMENT '全拼',
  `short_spell` varchar(5) NOT NULL COMMENT '简拼',
  `first_char` varchar(1) NOT NULL COMMENT '首字母',
  `zipcode` int(10) NOT NULL COMMENT '邮政编码',
  `municipality` int(10) NOT NULL COMMENT '是否直辖市0不是1是:北京上海天津重庆为1',
  `city_code` varchar(100) NOT NULL COMMENT '电话区号',
  `domain` varchar(100) NOT NULL COMMENT '域名',
  `display_order` int(10) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8 COMMENT='城市表';

-- ----------------------------
-- Records of qss_city
-- ----------------------------
INSERT INTO `qss_city` VALUES ('1', '福州', '福州市', '12', 'fuzhoushi', 'fzs', 'f', '350100', '0', '', '0591', '4');
INSERT INTO `qss_city` VALUES ('2', '厦门', '厦门市', '12', 'xiamenshi', 'xms', 'x', '350200', '0', '', '0592', '3');
INSERT INTO `qss_city` VALUES ('3', '莆田', '莆田市', '12', 'putianshi', 'pts', 'p', '350300', '0', '', '0594', '87');
INSERT INTO `qss_city` VALUES ('4', '三明', '三明市', '12', 'sanmingshi', 'sms', 's', '350400', '0', '', '0598', '94');
INSERT INTO `qss_city` VALUES ('5', '泉州', '泉州市', '12', 'quanzhoushi', 'qzs', 'q', '350500', '0', '', '0595', '6');
INSERT INTO `qss_city` VALUES ('6', '漳州', '漳州市', '12', 'zhangzhoushi', 'zzs', 'z', '350600', '0', '', '0596', '5');
INSERT INTO `qss_city` VALUES ('7', '南平', '南平市', '12', 'nanpingshi', 'nps', 'n', '350700', '0', '', '0599', '85');
INSERT INTO `qss_city` VALUES ('8', '龙岩', '龙岩市', '12', 'longyanshi', 'lys', 'l', '350800', '0', '', '0597', '57');
INSERT INTO `qss_city` VALUES ('9', '宁德', '宁德市', '12', 'ningdeshi', 'nds', 'n', '352200', '0', '', '0593', '46');
INSERT INTO `qss_city` VALUES ('10', '杭州', '杭州市', '18', 'whangzhoushi', 'hzs', 'h', '330100', '0', '', '0571', '10');
INSERT INTO `qss_city` VALUES ('11', '宁波', '宁波市', '18', 'ningboshi', 'nbs', 'n', '330200', '0', '', '0574', '1');
INSERT INTO `qss_city` VALUES ('12', '温州', '温州市', '18', 'wenzhoushi', 'wzs', 'w', '330300', '0', '', '0577', '9');
INSERT INTO `qss_city` VALUES ('13', '嘉兴', '嘉兴市', '18', 'jiaxingshi', 'jxs', 'j', '330400', '0', '', '0573', '44');
INSERT INTO `qss_city` VALUES ('14', '湖州', '湖州市', '18', 'huzhoushi', 'hzs', 'h', '330500', '0', '', '0572', '65');
INSERT INTO `qss_city` VALUES ('15', '绍兴', '绍兴市', '18', 'shaoxingshi', 'sxs', 's', '330600', '0', '', '0575', '69');
INSERT INTO `qss_city` VALUES ('16', '金华', '金华市', '18', 'jinhuashi', 'jhs', 'j', '330700', '0', '', '0579', '28');
INSERT INTO `qss_city` VALUES ('17', '衢州', '衢州市', '18', 'quzhoushi', 'qzs', 'q', '330800', '0', '', '0570', '184');
INSERT INTO `qss_city` VALUES ('18', '舟山', '舟山市', '18', 'zhoushanshi', 'zss', 'z', '330900', '0', '', '0580', '999');
INSERT INTO `qss_city` VALUES ('19', '台州', '台州市', '18', 'taizhoushi', 'tzs', 't', '331000', '0', '', '0576', '12');
INSERT INTO `qss_city` VALUES ('20', '丽水', '丽水市', '18', 'lishuishi', 'lss', 'l', '332500', '0', '', '0578', '48');
INSERT INTO `qss_city` VALUES ('40', '广州', '广州市', '13', 'guangzhoushi', 'gzs', 'g', '440100', '0', '', '020', '56');
INSERT INTO `qss_city` VALUES ('41', '韶关', '韶关市', '13', 'shaoguanshi', 'sgs', 's', '440200', '0', '', '0751', '313');
INSERT INTO `qss_city` VALUES ('42', '深圳', '深圳市', '13', 'shenzhenshi', 'szs', 's', '440300', '0', '', '0755', '2');
INSERT INTO `qss_city` VALUES ('43', '珠海', '珠海市', '13', 'zhuhaishi', 'zhs', 'z', '440400', '0', '', '0756', '101');
INSERT INTO `qss_city` VALUES ('44', '汕头', '汕头市', '13', 'shantoushi', 'sts', 's', '440500', '0', '', '0754', '199');
INSERT INTO `qss_city` VALUES ('45', '佛山', '佛山市', '13', 'foshanshi', 'fss', 'f', '440600', '0', '', '0757', '74');
INSERT INTO `qss_city` VALUES ('46', '江门', '江门市', '13', 'jiangmenshi', 'jms', 'j', '440700', '0', '', '0750', '112');
INSERT INTO `qss_city` VALUES ('47', '湛江', '湛江市', '13', 'zhanjiangshi', 'zjs', 'z', '440800', '0', '', '0759', '178');
INSERT INTO `qss_city` VALUES ('48', '茂名', '茂名市', '13', 'maomingshi', 'mms', 'm', '440900', '0', '', '0668', '156');
INSERT INTO `qss_city` VALUES ('49', '肇庆', '肇庆市', '13', 'zhaoqingshi', 'zqs', 'z', '441200', '0', '', '0758', '277');
INSERT INTO `qss_city` VALUES ('50', '惠州', '惠州市', '13', 'huizhoushi', 'hzs', 'h', '441300', '0', '', '0752', '239');
INSERT INTO `qss_city` VALUES ('51', '梅州', '梅州市', '13', 'meizhoushi', 'mzs', 'm', '441400', '0', '', '0753', '197');
INSERT INTO `qss_city` VALUES ('52', '汕尾', '汕尾市', '13', 'shanweishi', 'sws', 's', '441500', '0', '', '0660', '314');
INSERT INTO `qss_city` VALUES ('53', '河源', '河源市', '13', 'heyuanshi', 'hys', 'h', '441600', '0', '', '0762', '232');
INSERT INTO `qss_city` VALUES ('54', '阳江', '阳江市', '13', 'yangjiangshi', 'yjs', 'y', '441700', '0', '', '0662', '225');
INSERT INTO `qss_city` VALUES ('55', '清远', '清远市', '13', 'qingyuanshi', 'qys', 'q', '441800', '0', '', '0763', '164');
INSERT INTO `qss_city` VALUES ('56', '东莞', '东莞市', '13', 'dongguanshi', 'dgs', 'd', '441900', '0', '', '0769', '14');
INSERT INTO `qss_city` VALUES ('57', '中山', '中山市', '13', 'zhongshanshi', 'zss', 'z', '442000', '0', '', '0760', '40');
INSERT INTO `qss_city` VALUES ('58', '潮州', '潮州市', '13', 'chaozhoushi', 'czs', 'c', '445100', '0', '', '0768', '323');
INSERT INTO `qss_city` VALUES ('59', '揭阳', '揭阳市', '13', 'jieyangshi', 'jys', 'j', '445200', '0', '', '0663', '135');
INSERT INTO `qss_city` VALUES ('60', '云浮', '云浮市', '13', 'yunfushi', 'yfs', 'y', '445300', '0', '', '0766', '999');
INSERT INTO `qss_city` VALUES ('61', '南宁', '南宁市', '35', 'nanningshi', 'nns', 'n', '450100', '0', '', '0771', '25');
INSERT INTO `qss_city` VALUES ('62', '柳州', '柳州市', '35', 'liuzhoushi', 'lzs', 'l', '450200', '0', '', '0772', '36');
INSERT INTO `qss_city` VALUES ('63', '桂林', '桂林市', '35', 'guilinshi', 'gls', 'g', '450300', '0', '', '0773', '35');
INSERT INTO `qss_city` VALUES ('64', '梧州', '梧州市', '35', 'wuzhoushi', 'wzs', 'w', '450400', '0', '', '0774', '54');
INSERT INTO `qss_city` VALUES ('65', '北海', '北海市', '35', 'beihaishi', 'bhs', 'b', '450500', '0', '', '0779', '249');
INSERT INTO `qss_city` VALUES ('66', '防城港', '防城港市', '35', 'fangchenggangshi', 'fcgs', 'f', '450600', '0', '', '0770', '202');
INSERT INTO `qss_city` VALUES ('67', '钦州', '钦州市', '35', 'qinzhoushi', 'qzs', 'q', '450700', '0', '', '0777', '194');
INSERT INTO `qss_city` VALUES ('68', '贵港', '贵港市', '35', 'guigangshi', 'ggs', 'g', '450800', '0', '', '0775', '205');
INSERT INTO `qss_city` VALUES ('69', '玉林', '玉林市', '35', 'yulinshi', 'yls', 'y', '450900', '0', '', 'yuling', '129');
INSERT INTO `qss_city` VALUES ('72', '贺州地区', '贺州地区', '35', 'hezhoudiqu', 'hzdq', 'h', '452400', '0', '', 'hezhou', '261');
INSERT INTO `qss_city` VALUES ('73', '百色', '百色地区', '35', 'baisediqu', 'bsdq', 'b', '452600', '0', '', '0776', '250');
INSERT INTO `qss_city` VALUES ('74', '河池', '河池地区', '35', 'hechidiqu', 'hcdq', 'h', '452700', '0', '', '0778', '265');
INSERT INTO `qss_city` VALUES ('75', '南京', '南京市', '14', 'nanjingshi', 'njs', 'n', '320100', '0', '', '025', '7');
INSERT INTO `qss_city` VALUES ('76', '无锡', '无锡市', '14', 'wuxishi', 'wxs', 'w', '320200', '0', '', '0510', '16');
INSERT INTO `qss_city` VALUES ('77', '徐州', '徐州市', '14', 'xuzhoushi', 'xzs', 'x', '320300', '0', '', '0516', '41');
INSERT INTO `qss_city` VALUES ('78', '常州', '常州市', '14', 'changzhoushi', 'czs', 'c', '320400', '0', '', '0519', '39');
INSERT INTO `qss_city` VALUES ('79', '苏州', '苏州市', '14', 'suzhoushi', 'szs', 's', '320500', '0', '', '0512', '18');
INSERT INTO `qss_city` VALUES ('80', '南通', '南通市', '14', 'nantongshi', 'nts', 'n', '320600', '0', '', '0513', '63');
INSERT INTO `qss_city` VALUES ('81', '连云港', '连云港市', '14', 'lianyungangshi', 'lygs', 'l', '320700', '0', '', '0518', '88');
INSERT INTO `qss_city` VALUES ('82', '淮安', '淮安市', '14', 'huaianshi', 'has', 'h', '320800', '0', '', '0517', '30');
INSERT INTO `qss_city` VALUES ('83', '盐城', '盐城市', '14', 'yanchengshi', 'ycs', 'y', '320900', '0', '', '0515', '96');
INSERT INTO `qss_city` VALUES ('84', '扬州', '扬州市', '14', 'yangzhoushi', 'yzs', 'y', '321000', '0', '', '0514', '66');
INSERT INTO `qss_city` VALUES ('85', '镇江', '镇江市', '14', 'zhenjiangshi', 'zjs', 'z', '321100', '0', '', '0511', '31');
INSERT INTO `qss_city` VALUES ('86', '泰州', '泰州市', '14', 'taizhoushi', 'tzs', 't', '321200', '0', '', '0523', '24');
INSERT INTO `qss_city` VALUES ('87', '宿迁', '宿迁市', '14', 'suqianshi', 'sqs', 's', '321300', '0', '', '0527', '175');
INSERT INTO `qss_city` VALUES ('88', '石家庄', '石家庄市', '37', 'shijiazhuangshi', 'sjzs', 's', '130100', '0', '', '0311', '89');
INSERT INTO `qss_city` VALUES ('89', '唐山', '唐山市', '37', 'tangshanshi', 'tss', 't', '130200', '0', '', '0315', '98');
INSERT INTO `qss_city` VALUES ('90', '秦皇岛', '秦皇岛市', '37', 'qinhuangdaoshi', 'qhds', 'q', '130300', '0', '', '0335', '43');
INSERT INTO `qss_city` VALUES ('91', '邯郸', '邯郸市', '37', 'handanshi', 'hds', 'h', '130400', '0', '', '0310', '99');
INSERT INTO `qss_city` VALUES ('92', '邢台', '邢台市', '37', 'xingtaishi', 'xts', 'x', '130500', '0', '', '0319', '123');
INSERT INTO `qss_city` VALUES ('93', '保定', '保定市', '37', 'baodingshi', 'bds', 'b', '130600', '0', '', '0312', '86');
INSERT INTO `qss_city` VALUES ('94', '张家口', '张家口市', '37', 'zhangjiakoushi', 'zjks', 'z', '130700', '0', '', '0313', '142');
INSERT INTO `qss_city` VALUES ('95', '承德', '承德市', '37', 'chengdeshi', 'cds', 'c', '130800', '0', '', '0314', '161');
INSERT INTO `qss_city` VALUES ('96', '沧州', '沧州市', '37', 'cangzhoushi', 'czs', 'c', '130900', '0', '', '0317', '122');
INSERT INTO `qss_city` VALUES ('97', '廊坊', '廊坊市', '37', 'langfangshi', 'lfs', 'l', '131000', '0', '', '0316', '125');
INSERT INTO `qss_city` VALUES ('98', '衡水', '衡水市', '37', 'hengshuishi', 'hss', 'h', '131100', '0', '', '0318', '119');
INSERT INTO `qss_city` VALUES ('99', '郑州', '郑州市', '38', 'zhengzhoushi', 'zzs', 'z', '410100', '0', '', '0371', '21');
INSERT INTO `qss_city` VALUES ('100', '开封', '开封市', '38', 'kaifengshi', 'kfs', 'k', '410200', '0', '', '0378', '138');
INSERT INTO `qss_city` VALUES ('101', '洛阳', '洛阳市', '38', 'luoyangshi', 'lys', 'l', '410300', '0', '', '0379', '68');
INSERT INTO `qss_city` VALUES ('102', '平顶山', '平顶山市', '38', 'pingdingshanshi', 'pdss', 'p', '410400', '0', '', '0375', '143');
INSERT INTO `qss_city` VALUES ('103', '安阳', '安阳市', '38', 'anyangshi', 'ays', 'a', '410500', '0', '', '0372', '29');
INSERT INTO `qss_city` VALUES ('104', '鹤壁', '鹤壁市', '38', 'hebishi', 'hbs', 'h', '410600', '0', '', '0392', '219');
INSERT INTO `qss_city` VALUES ('105', '新乡', '新乡市', '38', 'xinxiangshi', 'xxs', 'x', '410700', '0', '', '0373', '103');
INSERT INTO `qss_city` VALUES ('106', '焦作', '焦作市', '38', 'jiaozuoshi', 'jzs', 'j', '410800', '0', '', '0391', '64');
INSERT INTO `qss_city` VALUES ('107', '濮阳', '濮阳市', '38', 'puyangshi', 'pys', 'p', '410900', '0', '', '0393', '147');
INSERT INTO `qss_city` VALUES ('108', '许昌', '许昌市', '38', 'xuchangshi', 'xcs', 'x', '411000', '0', '', '0374', '160');
INSERT INTO `qss_city` VALUES ('109', '漯河', '漯河市', '38', 'luoheshi', 'lhs', 'l', '411100', '0', '', '0395', '999');
INSERT INTO `qss_city` VALUES ('110', '三门峡', '三门峡市', '38', 'sanmenxiashi', 'smxs', 's', '411200', '0', '', '0398', '212');
INSERT INTO `qss_city` VALUES ('111', '南阳', '南阳市', '38', 'nanyangshi', 'nys', 'n', '411300', '0', '', '0377', '102');
INSERT INTO `qss_city` VALUES ('112', '商丘', '商丘市', '38', 'shangqiushi', 'sqs', 's', '411400', '0', '', '0370', '58');
INSERT INTO `qss_city` VALUES ('113', '信阳', '信阳市', '38', 'xinyangshi', 'xys', 'x', '411500', '0', '', '0376', '256');
INSERT INTO `qss_city` VALUES ('114', '周口', '周口市', '38', 'zhoukoushi', 'zks', 'z', '412700', '0', '', '0394', '109');
INSERT INTO `qss_city` VALUES ('115', '驻马店', '驻马店市', '38', 'zhumadianshi', 'zmds', 'z', '412800', '0', '', '0396', '70');
INSERT INTO `qss_city` VALUES ('116', '武汉', '武汉市', '39', 'wuhanshi', 'whs', 'w', '420100', '0', '', '027', '13');
INSERT INTO `qss_city` VALUES ('117', '黄石', '黄石市', '39', 'huangshishi', 'hss', 'h', '420200', '0', '', '0714', '62');
INSERT INTO `qss_city` VALUES ('118', '十堰', '十堰市', '39', 'shiyanshi', 'sys', 's', '420300', '0', '', '0719', '80');
INSERT INTO `qss_city` VALUES ('119', '宜昌', '宜昌市', '39', 'yichangshi', 'ycs', 'y', '420500', '0', '', '0717', '111');
INSERT INTO `qss_city` VALUES ('120', '襄阳', '襄阳市', '39', 'xiangyangshi', 'xys', 'x', '420600', '0', '', '0710', '27');
INSERT INTO `qss_city` VALUES ('121', '鄂州', '鄂州市', '39', 'ezhoushi', 'ezs', 'e', '420700', '0', '', '0711', '150');
INSERT INTO `qss_city` VALUES ('122', '荆门', '荆门市', '39', 'jingmenshi', 'jms', 'j', '420800', '0', '', '0727', '193');
INSERT INTO `qss_city` VALUES ('123', '孝感', '孝感市', '39', 'xiaoganshi', 'xgs', 'x', '420900', '0', '', '0712', '139');
INSERT INTO `qss_city` VALUES ('124', '荆州', '荆州市', '39', 'jingzhoushi', 'jzs', 'j', '421000', '0', '', '0716', '188');
INSERT INTO `qss_city` VALUES ('125', '黄冈', '黄冈市', '39', 'huanggangshi', 'hgs', 'h', '421100', '0', '', '0713', '114');
INSERT INTO `qss_city` VALUES ('126', '咸宁', '咸宁市', '39', 'xianningshi', 'xns', 'x', '421200', '0', '', '0715', '168');
INSERT INTO `qss_city` VALUES ('127', '恩施', '恩施', '39', 'enshi', 'es', 'e', '422800', '0', '', '0718', '326');
INSERT INTO `qss_city` VALUES ('128', '长沙', '长沙市', '40', 'changshashi', 'css', 'c', '430100', '0', '', '0731', '22');
INSERT INTO `qss_city` VALUES ('129', '株洲', '株洲市', '40', 'zhuzhoushi', 'zzs', 'z', '430200', '0', '', '0733', '171');
INSERT INTO `qss_city` VALUES ('130', '湘潭', '湘潭市', '40', 'xiangtanshi', 'xts', 'x', '430300', '0', '', '0732', '214');
INSERT INTO `qss_city` VALUES ('131', '衡阳', '衡阳市', '40', 'hengyangshi', 'hys', 'h', '430400', '0', '', '0734', '110');
INSERT INTO `qss_city` VALUES ('132', '邵阳', '邵阳市', '40', 'shaoyangshi', 'sys', 's', '430500', '0', '', '0739', '140');
INSERT INTO `qss_city` VALUES ('133', '岳阳', '岳阳市', '40', 'yueyangshi', 'yys', 'y', '430600', '0', '', '0730', '75');
INSERT INTO `qss_city` VALUES ('134', '常德', '常德市', '40', 'changdeshi', 'cds', 'c', '430700', '0', '', '0736', '127');
INSERT INTO `qss_city` VALUES ('135', '张家界', '张家界市', '40', 'zhangjiajieshi', 'zjjs', 'z', '430800', '0', '', '0744', '268');
INSERT INTO `qss_city` VALUES ('136', '益阳', '益阳市', '40', 'yiyangshi', 'yys', 'y', '430900', '0', '', '0737', '215');
INSERT INTO `qss_city` VALUES ('137', '郴州', '郴州市', '40', 'chenzhoushi', 'czs', 'c', '431000', '0', '', '0735', '108');
INSERT INTO `qss_city` VALUES ('138', '永州', '永州市', '40', 'yongzhoushi', 'yzs', 'y', '431100', '0', '', '0746', '174');
INSERT INTO `qss_city` VALUES ('139', '怀化', '怀化市', '40', 'huaihuashi', 'hhs', 'h', '431200', '0', '', '0745', '45');
INSERT INTO `qss_city` VALUES ('140', '娄底', '娄底市', '40', 'loudishi', 'lds', 'l', '432500', '0', '', '0738', '213');
INSERT INTO `qss_city` VALUES ('141', '湘西', '湘西', '40', 'xiangxi', 'xx', 'x', '433100', '0', '', '0743', '180');
INSERT INTO `qss_city` VALUES ('160', '成都', '成都市', '17', 'chengdushi', 'cds', 'c', '510100', '0', '', '028', '17');
INSERT INTO `qss_city` VALUES ('161', '自贡', '自贡市', '17', 'zigongshi', 'zgs', 'z', '510300', '0', '', '0813', '305');
INSERT INTO `qss_city` VALUES ('162', '攀枝花', '攀枝花市', '17', 'panzhihuashi', 'pzhs', 'p', '510400', '0', '', '0812', '163');
INSERT INTO `qss_city` VALUES ('163', '泸州', '泸州市', '17', 'luzhoushi', 'lzs', 'l', '510500', '0', '', '0830', '234');
INSERT INTO `qss_city` VALUES ('164', '德阳', '德阳市', '17', 'deyangshi', 'dys', 'd', '510600', '0', '', '0838', '182');
INSERT INTO `qss_city` VALUES ('165', '绵阳', '绵阳市', '17', 'mianyangshi', 'mys', 'm', '510700', '0', '', '0816', '146');
INSERT INTO `qss_city` VALUES ('166', '广元', '广元市', '17', 'guangyuanshi', 'gys', 'g', '510800', '0', '', '0839', '198');
INSERT INTO `qss_city` VALUES ('167', '遂宁', '遂宁市', '17', 'suiningshi', 'sns', 's', '510900', '0', '', '0825', '999');
INSERT INTO `qss_city` VALUES ('168', '内江', '内江市', '17', 'neijiangshi', 'njs', 'n', '511000', '0', '', '0832', '999');
INSERT INTO `qss_city` VALUES ('169', '乐山', '乐山市', '17', 'leshanshi', 'lss', 'l', '511100', '0', '', '0833', '324');
INSERT INTO `qss_city` VALUES ('170', '南充', '南充市', '17', 'nanchongshi', 'ncs', 'n', '511300', '0', '', '0817', '247');
INSERT INTO `qss_city` VALUES ('171', '宜宾', '宜宾市', '17', 'yibinshi', 'ybs', 'y', '511500', '0', '', '0831', '191');
INSERT INTO `qss_city` VALUES ('172', '广安', '广安市', '17', 'guanganshi', 'gas', 'g', '0', '0', '', '0826', '244');
INSERT INTO `qss_city` VALUES ('173', '达州', '达州市', '17', 'dazhoushi', 'dzs', 'd', '513000', '0', '', '0818', '252');
INSERT INTO `qss_city` VALUES ('174', '雅安', '雅安市', '17', 'yaanshi', 'yas', 'y', '0', '0', '', '0835', '999');
INSERT INTO `qss_city` VALUES ('175', '阿坝', '阿坝', '17', 'aba', 'ab', 'a', '513200', '0', '', '0837', '999');
INSERT INTO `qss_city` VALUES ('176', '甘孜', '甘孜', '17', 'ganzi', 'gz', 'g', '513300', '0', '', '0836', '999');
INSERT INTO `qss_city` VALUES ('177', '凉山', '凉山', '17', 'liangshan', 'ls', 'l', '513400', '0', '', '0834', '999');
INSERT INTO `qss_city` VALUES ('178', '巴中', '巴中市', '17', 'bazhongshi', 'bzs', 'b', '513700', '0', '', '0827', '273');
INSERT INTO `qss_city` VALUES ('179', '眉山', '眉山市', '17', 'meishanshi', 'mss', 'm', '513800', '0', '', 'meishan', '196');
INSERT INTO `qss_city` VALUES ('180', '资阳', '资阳市', '17', 'ziyangshi', 'zys', 'z', '513900', '0', '', 'ziyang', '290');
INSERT INTO `qss_city` VALUES ('221', '太原', '太原市', '44', 'taiyuanshi', 'tys', 't', '140100', '0', '', '0351', '61');
INSERT INTO `qss_city` VALUES ('222', '大同', '大同市', '44', 'datongshi', 'dts', 'd', '140200', '0', '', '0352', '176');
INSERT INTO `qss_city` VALUES ('223', '阳泉', '阳泉市', '44', 'yangquanshi', 'yqs', 'y', '140300', '0', '', '0353', '229');
INSERT INTO `qss_city` VALUES ('224', '长治', '长治市', '44', 'changzhishi', 'czs', 'c', '140400', '0', '', '0355', '105');
INSERT INTO `qss_city` VALUES ('225', '晋城', '晋城市', '44', 'jinchengshi', 'jcs', 'j', '140500', '0', '', '0356', '192');
INSERT INTO `qss_city` VALUES ('226', '朔州', '朔州市', '44', 'shuozhoushi', 'szs', 's', '140600', '0', '', '0349', '267');
INSERT INTO `qss_city` VALUES ('227', '忻州', '忻州地区', '44', 'xinzhoudiqu', 'xzdq', 'x', '142200', '0', '', '0350', '92');
INSERT INTO `qss_city` VALUES ('228', '吕梁', '吕梁地区', '44', 'lvliangdiqu', 'lldq', 'l', '142300', '0', '', '0358', '217');
INSERT INTO `qss_city` VALUES ('229', '晋中', '晋中地区', '44', 'jinzhongdiqu', 'jzdq', 'j', '142400', '0', '', '0354', '67');
INSERT INTO `qss_city` VALUES ('230', '临汾', '临汾地区', '44', 'linfendiqu', 'lfdq', 'l', '142600', '0', '', '0357', '203');
INSERT INTO `qss_city` VALUES ('231', '运城', '运城地区', '44', 'yunchengdiqu', 'ycdq', 'y', '142700', '0', '', '0359', '116');
INSERT INTO `qss_city` VALUES ('232', '西安', '西安市', '45', 'xianshi', 'xas', 'x', '0', '0', '', '029', '53');
INSERT INTO `qss_city` VALUES ('233', '铜川', '铜川市', '45', 'tongchuanshi', 'tcs', 't', '610200', '0', '', '0919', '274');
INSERT INTO `qss_city` VALUES ('234', '宝鸡', '宝鸡市', '45', 'baojishi', 'bjs', 'b', '610300', '0', '', '0917', '195');
INSERT INTO `qss_city` VALUES ('235', '咸阳', '咸阳市', '45', 'xianyangshi', 'xys', 'x', '610400', '0', '', '0910', '126');
INSERT INTO `qss_city` VALUES ('236', '渭南', '渭南市', '45', 'weinanshi', 'wns', 'w', '610500', '0', '', '0913', '167');
INSERT INTO `qss_city` VALUES ('237', '延安', '延安市', '45', 'yananshi', 'yas', 'y', '0', '0', '', '0911', '279');
INSERT INTO `qss_city` VALUES ('238', '汉中', '汉中市', '45', 'hanzhongshi', 'hzs', 'h', '610700', '0', '', '0916', '275');
INSERT INTO `qss_city` VALUES ('239', '安康', '安康市', '45', 'ankangshi', 'aks', 'a', '612400', '0', '', '0915', '210');
INSERT INTO `qss_city` VALUES ('240', '商洛', '商洛市', '45', 'shangluoshi', 'sls', 's', '612500', '0', '', '0914', '999');
INSERT INTO `qss_city` VALUES ('241', '榆林', '榆林市', '45', 'yulinshi', 'yls', 'y', '612700', '0', '', '0912', '76');
INSERT INTO `qss_city` VALUES ('242', '南昌', '南昌市', '46', 'nanchangshi', 'ncs', 'n', '360100', '0', '', '0791', '8');
INSERT INTO `qss_city` VALUES ('243', '景德镇', '景德镇市', '46', 'jingdezhenshi', 'jdzs', 'j', '360200', '0', '', '0798', '78');
INSERT INTO `qss_city` VALUES ('244', '萍乡', '萍乡市', '46', 'pingxiangshi', 'pxs', 'p', '360300', '0', '', '0799', '172');
INSERT INTO `qss_city` VALUES ('245', '九江', '九江市', '46', 'jiujiangshi', 'jjs', 'j', '360400', '0', '', '0792', '19');
INSERT INTO `qss_city` VALUES ('246', '新余', '新余市', '46', 'xinyushi', 'xys', 'x', '360500', '0', '', '0790', '270');
INSERT INTO `qss_city` VALUES ('247', '赣州', '赣州市', '46', 'ganzhoushi', 'gzs', 'g', '360700', '0', '', '0797', '59');
INSERT INTO `qss_city` VALUES ('248', '宜春', '宜春市', '46', 'yichunshi', 'ycs', 'y', '362200', '0', '', '0795', '33');
INSERT INTO `qss_city` VALUES ('249', '上饶', '上饶市', '46', 'shangraoshi', 'srs', 's', '362300', '0', '', '0793', '120');
INSERT INTO `qss_city` VALUES ('250', '吉安', '吉安市', '46', 'jianshi', 'jas', 'j', '0', '0', '', '0796', '97');
INSERT INTO `qss_city` VALUES ('251', '抚州', '抚州市', '46', 'fuzhoushi', 'fzs', 'f', '362500', '0', '', '0794', '130');
INSERT INTO `qss_city` VALUES ('252', '合肥', '合肥市', '47', 'hefeishi', 'hfs', 'h', '340100', '0', '', '0551', '47');
INSERT INTO `qss_city` VALUES ('253', '芜湖', '芜湖市', '47', 'wuhushi', 'whs', 'w', '340200', '0', '', '0553', '141');
INSERT INTO `qss_city` VALUES ('254', '蚌埠', '蚌埠市', '47', 'bangbushi', 'bbs', 'b', '340300', '0', '', '0552', '83');
INSERT INTO `qss_city` VALUES ('255', '淮南', '淮南市', '47', 'huainanshi', 'hns', 'h', '340400', '0', '', '0554', '162');
INSERT INTO `qss_city` VALUES ('256', '马鞍山', '马鞍山市', '47', 'maanshanshi', 'mass', 'm', '0', '0', '', '0555', '223');
INSERT INTO `qss_city` VALUES ('257', '淮北', '淮北市', '47', 'huaibeishi', 'hbs', 'h', '340600', '0', '', '0561', '71');
INSERT INTO `qss_city` VALUES ('258', '铜陵', '铜陵市', '47', 'tonglingshi', 'tls', 't', '340700', '0', '', '0562', '136');
INSERT INTO `qss_city` VALUES ('259', '安庆', '安庆市', '47', 'anqingshi', 'aqs', 'a', '340800', '0', '', '0556', '322');
INSERT INTO `qss_city` VALUES ('260', '黄山', '黄山市', '47', 'huangshanshi', 'hss', 'h', '341000', '0', '', '0559', '306');
INSERT INTO `qss_city` VALUES ('261', '滁州', '滁州市', '47', 'chuzhoushi', 'czs', 'c', '341100', '0', '', '0550', '153');
INSERT INTO `qss_city` VALUES ('262', '阜阳', '阜阳市', '47', 'fuyangshi', 'fys', 'f', '341200', '0', '', 'fuyang', '128');
INSERT INTO `qss_city` VALUES ('263', '宿州', '宿州市', '47', 'suzhoushi', 'szs', 's', '341300', '0', '', '0557', '131');
INSERT INTO `qss_city` VALUES ('264', '六安', '六安市', '47', 'liuanshi', 'las', 'l', '0', '0', '', '0564', '152');
INSERT INTO `qss_city` VALUES ('265', '宣城', '宣城市', '47', 'xuanchengshi', 'xcs', 'x', '0', '0', '', '0563', '187');
INSERT INTO `qss_city` VALUES ('266', '巢湖', '巢湖市', '47', 'chaohushi', 'chs', 'c', '342600', '0', '', '0565', '242');
INSERT INTO `qss_city` VALUES ('267', '池州', '池州市', '47', 'chizhoushi', 'czs', 'c', '342900', '0', '', '0566', '999');
INSERT INTO `qss_city` VALUES ('268', '哈尔滨', '哈尔滨市', '48', 'haerbinshi', 'hebs', 'h', '230100', '0', '', '0451', '90');
INSERT INTO `qss_city` VALUES ('269', '齐齐哈尔', '齐齐哈尔市', '48', 'qiqihaershi', 'qqhes', 'q', '230200', '0', '', '0452', '121');
INSERT INTO `qss_city` VALUES ('270', '鸡西', '鸡西市', '48', 'jixishi', 'jxs', 'j', '230300', '0', '', '0467', '73');
INSERT INTO `qss_city` VALUES ('271', '鹤岗', '鹤岗市', '48', 'hegangshi', 'hgs', 'h', '230400', '0', '', '0468', '999');
INSERT INTO `qss_city` VALUES ('272', '双鸭山', '双鸭山市', '48', 'shuangyashanshi', 'syss', 's', '230500', '0', '', '0469', '170');
INSERT INTO `qss_city` VALUES ('273', '大庆', '大庆市', '48', 'daqingshi', 'dqs', 'd', '230600', '0', '', '0459', '81');
INSERT INTO `qss_city` VALUES ('274', '伊春', '伊春市', '48', 'yichunshi', 'ycs', 'y', '230700', '0', '', '0458', '169');
INSERT INTO `qss_city` VALUES ('275', '佳木斯', '佳木斯市', '48', 'jiamusishi', 'jmss', 'j', '230800', '0', '', '0454', '148');
INSERT INTO `qss_city` VALUES ('276', '七台河', '七台河市', '48', 'qitaiheshi', 'qths', 'q', '230900', '0', '', '0464', '999');
INSERT INTO `qss_city` VALUES ('277', '牡丹江', '牡丹江市', '48', 'mudanjiangshi', 'mdjs', 'm', '231000', '0', '', '0453', '216');
INSERT INTO `qss_city` VALUES ('278', '黑河', '黑河市', '48', 'heiheshi', 'hhs', 'h', '231100', '0', '', '0456', '133');
INSERT INTO `qss_city` VALUES ('279', '绥化', '绥化市', '48', 'suihuashi', 'shs', 's', '232300', '0', '', '0455', '271');
INSERT INTO `qss_city` VALUES ('280', '大兴安岭', '大兴安岭', '48', 'daxinganling', 'dxal', 'd', '232700', '0', '', '0457', '328');
INSERT INTO `qss_city` VALUES ('281', '长春', '长春市', '49', 'changchunshi', 'ccs', 'c', '220100', '0', '', '0431', '93');
INSERT INTO `qss_city` VALUES ('282', '吉林', '吉林市', '49', 'jilinshi', 'jls', 'j', '220200', '0', '', '0432', '113');
INSERT INTO `qss_city` VALUES ('283', '四平', '四平市', '49', 'sipingshi', 'sps', 's', '220300', '0', '', '0434', '233');
INSERT INTO `qss_city` VALUES ('284', '辽源', '辽源市', '49', 'liaoyuanshi', 'lys', 'l', '220400', '0', '', '0437', '204');
INSERT INTO `qss_city` VALUES ('285', '通化', '通化市', '49', 'tonghuashi', 'ths', 't', '220500', '0', '', '0435', '264');
INSERT INTO `qss_city` VALUES ('286', '白山', '白山市', '49', 'baishanshi', 'bss', 'b', '220600', '0', '', '0439', '258');
INSERT INTO `qss_city` VALUES ('287', '松原', '松原市', '49', 'songyuanshi', 'sys', 's', '220700', '0', '', '0438', '149');
INSERT INTO `qss_city` VALUES ('288', '白城', '白城市', '49', 'baichengshi', 'bcs', 'b', '220800', '0', '', '0436', '185');
INSERT INTO `qss_city` VALUES ('289', '延边', '延边', '49', 'yanbian', 'yb', 'y', '222400', '0', '', '0433', '259');
INSERT INTO `qss_city` VALUES ('290', '沈阳', '沈阳市', '50', 'shenyangshi', 'sys', 's', '210100', '0', '', '024', '60');
INSERT INTO `qss_city` VALUES ('291', '大连', '大连市', '50', 'dalianshi', 'dls', 'd', '210200', '0', '', '0411', '77');
INSERT INTO `qss_city` VALUES ('292', '鞍山', '鞍山市', '50', 'anshanshi', 'ass', 'a', '210300', '0', '', '0412', '100');
INSERT INTO `qss_city` VALUES ('293', '抚顺', '抚顺市', '50', 'fushunshi', 'fss', 'f', '210400', '0', '', '0413', '144');
INSERT INTO `qss_city` VALUES ('294', '本溪', '本溪市', '50', 'benxishi', 'bxs', 'b', '210500', '0', '', '0414', '283');
INSERT INTO `qss_city` VALUES ('295', '丹东', '丹东市', '50', 'dandongshi', 'dds', 'd', '210600', '0', '', '0415', '158');
INSERT INTO `qss_city` VALUES ('296', '锦州', '锦州市', '50', 'jinzhoushi', 'jzs', 'j', '210700', '0', '', '0416', '207');
INSERT INTO `qss_city` VALUES ('297', '营口', '营口市', '50', 'yingkoushi', 'yks', 'y', '210800', '0', '', '0417', '177');
INSERT INTO `qss_city` VALUES ('298', '阜新', '阜新市', '50', 'fuxinshi', 'fxs', 'f', '210900', '0', '', '0418', '230');
INSERT INTO `qss_city` VALUES ('299', '辽阳', '辽阳市', '50', 'liaoyangshi', 'lys', 'l', '211000', '0', '', '0419', '134');
INSERT INTO `qss_city` VALUES ('300', '盘锦', '盘锦市', '50', 'panjinshi', 'pjs', 'p', '211100', '0', '', '0427', '235');
INSERT INTO `qss_city` VALUES ('301', '铁岭', '铁岭市', '50', 'tielingshi', 'tls', 't', '211200', '0', '', '0410', '165');
INSERT INTO `qss_city` VALUES ('302', '朝阳', '朝阳市', '50', 'chaoyangshi', 'cys', 'c', '211300', '0', '', '0421', '280');
INSERT INTO `qss_city` VALUES ('303', '葫芦岛', '葫芦岛市', '50', 'huludaoshi', 'hlds', 'h', '211400', '0', '', '0429', '157');
INSERT INTO `qss_city` VALUES ('304', '济南', '济南市', '15', 'jinanshi', 'jns', 'j', '370100', '0', '', '0531', '23');
INSERT INTO `qss_city` VALUES ('305', '青岛', '青岛市', '15', 'qingdaoshi', 'qds', 'q', '370200', '0', '', '0532', '34');
INSERT INTO `qss_city` VALUES ('306', '淄博', '淄博市', '15', 'ziboshi', 'zbs', 'z', '370300', '0', '', '0533', '107');
INSERT INTO `qss_city` VALUES ('307', '枣庄', '枣庄市', '15', 'zaozhuangshi', 'zzs', 'z', '370400', '0', '', '0632', '118');
INSERT INTO `qss_city` VALUES ('308', '东营', '东营市', '15', 'dongyingshi', 'dys', 'd', '370500', '0', '', '0546', '151');
INSERT INTO `qss_city` VALUES ('309', '烟台', '烟台市', '15', 'yantaishi', 'yts', 'y', '370600', '0', '', '0535', '95');
INSERT INTO `qss_city` VALUES ('310', '潍坊', '潍坊市', '15', 'weifangshi', 'wfs', 'w', '370700', '0', '', '0536', '84');
INSERT INTO `qss_city` VALUES ('311', '济宁', '济宁市', '15', 'jiningshi', 'jns', 'j', '370800', '0', '', '0537', '82');
INSERT INTO `qss_city` VALUES ('312', '泰安', '泰安市', '15', 'taianshi', 'tas', 't', '0', '0', '', '0538', '55');
INSERT INTO `qss_city` VALUES ('313', '威海', '威海市', '15', 'weihaishi', 'whs', 'w', '371000', '0', '', '0631', '115');
INSERT INTO `qss_city` VALUES ('314', '日照', '日照市', '15', 'rizhaoshi', 'rzs', 'r', '371100', '0', '', '0633', '181');
INSERT INTO `qss_city` VALUES ('315', '莱芜', '莱芜市', '15', 'laiwushi', 'lws', 'l', '371200', '0', '', '0634', '262');
INSERT INTO `qss_city` VALUES ('316', '临沂', '临沂市', '15', 'linyishi', 'lys', 'l', '371300', '0', '', '0539', '91');
INSERT INTO `qss_city` VALUES ('317', '德州', '德州市', '15', 'dezhoushi', 'dzs', 'd', '371400', '0', '', '0534', '106');
INSERT INTO `qss_city` VALUES ('318', '聊城', '聊城市', '15', 'liaochengshi', 'lcs', 'l', '371500', '0', '', '0635', '145');
INSERT INTO `qss_city` VALUES ('319', '滨州', '滨州市', '15', 'binzhoushi', 'bzs', 'b', '372300', '0', '', '0543', '190');
INSERT INTO `qss_city` VALUES ('320', '菏泽', '菏泽市', '15', 'hezeshi', 'hzs', 'h', '372900', '0', '', '0530', '104');
INSERT INTO `qss_city` VALUES ('339', '昆明', '昆明市', '53', 'kunmingshi', 'kms', 'k', '530100', '0', '', '0871', '11');
INSERT INTO `qss_city` VALUES ('340', '曲靖', '曲靖市', '53', 'qujingshi', 'qjs', 'q', '530300', '0', '', '0874', '117');
INSERT INTO `qss_city` VALUES ('341', '玉溪', '玉溪市', '53', 'yuxishi', 'yxs', 'y', '530400', '0', '', '0877', '137');
INSERT INTO `qss_city` VALUES ('342', '昭通', '昭通市', '53', 'zhaotongshi', 'zts', 'z', '532100', '0', '', '0870', '238');
INSERT INTO `qss_city` VALUES ('343', '楚雄', '楚雄', '53', 'chuxiong', 'cx', 'c', '532300', '0', '', '0878', '222');
INSERT INTO `qss_city` VALUES ('344', '红河', '红河', '53', 'honghe', 'hh', 'h', '532500', '0', '', '0873', '42');
INSERT INTO `qss_city` VALUES ('345', '文山', '文山', '53', 'wenshan', 'ws', 'w', '532600', '0', '', '0876', '285');
INSERT INTO `qss_city` VALUES ('346', '普洱', '普洱', '53', 'simao', 'sm', 's', '532700', '0', '', '0879', '282');
INSERT INTO `qss_city` VALUES ('347', '西双版纳', '西双版纳', '53', 'xishuangbanna', 'xsbn', 'x', '532800', '0', '', '0691', '303');
INSERT INTO `qss_city` VALUES ('348', '大理', '大理', '53', 'dali', 'dl', 'd', '532900', '0', '', '0872', '248');
INSERT INTO `qss_city` VALUES ('349', '保山', '保山市', '53', 'baoshanshi', 'bss', 'b', '533000', '0', '', '0875', '208');
INSERT INTO `qss_city` VALUES ('350', '德宏', '德宏', '53', 'dehong', 'dh', 'd', '533100', '0', '', '0692', '266');
INSERT INTO `qss_city` VALUES ('351', '丽江', '丽江地区', '53', 'lijiangdiqu', 'ljdq', 'l', '533200', '0', '', '0888', '251');
INSERT INTO `qss_city` VALUES ('352', '怒江', '怒江', '53', 'nujiang', 'nj', 'n', '533300', '0', '', '0886', '308');
INSERT INTO `qss_city` VALUES ('353', '迪庆', '迪庆', '53', 'diqing', 'dq', 'd', '533400', '0', '', '0887', '294');
INSERT INTO `qss_city` VALUES ('354', '临沧', '临沧', '53', 'lincang', 'lc', 'l', '533500', '0', '', '0883', '999');
INSERT INTO `qss_city` VALUES ('355', '贵阳', '贵阳市', '54', 'guiyangshi', 'gys', 'g', '520100', '0', '', '0851', '124');
INSERT INTO `qss_city` VALUES ('356', '六盘水', '六盘水市', '54', 'liupanshuishi', 'lpss', 'l', '520200', '0', '', '0858', '32');
INSERT INTO `qss_city` VALUES ('357', '遵义', '遵义市', '54', 'zunyishi', 'zys', 'z', '520300', '0', '', '0852', '186');
INSERT INTO `qss_city` VALUES ('358', '铜仁', '铜仁', '54', 'tongren', 'tr', 't', '522200', '0', '', '0856', '272');
INSERT INTO `qss_city` VALUES ('359', '黔西南', '黔西南', '54', 'qianxinan', 'qxn', 'q', '522300', '0', '', '0859', '999');
INSERT INTO `qss_city` VALUES ('360', '毕节', '毕节', '54', 'bijie', 'bj', 'b', '522400', '0', '', '0857', '307');
INSERT INTO `qss_city` VALUES ('361', '安顺', '安顺', '54', 'anshun', 'as', 'a', '522500', '0', '', '0853', '999');
INSERT INTO `qss_city` VALUES ('362', '黔东南', '黔东南', '54', 'qiandongnan', 'qdn', 'q', '522600', '0', '', '0855', '241');
INSERT INTO `qss_city` VALUES ('363', '黔南', '黔南', '54', 'qiannan', 'qn', 'q', '522700', '0', '', '0854', '999');
INSERT INTO `qss_city` VALUES ('364', '银川', '银川市', '55', 'yinchuanshi', 'ycs', 'y', '640100', '0', '', '0951', '183');
INSERT INTO `qss_city` VALUES ('365', '石嘴山', '石嘴山市', '55', 'shizuishanshi', 'szss', 's', '640200', '0', '', '0952', '999');
INSERT INTO `qss_city` VALUES ('366', '吴忠', '吴忠市', '55', 'wuzhongshi', 'wzs', 'w', '640300', '0', '', '0953', '228');
INSERT INTO `qss_city` VALUES ('367', '固原', '固原市', '55', 'guyuanshi', 'gys', 'g', '642200', '0', '', '0954', '304');
INSERT INTO `qss_city` VALUES ('368', '海口', '海口市', '56', 'haikoushi', 'hks', 'h', '460100', '0', '', '0898', '51');
INSERT INTO `qss_city` VALUES ('369', '三亚', '三亚市', '56', 'sanyashi', 'sys', 's', '460200', '0', '', 'sanya', '50');
INSERT INTO `qss_city` VALUES ('370', '兰州', '兰州市', '57', 'lanzhoushi', 'lzs', 'l', '620100', '0', '', '0931', '154');
INSERT INTO `qss_city` VALUES ('371', '嘉峪关', '嘉峪关市', '57', 'jiayuguanshi', 'jygs', 'j', '620200', '0', '', '0937', '298');
INSERT INTO `qss_city` VALUES ('372', '金昌', '金昌市', '57', 'jinchangshi', 'jcs', 'j', '620300', '0', '', '0935', '999');
INSERT INTO `qss_city` VALUES ('373', '白银', '白银市', '57', 'baiyinshi', 'bys', 'b', '620400', '0', '', '0943', '999');
INSERT INTO `qss_city` VALUES ('374', '天水', '天水市', '57', 'tianshuishi', 'tss', 't', '620500', '0', '', '0938', '999');
INSERT INTO `qss_city` VALUES ('375', '酒泉', '酒泉市', '57', 'jiuquanshi', 'jqs', 'j', '622100', '0', '', 'jiuquan', '999');
INSERT INTO `qss_city` VALUES ('376', '张掖', '张掖市', '57', 'zhangyeshi', 'zys', 'z', '622200', '0', '', '0936', '999');
INSERT INTO `qss_city` VALUES ('377', '武威', '武威市', '57', 'wuweishi', 'wws', 'w', '622300', '0', '', 'wuwei', '299');
INSERT INTO `qss_city` VALUES ('378', '定西', '定西', '57', 'dingxi', 'dx', 'd', '622400', '0', '', '0932', '292');
INSERT INTO `qss_city` VALUES ('379', '陇南', '陇南', '57', 'longnan', 'ln', 'l', '622600', '0', '', '0939', '999');
INSERT INTO `qss_city` VALUES ('380', '平凉', '平凉市', '57', 'pingliangshi', 'pls', 'p', '622700', '0', '', '0933', '999');
INSERT INTO `qss_city` VALUES ('381', '庆阳', '庆阳市', '57', 'qingyangshi', 'qys', 'q', '622800', '0', '', '0934', '312');
INSERT INTO `qss_city` VALUES ('382', '临夏', '临夏', '57', 'linxia', 'lx', 'l', '622900', '0', '', '0930', '999');
INSERT INTO `qss_city` VALUES ('383', '甘南', '甘南', '57', 'gannan', 'gn', 'g', '623000', '0', '', '0941', '999');
INSERT INTO `qss_city` VALUES ('384', '呼和浩特', '呼和浩特市', '58', 'huhehaoteshi', 'hhhts', 'h', '150100', '0', '', '0471', '26');
INSERT INTO `qss_city` VALUES ('385', '包头', '包头市', '58', 'baotoushi', 'bts', 'b', '150200', '0', '', '0472', '52');
INSERT INTO `qss_city` VALUES ('386', '乌海', '乌海市', '58', 'wuhaishi', 'whs', 'w', '150300', '0', '', '0473', '999');
INSERT INTO `qss_city` VALUES ('387', '赤峰', '赤峰市', '58', 'chifengshi', 'cfs', 'c', '150400', '0', '', 'chifeng', '159');
INSERT INTO `qss_city` VALUES ('388', '呼伦贝尔', '呼伦贝尔市', '58', 'hulunbeiershi', 'hlbes', 'h', '152100', '0', '', '0470', '173');
INSERT INTO `qss_city` VALUES ('389', '兴安', '兴安盟', '58', 'xinganmeng', 'xam', 'x', '152200', '0', '', '0482', '309');
INSERT INTO `qss_city` VALUES ('390', '哲里木', '哲里木盟', '58', 'zhelimumeng', 'zlmm', 'z', '152300', '0', '', 'zhelimu', '300');
INSERT INTO `qss_city` VALUES ('391', '锡林郭勒', '锡林郭勒盟', '58', 'xilinguolemeng', 'xlglm', 'x', '152500', '0', '', '0479', '221');
INSERT INTO `qss_city` VALUES ('392', '乌兰察布', '乌兰察布盟', '58', 'wulanchabumeng', 'wlcbm', 'w', '152600', '0', '', '0474', '211');
INSERT INTO `qss_city` VALUES ('393', '鄂尔多斯', '鄂尔多斯', '58', 'eerduosi', 'eeds', 'e', '152700', '0', '', '0477', '49');
INSERT INTO `qss_city` VALUES ('394', '巴彦淖尔', '巴彦淖尔盟', '58', 'bayannaoermeng', 'bynem', 'b', '152800', '0', '', '0478', '37');
INSERT INTO `qss_city` VALUES ('395', '阿拉善', '阿拉善盟', '58', 'alashanmeng', 'alsm', 'a', '152900', '0', '', 'alashan', '301');
INSERT INTO `qss_city` VALUES ('403', '乌鲁木齐', '乌鲁木齐市', '59', 'wulumuqishi', 'wlmqs', 'w', '830000', '0', '', '0991', '72');
INSERT INTO `qss_city` VALUES ('404', '潜江', '潜江市', '39', 'qianjiangshi', 'qjs', 'q', '0', '0', '', '0728', '999');
INSERT INTO `qss_city` VALUES ('405', '随州', '随州市', '39', 'suizhoushi', 'szs', 's', '0', '0', '', '0722', '218');
INSERT INTO `qss_city` VALUES ('406', '亳州', '亳州市', '47', 'bozhoushi', 'bzs', 'b', '0', '0', '', '0558', '226');
INSERT INTO `qss_city` VALUES ('407', '拉萨', '拉萨市', '60', 'lasashi', 'lss', 'l', '0', '0', '', '0891', '999');
INSERT INTO `qss_city` VALUES ('408', '日喀则', '日喀则', '60', 'rikaze', 'rkz', 'r', '0', '0', '', '0892', '999');
INSERT INTO `qss_city` VALUES ('409', '山南', '山南', '60', 'shannan', 'sn', 's', '0', '0', '', '0893', '999');
INSERT INTO `qss_city` VALUES ('410', '林芝', '林芝', '60', 'linzhi', 'lz', 'l', '0', '0', '', '0894', '999');
INSERT INTO `qss_city` VALUES ('411', '昌都', '昌都', '60', 'changdu', 'cd', 'c', '0', '0', '', '0895', '999');
INSERT INTO `qss_city` VALUES ('412', '那曲', '那曲', '60', 'naqu', 'nq', 'n', '0', '0', '', '0896', '999');
INSERT INTO `qss_city` VALUES ('413', '阿里', '阿里', '60', 'ali', 'al', 'a', '0', '0', '', '0897', '999');
INSERT INTO `qss_city` VALUES ('414', '西宁', '西宁市', '61', 'xiningshi', 'xns', 'x', '0', '0', '', '0971', '245');
INSERT INTO `qss_city` VALUES ('415', '海东', '海东地区', '61', 'haidongdiqu', 'hddq', 'h', '0', '0', '', '0972', '325');
INSERT INTO `qss_city` VALUES ('416', '海北', '海北', '61', 'haibei', 'hb', 'h', '0', '0', '', '0970', '999');
INSERT INTO `qss_city` VALUES ('417', '黄南', '黄南', '61', 'huangnan', 'hn', 'h', '0', '0', '', '0973', '999');
INSERT INTO `qss_city` VALUES ('418', '海南州', '海南州', '61', 'hainanzhou', 'hnz', 'h', '0', '0', '', '0974', '999');
INSERT INTO `qss_city` VALUES ('419', '果洛', '果洛', '61', 'guoluo', 'gl', 'g', '0', '0', '', '0975', '999');
INSERT INTO `qss_city` VALUES ('420', '玉树', '玉树', '61', 'yushu', 'ys', 'y', '0', '0', '', '0976', '999');
INSERT INTO `qss_city` VALUES ('421', '海西', '海西', '61', 'haixi', 'hx', 'h', '0', '0', '', '0977', '321');
INSERT INTO `qss_city` VALUES ('422', '鹰潭', '鹰潭市', '46', 'yingtanshi', 'yts', 'y', '0', '0', '', '0701', '236');
INSERT INTO `qss_city` VALUES ('423', '天门', '天门市', '39', 'tianmenshi', 'tms', 't', '431700', '0', '', 'tianmen', '286');
INSERT INTO `qss_city` VALUES ('425', '克拉玛依', '克拉玛依市', '59', 'kelamayishi', 'klmys', 'k', '5555555', '0', '', '0990', '200');
INSERT INTO `qss_city` VALUES ('426', '吐鲁番', '吐鲁番地区', '59', 'tulufandiqu', 'tlfdq', 't', '0', '0', '', '0995', '999');
INSERT INTO `qss_city` VALUES ('427', '哈密', '哈密', '59', 'hami', 'hm', 'h', '0', '0', '', '0902', '317');
INSERT INTO `qss_city` VALUES ('428', '阿克苏', '阿克苏', '59', 'akesu', 'aks', 'a', '0', '0', '', '0997', '999');
INSERT INTO `qss_city` VALUES ('429', '喀什', '喀什', '59', 'kashi', 'ks', 'k', '0', '0', '', '0998', '297');
INSERT INTO `qss_city` VALUES ('430', '和田', '和田', '59', 'hetian', 'ht', 'h', '0', '0', '', '0903', '318');
INSERT INTO `qss_city` VALUES ('431', '阿勒泰', '阿勒泰', '59', 'aletai', 'alt', 'a', '0', '0', '', '0906', '254');
INSERT INTO `qss_city` VALUES ('433', '博尔塔拉', '博尔塔拉', '59', 'boertala', 'betl', 'b', '0', '0', '', '0909', '999');
INSERT INTO `qss_city` VALUES ('434', '巴音郭楞', '巴音郭楞', '59', 'bayinguoleng', 'bygl', 'b', '0', '0', '', '0996', '319');
INSERT INTO `qss_city` VALUES ('436', '伊犁', '伊犁', '59', 'yili', 'yl', 'y', '0', '0', '', '0992', '320');
INSERT INTO `qss_city` VALUES ('437', '重庆', '重庆市', '43', 'chongqingshi', 'cqs', 'c', '0', '1', '', 'cq', '20');
INSERT INTO `qss_city` VALUES ('438', '上海', '上海市', '16', 'shanghaishi', 'shs', 's', '0', '1', '', 'sh', '15');
INSERT INTO `qss_city` VALUES ('439', '北京', '北京市', '11', 'beijingshi', 'bjs', 'b', '0', '1', '', 'bj', '38');
INSERT INTO `qss_city` VALUES ('440', '天津', '天津市', '52', 'tianjinshi', 'tjs', 't', '0', '1', '', 'tj', '79');
INSERT INTO `qss_city` VALUES ('441', '五指山', '五指山市', '56', 'wuzhishanshi', 'wzss', 'w', '0', '0', '', 'wuzhishan', '296');
INSERT INTO `qss_city` VALUES ('442', '琼海', '琼海市', '56', 'qionghaishi', 'qhs', 'q', '0', '0', '', 'qionghai', '189');
INSERT INTO `qss_city` VALUES ('443', '儋州', '儋州市', '56', 'danzhoushi', 'dzs', 'd', '0', '0', '', '0890', '999');
INSERT INTO `qss_city` VALUES ('444', '文昌', '文昌市', '56', 'wenchangshi', 'wcs', 'w', '0', '0', '', 'wengchang', '999');
INSERT INTO `qss_city` VALUES ('445', '万宁', '万宁市', '56', 'wanningshi', 'wns', 'w', '0', '0', '', 'wangling', '276');
INSERT INTO `qss_city` VALUES ('446', '东方', '东方市', '56', 'dongfangshi', 'dfs', 'd', '0', '0', '', 'daongfan', '999');
INSERT INTO `qss_city` VALUES ('447', '澄迈', '澄迈县', '56', 'chengmaixian', 'cmx', 'c', '0', '0', '', 'chengmai', '999');
INSERT INTO `qss_city` VALUES ('448', '定安', '定安县', '56', 'dinganxian', 'dax', 'd', '0', '0', '', 'dingan', '999');
INSERT INTO `qss_city` VALUES ('449', '屯昌县', '屯昌县', '56', 'tunchangxian', 'tcx', 't', '0', '0', '', 'tunchang', '999');
INSERT INTO `qss_city` VALUES ('450', '临高县', '临高县', '56', 'lingaoxian', 'lgx', 'l', '0', '0', '', 'linggao', '999');
INSERT INTO `qss_city` VALUES ('451', '昌吉', '昌吉', '59', 'changji', 'cj', 'c', '0', '0', '', '0994', '240');
INSERT INTO `qss_city` VALUES ('454', '克孜勒苏柯尔克孜', '克孜勒苏柯尔克孜', '59', 'kezilesukeerkezi', 'kzlsk', 'k', '0', '0', '', '0908', '999');
INSERT INTO `qss_city` VALUES ('456', '石河子', '石河子市', '59', 'shihezishi', 'shzs', 's', '0', '0', '', '0993', '155');
INSERT INTO `qss_city` VALUES ('457', '阿拉尔', '阿拉尔市', '59', 'alaershi', 'ales', 'a', '0', '0', '', 'alaer', '999');
INSERT INTO `qss_city` VALUES ('458', '图木舒克', '图木舒克市', '59', 'tumushukeshi', 'tmsks', 't', '0', '0', '', 'tumusuke', '999');
INSERT INTO `qss_city` VALUES ('459', '五家渠', '五家渠市', '59', 'wujiaqushi', 'wjqs', 'w', '0', '0', '', 'wujiaqu', '295');
INSERT INTO `qss_city` VALUES ('460', '济源', '济源市', '38', 'jiyuanshi', 'jys', 'j', '419001', '0', '', '0391', '0');
INSERT INTO `qss_city` VALUES ('461', '梅河口', '梅河口市', '49', 'meihekoushi', 'mhks', 'm', '135000', '0', '', '0435', '0');

-- ----------------------------
-- Table structure for qss_log
-- ----------------------------
DROP TABLE IF EXISTS `qss_log`;
CREATE TABLE `qss_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `type` int(10) NOT NULL COMMENT '类型 0:用户,1:管理员,2:系统(即定时脚本)',
  `operate_by` int(10) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `op_type` int(10) NOT NULL COMMENT '操作类型',
  `data` text NOT NULL COMMENT '日志内容',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志记录表';

-- ----------------------------
-- Records of qss_log
-- ----------------------------

-- ----------------------------
-- Table structure for qss_message
-- ----------------------------
DROP TABLE IF EXISTS `qss_message`;
CREATE TABLE `qss_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `type` int(10) NOT NULL DEFAULT '1' COMMENT '类型 0:给用户,1:给理员',
  `mess_for` int(10) NOT NULL COMMENT '用户ID/管理员ID',
  `data` text NOT NULL COMMENT '消息内容',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未读,1:已读',
  `send_time` int(10) NOT NULL COMMENT '发送时间',
  `read_time` int(10) NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统消息表';

-- ----------------------------
-- Records of qss_message
-- ----------------------------

-- ----------------------------
-- Table structure for qss_province
-- ----------------------------
DROP TABLE IF EXISTS `qss_province`;
CREATE TABLE `qss_province` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `name` varchar(5) NOT NULL COMMENT '名字 ',
  `full_spell` varchar(20) NOT NULL COMMENT '全拼 ',
  `short_spell` varchar(5) NOT NULL COMMENT '简拼 ',
  `first_char` varchar(1) NOT NULL COMMENT '首字母 ',
  `municipality` int(10) NOT NULL COMMENT '是否直辖市0不是1是:北京上海天津重庆为1',
  `domain` varchar(10) NOT NULL COMMENT '域名 ',
  `display_order` int(10) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='省份表';

-- ----------------------------
-- Records of qss_province
-- ----------------------------
INSERT INTO `qss_province` VALUES ('11', '北京', 'beijing', 'bj', 'b', '1', 'bj', '21');
INSERT INTO `qss_province` VALUES ('12', '福建', 'fujian', 'fj', 'f', '0', 'fjcar', '2');
INSERT INTO `qss_province` VALUES ('13', '广东', 'guangdong', 'gd', 'g', '0', 'gd', '3');
INSERT INTO `qss_province` VALUES ('14', '江苏', 'jiangsu', 'js', 'j', '0', 'js', '4');
INSERT INTO `qss_province` VALUES ('15', '山东', 'shandong', 'sd', 's', '0', 'sd', '11');
INSERT INTO `qss_province` VALUES ('16', '上海', 'shanghai', 'sh', 's', '1', 'sh', '8');
INSERT INTO `qss_province` VALUES ('17', '四川', 'sichuan', 'sc', 's', '0', 'sc', '13');
INSERT INTO `qss_province` VALUES ('18', '浙江', 'zhejiang', 'zj', 'z', '0', 'zj', '1');
INSERT INTO `qss_province` VALUES ('35', '广西', 'guangxi', 'gx', 'g', '0', 'gx', '10');
INSERT INTO `qss_province` VALUES ('37', '河北', 'hebei', 'hb', 'h', '0', 'hebei', '19');
INSERT INTO `qss_province` VALUES ('38', '河南', 'henan', 'hn', 'h', '0', 'henan', '9');
INSERT INTO `qss_province` VALUES ('39', '湖北', 'hubei', 'hb', 'h', '0', 'hb', '6');
INSERT INTO `qss_province` VALUES ('40', '湖南', 'hunan', 'hn', 'h', '0', 'hn', '14');
INSERT INTO `qss_province` VALUES ('43', '重庆', 'chongqing', 'cq', 'c', '1', 'cq', '15');
INSERT INTO `qss_province` VALUES ('44', '山西', 'shanxi', 'sx', 's', '0', 'sx', '20');
INSERT INTO `qss_province` VALUES ('45', '陕西', 'shanxi', 'sx', 's', '0', 'shannxi', '22');
INSERT INTO `qss_province` VALUES ('46', '江西', 'jiangxi', 'jx', 'j', '0', 'jx', '5');
INSERT INTO `qss_province` VALUES ('47', '安徽', 'anhui', 'ah', 'a', '0', 'ah', '17');
INSERT INTO `qss_province` VALUES ('48', '黑龙江', 'heilongjiang', 'hlj', 'h', '0', 'hlj', '24');
INSERT INTO `qss_province` VALUES ('49', '吉林', 'jilin', 'jl', 'j', '0', 'jl', '27');
INSERT INTO `qss_province` VALUES ('50', '辽宁', 'liaoning', 'ln', 'l', '0', 'ln', '23');
INSERT INTO `qss_province` VALUES ('52', '天津', 'tianjin', 'tj', 't', '1', 'tj', '26');
INSERT INTO `qss_province` VALUES ('53', '云南', 'yunnan', 'yn', 'y', '0', 'yn', '7');
INSERT INTO `qss_province` VALUES ('54', '贵州', 'guizhou', 'gz', 'g', '0', 'guizhou', '16');
INSERT INTO `qss_province` VALUES ('55', '宁夏', 'ningxia', 'nx', 'n', '0', 'nx', '29');
INSERT INTO `qss_province` VALUES ('56', '海南', 'hainan', 'hn', 'h', '0', 'hainan', '18');
INSERT INTO `qss_province` VALUES ('57', '甘肃', 'gansu', 'gs', 'g', '0', 'gs', '28');
INSERT INTO `qss_province` VALUES ('58', '内蒙古', 'neimenggu', 'nmg', 'n', '0', 'nmg', '12');
INSERT INTO `qss_province` VALUES ('59', '新疆', 'xinjiang', 'xj', 'x', '0', 'xj', '25');
INSERT INTO `qss_province` VALUES ('60', '西藏', 'xicang', 'xc', 'x', '0', 'xz', '31');
INSERT INTO `qss_province` VALUES ('61', '青海', 'qinghai', 'qh', 'q', '0', 'qh', '30');

-- ----------------------------
-- Table structure for qss_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `qss_questionnaire`;
CREATE TABLE `qss_questionnaire` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `title` varchar(255) NOT NULL COMMENT '问卷名称',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '问卷类型 0:其他,1:心理,2:生活,3:情感,4:科技,5:企业,6:产品,7:教育',
  `user_id` int(10) NOT NULL COMMENT '所属用户ID',
  `need_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要登陆',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '问卷状态  1:草稿,2:发布中，3:关闭',
  `url` varchar(255) DEFAULT NULL COMMENT '问卷外链',
  `info` text COMMENT '其他信息',
  `post_type` int(10) NOT NULL DEFAULT '0' COMMENT '提交类型 0:不限制,1:一个用户一次,2:一个IP一次',
  `post_time` int(10) NOT NULL DEFAULT '0' COMMENT '参与次数',
  `end_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不限制,1:份数,2:时间',
  `start_time` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `end_count` int(10) DEFAULT NULL COMMENT '结束次数',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='问卷表';

-- ----------------------------
-- Records of qss_questionnaire
-- ----------------------------
INSERT INTO `qss_questionnaire` VALUES ('1', '测试1', '0', '1', '1', '2', '/Home/Questionnaire/Index/ps/BfoupUBBBa+@4rj2YT3soLCcJYkWYMvby53V', '阿阿大使大赛阿萨德阿萨德阿斯蒂芬是', '1', '4', '2', '1429718400', '1490284800', '0', '1429790508', '1432031080');
INSERT INTO `qss_questionnaire` VALUES ('2', '测试2', '5', '2', '1', '1', null, '阿萨德发更好讨人厌他人意见刚回家刚回家', '0', '1', '2', '1432742400', '1432742400', '45', '1429790542', '1432039062');
INSERT INTO `qss_questionnaire` VALUES ('3', '测试3', '1', '5', '1', '1', null, '', '0', '0', '1', '0', '0', '32', '1429790756', '0');
INSERT INTO `qss_questionnaire` VALUES ('4', '据阿萨德', '7', '6', '1', '1', null, '小城镇试点防守对方阿斯蒂芬暗示!', '1', '0', '2', '1430150400', '1437494400', '0', '1429790785', '1432017896');
INSERT INTO `qss_questionnaire` VALUES ('6', '格瑞特二万人', '2', '2', '1', '1', null, '下车vsf给我答复个', '2', '0', '2', '1429718400', '1430323200', '0', '1429790830', '0');
INSERT INTO `qss_questionnaire` VALUES ('11', '大学生就业意向调查问卷', '7', '1', '0', '2', '/Home/Questionnaire/Index/ps/U@988hJCDKO@4rjqfTjroreeJoUcY9HOzJDRsA', '我们正在进行一项关于大学生就业的调查，想邀请您用几分钟时间帮忙填答这份问卷。本问卷实行匿名制，所有数据只用于统计分析， 请您放心填写。题目选项无对错之分，请您按自己的实际情况填写。谢谢您的帮助。', '2', '0', '1', '0', '0', '1000', '1432026713', '1432028247');
INSERT INTO `qss_questionnaire` VALUES ('12', '测试2', '3', '1', '1', '1', null, '阿萨德发送sadfji阿斯蒂芬', '1', '2', '2', '1429804800', '1430323200', '0', '1432028892', '0');
INSERT INTO `qss_questionnaire` VALUES ('13', 'sfasdf', '0', '1', '0', '1', null, 'asdfsadf', '0', '0', '0', '0', '0', '0', '1432110367', '0');

-- ----------------------------
-- Table structure for qss_questions
-- ----------------------------
DROP TABLE IF EXISTS `qss_questions`;
CREATE TABLE `qss_questions` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `type_id` int(10) NOT NULL DEFAULT '0' COMMENT '题型ID',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `qtn_id` int(10) NOT NULL COMMENT '问卷ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `data` text COMMENT '选项等格式为json串',
  `is_require` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:必填,0:可空',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='问题表';

-- ----------------------------
-- Records of qss_questions
-- ----------------------------
INSERT INTO `qss_questions` VALUES ('2', '2', '1', '1', '你觉得大学哪些课程比较有意思呢，线性代数？小鸭子找妈妈？数据挖掘？还是马克思？', '{\"id\":\"2\",\"tid\":\"2\",\"type\":\"multiChose\",\"description\":\"\\u4f60\\u89c9\\u5f97\\u5927\\u5b66\\u54ea\\u4e9b\\u8bfe\\u7a0b\\u6bd4\\u8f83\\u6709\\u610f\\u601d\\u5462\\uff0c\\u7ebf\\u6027\\u4ee3\\u6570\\uff1f\\u5c0f\\u9e2d\\u5b50\\u627e\\u5988\\u5988\\uff1f\\u6570\\u636e\\u6316\\u6398\\uff1f\\u8fd8\\u662f\\u9a6c\\u514b\\u601d\\uff1f\",\"option\":[\"\\u7ebf\\u6027\\u4ee3\\u6570\",\"\\u5c0f\\u9e2d\\u5b50\\u627e\\u5988\\u5988\",\"\\u6570\\u636e\\u6316\\u6398\",\"\\u9a6c\\u514b\\u601d\\u4e3b\\u4e49\"]}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('3', '3', '1', '1', '请你对自己的外表打分。满分10分哦', '{\"id\":\"3\",\"tid\":\"3\",\"type\":\"grade\",\"description\":\"\\u8bf7\\u4f60\\u5bf9\\u81ea\\u5df1\\u7684\\u5916\\u8868\\u6253\\u5206\\u3002\\u6ee1\\u520610\\u5206\\u54e6\",\"range\":\"10\"}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('4', '4', '1', '1', '请用一句话概括你大学四年的感受！', '{\"id\":\"4\",\"tid\":\"4\",\"type\":\"singleLine\",\"description\":\"\\u8bf7\\u7528\\u4e00\\u53e5\\u8bdd\\u6982\\u62ec\\u4f60\\u5927\\u5b66\\u56db\\u5e74\\u7684\\u611f\\u53d7\\uff01\"}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('5', '5', '1', '1', '请简述麻麻和女盆友掉水里了，你要先救谁。字数内容不应少于50个字。只且只能先救一个。并说明为什么先救她，为什么不先救她。内容控制在200字以内。字体采用系统默认字体即可。', '{\"id\":\"5\",\"tid\":\"5\",\"type\":\"multiLine\",\"description\":\"\\u8bf7\\u7b80\\u8ff0\\u9ebb\\u9ebb\\u548c\\u5973\\u76c6\\u53cb\\u6389\\u6c34\\u91cc\\u4e86\\uff0c\\u4f60\\u8981\\u5148\\u6551\\u8c01\\u3002\\u5b57\\u6570\\u5185\\u5bb9\\u4e0d\\u5e94\\u5c11\\u4e8e50\\u4e2a\\u5b57\\u3002\\u53ea\\u4e14\\u53ea\\u80fd\\u5148\\u6551\\u4e00\\u4e2a\\u3002\\u5e76\\u8bf4\\u660e\\u4e3a\\u4ec0\\u4e48\\u5148\\u6551\\u5979\\uff0c\\u4e3a\\u4ec0\\u4e48\\u4e0d\\u5148\\u6551\\u5979\\u3002\\u5185\\u5bb9\\u63a7\\u5236\\u5728200\\u5b57\\u4ee5\\u5185\\u3002\\u5b57\\u4f53\\u91c7\\u7528\\u7cfb\\u7edf\\u9ed8\\u8ba4\\u5b57\\u4f53\\u5373\\u53ef\\u3002\"}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('28', '7', '1', '1', '无', '{\"id\":\"28\",\"tid\":\"7\",\"type\":\"name\"}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('29', '9', '1', '1', '无', '{\"id\":\"29\",\"tid\":\"9\",\"type\":\"phone\"}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('30', '1', '1', '1', '本题将按如下规则给分。根据所有提交的问卷。将问卷两份为一组，分为若干组。一组中一方选A一方选B则选A的不得分，选B的得20分。两方都选了A则各得10分。两方都选了B则都得0分。', '{\"id\":\"30\",\"tid\":\"1\",\"type\":\"singleChose\",\"sType\":\"0\",\"description\":\"\\u672c\\u9898\\u5c06\\u6309\\u5982\\u4e0b\\u89c4\\u5219\\u7ed9\\u5206\\u3002\\u6839\\u636e\\u6240\\u6709\\u63d0\\u4ea4\\u7684\\u95ee\\u5377\\u3002\\u5c06\\u95ee\\u5377\\u4e24\\u4efd\\u4e3a\\u4e00\\u7ec4\\uff0c\\u5206\\u4e3a\\u82e5\\u5e72\\u7ec4\\u3002\\u4e00\\u7ec4\\u4e2d\\u4e00\\u65b9\\u9009A\\u4e00\\u65b9\\u9009B\\u5219\\u9009A\\u7684\\u4e0d\\u5f97\\u5206\\uff0c\\u9009B\\u7684\\u5f9720\\u5206\\u3002\\u4e24\\u65b9\\u90fd\\u9009\\u4e86A\\u5219\\u5404\\u5f9710\\u5206\\u3002\\u4e24\\u65b9\\u90fd\\u9009\\u4e86B\\u5219\\u90fd\\u5f970\\u5206\\u3002\",\"option\":[\"\\u6211\\u662f\\u9009\\u9879A\",\"\\u6211\\u662f\\u9009\\u9879B\"]}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('31', '8', '1', '1', '无', '{\"id\":\"0\",\"tid\":\"8\",\"type\":\"sex\"}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('32', '10', '1', '1', '无', '{\"id\":\"0\",\"tid\":\"10\",\"type\":\"email\"}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('33', '11', '1', '1', '无', '{\"id\":\"0\",\"tid\":\"11\",\"type\":\"birthday\"}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('34', '12', '1', '1', '无', '{\"id\":\"0\",\"tid\":\"12\",\"type\":\"city\"}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('35', '13', '1', '1', '无', '{\"id\":\"0\",\"tid\":\"13\",\"type\":\"address\"}', '1', '1431659470', '0');
INSERT INTO `qss_questions` VALUES ('40', '2', '1', '6', '阿发送方撒旦发射点发艾丝凡', '{\"id\":\"40\",\"tid\":\"2\",\"type\":\"multiChose\",\"description\":\"\\u963f\\u53d1\\u9001\\u65b9\\u6492\\u65e6\\u53d1\\u5c04\\u70b9\\u53d1\\u827e\\u4e1d\\u51e1\",\"option\":[\"\\u963f\\u8428\\u5fb7\\u53d1\\u9001\\u5230\",\"\\u6492\\u65e6\\u53d1\\u9001\\u65b9\\u65af\\u8482\\u82ac\"]}', '1', '1432003175', '0');
INSERT INTO `qss_questions` VALUES ('41', '3', '1', '6', 'asdfasdfasdfasdf', '{\"id\":\"41\",\"tid\":\"3\",\"type\":\"grade\",\"description\":\"asdfasdfasdfasdf\",\"range\":\"22\"}', '1', '1432003175', '0');
INSERT INTO `qss_questions` VALUES ('42', '3', '1', '6', 'asdfasdfasdfasdf', '{\"id\":\"42\",\"tid\":\"3\",\"type\":\"grade\",\"description\":\"asdfasdfasdfasdf\",\"range\":\"22\"}', '1', '1432003175', '0');
INSERT INTO `qss_questions` VALUES ('44', '4', '1', '6', 'asdfasdf', '{\"id\":\"0\",\"tid\":\"4\",\"type\":\"singleLine\",\"description\":\"asdfasdf\"}', '1', '1432003175', '0');
INSERT INTO `qss_questions` VALUES ('45', '1', '5', '3', 'wrqwerqwerwqr', '{\"id\":\"0\",\"tid\":\"1\",\"type\":\"singleChose\",\"sType\":\"0\",\"description\":\"wrqwerqwerwqr\",\"option\":[\"qwerqwer\",\"qwer\"]}', '1', '1432017450', '0');
INSERT INTO `qss_questions` VALUES ('46', '2', '5', '3', 'qwerqwer', '{\"id\":\"0\",\"tid\":\"2\",\"type\":\"multiChose\",\"description\":\"qwerqwer\",\"option\":[\"qwerq\",\"wweqrqwe\"]}', '1', '1432017450', '0');
INSERT INTO `qss_questions` VALUES ('47', '4', '5', '3', 'qwerqwer', '{\"id\":\"0\",\"tid\":\"4\",\"type\":\"singleLine\",\"description\":\"qwerqwer\"}', '1', '1432017450', '0');
INSERT INTO `qss_questions` VALUES ('48', '1', '5', '3', 'wrqwerqwerwqr', '{\"id\":\"0\",\"tid\":\"1\",\"type\":\"singleChose\",\"sType\":\"0\",\"description\":\"wrqwerqwerwqr\",\"option\":[\"qwerqwer\",\"qwer\"]}', '1', '1432017459', '0');
INSERT INTO `qss_questions` VALUES ('49', '2', '5', '3', 'qwerqwer', '{\"id\":\"0\",\"tid\":\"2\",\"type\":\"multiChose\",\"description\":\"qwerqwer\",\"option\":[\"qwerq\",\"wweqrqwe\"]}', '1', '1432017459', '0');
INSERT INTO `qss_questions` VALUES ('50', '4', '5', '3', 'qwerqwer', '{\"id\":\"0\",\"tid\":\"4\",\"type\":\"singleLine\",\"description\":\"qwerqwer\"}', '1', '1432017459', '0');
INSERT INTO `qss_questions` VALUES ('51', '7', '1', '11', '无', '{\"id\":\"51\",\"tid\":\"7\",\"type\":\"name\"}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('52', '8', '1', '11', '无', '{\"id\":\"52\",\"tid\":\"8\",\"type\":\"sex\"}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('53', '9', '1', '11', '无', '{\"id\":\"53\",\"tid\":\"9\",\"type\":\"phone\"}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('54', '10', '1', '11', '无', '{\"id\":\"54\",\"tid\":\"10\",\"type\":\"email\"}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('55', '11', '1', '11', '无', '{\"id\":\"55\",\"tid\":\"11\",\"type\":\"birthday\"}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('56', '12', '1', '11', '无', '{\"id\":\"56\",\"tid\":\"12\",\"type\":\"city\"}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('57', '1', '1', '11', '以下哪项描述符合你毕业后的去向安排？', '{\"id\":\"57\",\"tid\":\"1\",\"type\":\"singleChose\",\"sType\":\"0\",\"description\":\"\\u4ee5\\u4e0b\\u54ea\\u9879\\u63cf\\u8ff0\\u7b26\\u5408\\u4f60\\u6bd5\\u4e1a\\u540e\\u7684\\u53bb\\u5411\\u5b89\\u6392\\uff1f\",\"option\":[\" \\u5c31\\u4e1a\",\"\\u81ea\\u4e3b\\u521b\\u4e1a\",\"\\u8003\\u7814\",\"\\u51fa\\u56fd\\u7559\\u5b66\",\"\\u5bb6\\u91cc\\u8e72\"]}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('58', '4', '1', '11', '你希望在哪个城市就业？', '{\"id\":\"58\",\"tid\":\"4\",\"type\":\"singleLine\",\"description\":\"\\u4f60\\u5e0c\\u671b\\u5728\\u54ea\\u4e2a\\u57ce\\u5e02\\u5c31\\u4e1a\\uff1f\"}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('59', '1', '1', '11', '你首选的就业方向是？', '{\"id\":\"59\",\"tid\":\"1\",\"type\":\"singleChose\",\"sType\":\"0\",\"description\":\"\\u4f60\\u9996\\u9009\\u7684\\u5c31\\u4e1a\\u65b9\\u5411\\u662f\\uff1f\",\"option\":[\"\\u653f\\u5e9c\\u673a\\u5173\",\"\\u5b66\\u6821\\u53ca\\u79d1\\u7814\\u7814\\u7a76\\u6240\",\"\\u5176\\u4ed6\\u4e8b\\u4e1a\\u5355\\u4f4d\",\"\\u56fd\\u6709\\u4f01\\u4e1a\",\"\\u5916\\u8d44\\u4f01\\u4e1a\",\"\\u6c11\\u8425\\u4f01\\u4e1a\",\"\\u90e8\\u961f\",\"\\u81ea\\u4e3b\\u521b\\u4e1a\",\"\\u5176\\u4ed6\"]}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('60', '1', '1', '11', '你期望的月薪是？', '{\"id\":\"60\",\"tid\":\"1\",\"type\":\"singleChose\",\"sType\":\"0\",\"description\":\"\\u4f60\\u671f\\u671b\\u7684\\u6708\\u85aa\\u662f\\uff1f\",\"option\":[\" 2000\\u5143\\u53ca\\u4ee5\\u4e0b\",\" 2001-3000\\u5143\",\"3001-5000\\u5143\",\"5001-8000\\u5143\",\"8001-12000\\u5143\",\"12000\\u5143\\u4ee5\\u4e0a\"]}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('61', '2', '1', '11', '你认为影响你自己就业的因素有哪些？', '{\"id\":\"61\",\"tid\":\"2\",\"type\":\"multiChose\",\"description\":\"\\u4f60\\u8ba4\\u4e3a\\u5f71\\u54cd\\u4f60\\u81ea\\u5df1\\u5c31\\u4e1a\\u7684\\u56e0\\u7d20\\u6709\\u54ea\\u4e9b\\uff1f\",\"option\":[\"\\u5b66\\u6821\\u77e5\\u540d\\u5ea6\",\"\\u4e13\\u4e1a\\u77e5\\u8bc6\",\" \\u5b9e\\u8df5\\u548c\\u5de5\\u4f5c\\u7ecf\\u9a8c\",\" \\u793e\\u4f1a\\u5173\\u7cfb\",\"\\u6c9f\\u901a\\u8868\\u8fbe\\u80fd\\u529b\",\"\\u5916\\u8868\\u5f62\\u8c61\",\"\\u5b66\\u79d1\\u4f18\\u52bf\",\"\\u65e0\\u4efb\\u4f55\\u5f71\\u54cd\",\"\\u5176\\u4ed6\"]}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('62', '2', '1', '11', '你择业时会选择哪些途径获取招聘信息？', '{\"id\":\"62\",\"tid\":\"2\",\"type\":\"multiChose\",\"description\":\"\\u4f60\\u62e9\\u4e1a\\u65f6\\u4f1a\\u9009\\u62e9\\u54ea\\u4e9b\\u9014\\u5f84\\u83b7\\u53d6\\u62db\\u8058\\u4fe1\\u606f\\uff1f\",\"option\":[\" \\u62a5\\u7eb8\\u671f\\u520a\",\"\\u5b66\\u6821\\u5c31\\u4e1a\\u7f51\",\"\\u5355\\u4f4d\\u7f51\\u7ad9\\u548c\\u5ba3\\u4f20\\u518c\",\" \\u4eb2\\u621a\\u670b\\u53cb\\u4ecb\\u7ecd\",\"\\u62db\\u8058\\u4f1a\",\" \\u5bfc\\u5e08\\u63a8\\u8350\",\"\\u5176\\u4ed6\"]}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('75', '2', '1', '11', '你倾向于如何在应聘过程中突显自己', '{\"id\":\"75\",\"tid\":\"2\",\"type\":\"multiChose\",\"description\":\"\\u4f60\\u503e\\u5411\\u4e8e\\u5982\\u4f55\\u5728\\u5e94\\u8058\\u8fc7\\u7a0b\\u4e2d\\u7a81\\u663e\\u81ea\\u5df1\",\"option\":[\"\\u5236\\u4f5c\\u7cbe\\u7f8e\\u3001\\u8be6\\u5c3d\\u7684\\u81ea\\u8350\\u6750\\u6599\",\"\\u901a\\u8fc7\\u76f4\\u63a5\\u6c9f\\u901a\\u8363\\u62db\\u8058\\u8005\\u8bb0\\u4f4f\\u81ea\\u5df1\",\"\\u9762\\u8bd5\\u65f6\\u5728\\u7740\\u88c5\\u5f62\\u8c61\\u4eea\\u8868\\u65b9\\u9762\\u4e0b\\u529f\\u592b\",\" \\u8bf7\\u6709\\u4fe1\\u8a89\\u5a01\\u671b\\u7684\\u4eba\\u63a8\\u8350\\u81ea\\u5df1\",\"\\u4e8b\\u5148\\u5145\\u5206\\u4e86\\u89e3\\u5355\\u4f4d\\uff0c\\u8868\\u793a\\u81ea\\u5df1\\u6709\\u5145\\u5206\\u7684\\u5174\\u8da3\\u548c\\u51c6\\u5907\",\"\\u7a81\\u51fa\\u81ea\\u5df1\\u7684\\u7279\\u957f\\uff0c\\u8868\\u793a\\u81ea\\u5df1\\u5b8c\\u5168\\u80fd\\u80dc\\u4efb\\u62db\\u8058\\u5c97\\u4f4d\\u7684\\u9700\\u6c42\",\"\\u7a81\\u51fa\\u81ea\\u5df1\\u7684\\u5b66\\u4e60\\u80fd\\u529b\\u548c\\u7efc\\u5408\\u7d20\\u8d28\\uff0c\\u8868\\u73b0\\u81ea\\u5df1\\u5c06\\u662f\\u53ef\\u5851\\u4e4b\\u624d\",\"\\u7a81\\u51fa\\u81ea\\u5df1\\u7684\\u6027\\u683c\\uff0c\\u8868\\u73b0\\u81ea\\u5df1\\u80fd\\u591f\\u548c\\u5355\\u4f4d\\u540c\\u4e8b\\u76f8\\u5904\\u6109\\u5feb\",\"\\u5176\\u4ed6\"]}', '1', '1432028246', '0');
INSERT INTO `qss_questions` VALUES ('76', '1', '1', '11', '你认为求职中最困扰你的是？', '{\"id\":\"76\",\"tid\":\"1\",\"type\":\"singleChose\",\"sType\":\"0\",\"description\":\"\\u4f60\\u8ba4\\u4e3a\\u6c42\\u804c\\u4e2d\\u6700\\u56f0\\u6270\\u4f60\\u7684\\u662f\\uff1f\",\"option\":[\"\\u4e13\\u4e1a\\u4e0d\\u5bf9\\u53e3\",\"\\u5c31\\u4e1a\\u4fe1\\u606f\\u4e0d\\u8db3\",\"\\u5c31\\u4e1a\\u653f\\u7b56\\u9650\\u5236\",\"\\u7f3a\\u4e4f\\u5b9e\\u8df5\\u548c\\u5de5\\u4f5c\\u7ecf\\u9a8c\",\"\\u7f3a\\u4e4f\\u793e\\u4f1a\\u5173\\u7cfb\",\"\\u4e0d\\u516c\\u5e73\\u7ade\\u4e89\\u5982\\u6237\\u7c4d\\u6027\\u522b\\u6b67\\u89c6\",\"\\u5176\\u4ed6\"]}', '1', '1432028246', '0');

-- ----------------------------
-- Table structure for qss_ques_for_templet
-- ----------------------------
DROP TABLE IF EXISTS `qss_ques_for_templet`;
CREATE TABLE `qss_ques_for_templet` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `type_id` int(10) NOT NULL DEFAULT '0' COMMENT '题型ID',
  `temp_id` int(10) NOT NULL COMMENT '模版ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `data` text COMMENT '选项等格式为json串',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模版问题表';

-- ----------------------------
-- Records of qss_ques_for_templet
-- ----------------------------

-- ----------------------------
-- Table structure for qss_ques_post
-- ----------------------------
DROP TABLE IF EXISTS `qss_ques_post`;
CREATE TABLE `qss_ques_post` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `qtn_id` int(10) NOT NULL COMMENT '问卷ID',
  `ques_id` int(10) NOT NULL DEFAULT '0' COMMENT '问题ID',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `data` text COMMENT '提交内容json串',
  `post_ip` varchar(30) NOT NULL COMMENT '提交IP',
  `post_time` int(10) NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='问卷提交表';

-- ----------------------------
-- Records of qss_ques_post
-- ----------------------------
INSERT INTO `qss_ques_post` VALUES ('1', '1', '2', '2', '{\"id\":\"2\",\"tid\":\"2\",\"type\":\"multiChose\",\"val\":[\"1\",\"2\"]}', '127.0.0.1', '1431951669');
INSERT INTO `qss_ques_post` VALUES ('2', '1', '3', '2', '{\"id\":\"3\",\"tid\":\"3\",\"type\":\"grade\",\"val\":\"8\"}', '127.0.0.1', '1431951669');
INSERT INTO `qss_ques_post` VALUES ('3', '1', '4', '2', '{\"id\":\"4\",\"tid\":\"4\",\"type\":\"singleLine\",\"val\":\"\\u5176\\u5b9e\\u90fd\\u6ca1\\u6709\"}', '127.0.0.1', '1431951669');
INSERT INTO `qss_ques_post` VALUES ('4', '1', '5', '2', '{\"id\":\"5\",\"tid\":\"5\",\"type\":\"multiLine\",\"val\":\"\\u90fd\\u4e0d\\u6551\\u5427\\uff01\\u56e0\\u4e3a\\u6211\\u4e0d\\u4f1a\\u6e38\\u6cf3\\uff01\\u5475\\u5475\\uff01\\uff01\\uff01\"}', '127.0.0.1', '1431951669');
INSERT INTO `qss_ques_post` VALUES ('5', '1', '28', '2', '{\"id\":\"28\",\"tid\":\"7\",\"type\":\"name\",\"val\":\"\\u90d1\\u5251\\u5cf0\"}', '127.0.0.1', '1431951669');
INSERT INTO `qss_ques_post` VALUES ('6', '1', '29', '2', '{\"id\":\"29\",\"tid\":\"9\",\"type\":\"phone\",\"val\":\"18650346179\"}', '127.0.0.1', '1431951669');
INSERT INTO `qss_ques_post` VALUES ('7', '1', '30', '2', '{\"id\":\"30\",\"tid\":\"1\",\"type\":\"singleChose\",\"val\":\"1\"}', '127.0.0.1', '1431951670');
INSERT INTO `qss_ques_post` VALUES ('8', '1', '31', '2', '{\"id\":\"31\",\"tid\":\"8\",\"type\":\"sex\",\"val\":\"on\"}', '127.0.0.1', '1431951670');
INSERT INTO `qss_ques_post` VALUES ('9', '1', '32', '2', '{\"id\":\"32\",\"tid\":\"10\",\"type\":\"email\",\"val\":\"mail@codiy.net\"}', '127.0.0.1', '1431951670');
INSERT INTO `qss_ques_post` VALUES ('10', '1', '33', '2', '{\"id\":\"33\",\"tid\":\"11\",\"type\":\"birthday\",\"val\":\"1992-06-12\"}', '127.0.0.1', '1431951670');
INSERT INTO `qss_ques_post` VALUES ('11', '1', '34', '2', '{\"id\":\"34\",\"tid\":\"12\",\"type\":\"city\",\"pid\":\"12\",\"cid\":\"1\"}', '127.0.0.1', '1431951670');
INSERT INTO `qss_ques_post` VALUES ('12', '1', '35', '2', '{\"id\":\"35\",\"tid\":\"13\",\"type\":\"address\",\"val\":\"\\u95fd\\u4faf\\u4e0a\\u8857\\u5927\\u5b66\\u57ce\"}', '127.0.0.1', '1431951670');

-- ----------------------------
-- Table structure for qss_ques_type
-- ----------------------------
DROP TABLE IF EXISTS `qss_ques_type`;
CREATE TABLE `qss_ques_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `name` varchar(30) NOT NULL COMMENT '题型名称',
  `data` text COMMENT '选项等格式为json串',
  `spell` varchar(30) NOT NULL COMMENT '类型英文字符',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 0:普通题，1:快速题，2:特殊题',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `need_level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '需要的VIP等级',
  `admin_id` int(10) NOT NULL COMMENT '管理员ID',
  `color` varchar(30) DEFAULT NULL COMMENT '代表该题型的颜色',
  `icon` varchar(30) DEFAULT NULL COMMENT '代表该题型的图标',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='问题类型表';

-- ----------------------------
-- Records of qss_ques_type
-- ----------------------------
INSERT INTO `qss_ques_type` VALUES ('1', '普通单选题', null, 'singleChose', '0', '1', '0', '1', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('2', '普通多选题', null, 'multiChose', '0', '1', '0', '1', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('3', '程度打分题', null, 'grade', '0', '1', '0', '1', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('4', '单行填空题', null, 'singleLine', '0', '1', '0', '1', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('5', '多行填空题', null, 'multiLine', '0', '1', '0', '1', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('6', '文件上传题', null, 'fileUp', '0', '0', '0', '1', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('7', '姓名', null, 'name', '1', '1', '0', '1', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('8', '性别', null, 'sex', '1', '1', '0', '0', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('9', '手机', null, 'phone', '1', '1', '0', '0', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('10', '邮箱', null, 'email', '1', '1', '0', '0', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('11', '生日', null, 'birthday', '1', '1', '0', '0', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('12', '城市', null, 'city', '1', '1', '0', '0', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('13', '地址', null, 'address', '1', '1', '0', '0', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('14', '学历', null, 'degree', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('15', '时间', null, 'time', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('16', '分割线', null, 'cutLine', '2', '1', '0', '0', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('17', '分页符', null, 'cutPage', '2', '1', '0', '0', null, null, '0', '0');
INSERT INTO `qss_ques_type` VALUES ('18', '段落说明', null, 'text', '2', '1', '0', '0', null, null, '0', '0');

-- ----------------------------
-- Table structure for qss_templet
-- ----------------------------
DROP TABLE IF EXISTS `qss_templet`;
CREATE TABLE `qss_templet` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '模版类型 0:其他,1:心理,2:生活,3:情感,4:科技,5:企业,6:产品,7:教育',
  `owner_type` int(10) NOT NULL DEFAULT '0' COMMENT '模版归属 0:用户级,1:平台级,',
  `owner_id` int(10) NOT NULL COMMENT '管理员ID/用户ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '模版状态 0:正常，1:关闭',
  `use_times` int(10) NOT NULL DEFAULT '0' COMMENT '被使用的次数',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问卷模版表';

-- ----------------------------
-- Records of qss_templet
-- ----------------------------

-- ----------------------------
-- Table structure for qss_user
-- ----------------------------
DROP TABLE IF EXISTS `qss_user`;
CREATE TABLE `qss_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `user_name` varchar(100) NOT NULL COMMENT '用户名',
  `user_pass` varchar(100) NOT NULL COMMENT '密码',
  `salt` varchar(16) NOT NULL COMMENT '盐值',
  `user_phone` varchar(30) DEFAULT NULL COMMENT '手机号',
  `user_email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 0:男,1:女',
  `age` tinyint(1) NOT NULL DEFAULT '1' COMMENT '年龄',
  `birthday` int(10) NOT NULL DEFAULT '0' COMMENT '出生年月日',
  `province` int(10) NOT NULL DEFAULT '0' COMMENT '省份ID',
  `city` int(10) NOT NULL DEFAULT '0' COMMENT '城市ID',
  `config` text COMMENT '配置(界面配置，允许的题型，允许的模版，等等)',
  `info` text COMMENT '其他信息:身高，星座，体重，等等',
  `vip_level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员级别，0:非会员,1:最低',
  `login_ip` varchar(30) DEFAULT NULL COMMENT '登录IP',
  `login_time` int(10) DEFAULT '0' COMMENT '最后登陆时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_phone` (`user_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of qss_user
-- ----------------------------
INSERT INTO `qss_user` VALUES ('1', 'codiy', '34cf37ddd7bc3e88701f271c66aa391c', '185006', '18650346179', 'mail@codiy.net', '0', '22', '-28800', '1', '12', null, '', '0', '127.0.0.1', '1432644697', '1');
INSERT INTO `qss_user` VALUES ('2', '小菜', 'cbf132c070ca799344e8a927c8c2a170', 'CARqTA', '18805021138', '3485735@qq.com', '1', '1', '-28800', '0', '0', null, '', '0', null, '1428544911', '1428544911');
INSERT INTO `qss_user` VALUES ('5', 'Moab', '1bcb80c0a8707bd1dc5b3777ff0cafdf', 'YJ4jv9', '15555555777', '594098897@qq.com', '0', '1', '-28800', '0', '0', null, '', '0', null, '1428545276', '1428545276');
INSERT INTO `qss_user` VALUES ('6', '蕾丝', 'b056607a9b9f9aea554155e194a5029e', 'UfCC87', '18650346178', '594094388@qq.com', '0', '1', '0', '0', '0', null, null, '0', null, '1428545566', '1428545566');
INSERT INTO `qss_user` VALUES ('10', '飘渺式', '7fee171fb686be162f2454aeb3f64068', 'EWCrdc', '12343465667', '594094396@qq.com', '0', '1', '-28800', '0', '0', null, '', '0', '127.0.0.1', '1428545997', '1428545997');
INSERT INTO `qss_user` VALUES ('11', 'boat', 'eb3401e2f15d455feb9ed61849d97ce5', 'EnghxU', '18650346175', null, '0', '1', '0', '0', '0', null, null, '0', '127.0.0.1', '1428546230', '1428546230');
INSERT INTO `qss_user` VALUES ('12', '米兰', 'd6548d8f71d50733a907430caf556114', 'J4GKft', '18650346174', 'mail@piee.net', '0', '1', '0', '0', '0', null, null, '0', '127.0.0.1', '1428653738', '1428653738');
INSERT INTO `qss_user` VALUES ('13', '魔力时代', 'edaf4bcad0a469a9686d2bc09268b975', 'TLdQRy', '18805021137', 'test@piee.net', '0', '1', '0', '0', '0', null, null, '0', '127.0.0.1', '1428653787', '1428653787');
INSERT INTO `qss_user` VALUES ('14', 'otion2015', '06f81d8632828889b6253658acf46665', 'CaWaN4', '18805021081', 'otion@piee.net', '0', '1', '0', '0', '0', null, null, '0', '127.0.0.1', '1428653823', '1428653823');
INSERT INTO `qss_user` VALUES ('15', '淡淡的心跳', 'eb44ad585bf7f69b9744b102ca8df124', 'CZOnSq', '18805021080', 'mask@codiy.net', '0', '1', '0', '0', '0', null, null, '0', '127.0.0.1', '1428653904', '1428653904');
INSERT INTO `qss_user` VALUES ('16', '秋天秋天阿', 'b32f78d41f2741bbcc4d2d238c88769e', 'BrGHGf', '18805021082', 'lbb@codiy.net', '0', '1', '0', '0', '0', null, null, '0', '127.0.0.1', '1428654002', '1428654002');
INSERT INTO `qss_user` VALUES ('17', '飞翔丶基路伯', '695c753122135c789213ac058dcbb404', 'SmkP7N', '18805021083', 'ceo@codiy.net', '0', '1', '0', '0', '0', null, null, '0', '127.0.0.1', '1428654026', '1428654026');

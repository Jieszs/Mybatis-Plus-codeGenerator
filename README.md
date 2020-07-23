2020-7-23 实现功能：
1.生成CRUD的controller层 √
2.分页查询列表 √
3.查询树形结构列表 √
4.字段唯一 √
5.全局异常处理 √

备注：
1.逻辑删除统一用字段state表示
2.查询树形结构列表父节点id必须用parentId且 0表示根节点

参考表：
CREATE TABLE `user_info` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `age` int NOT NULL DEFAULT '-1' COMMENT '年龄',
  `depart_name` varchar(50) NOT NULL DEFAULT '' COMMENT '部门名称',
  `insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(0删除1正常)',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息';

CREATE TABLE `tag_info` (
  `tagId` int NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tagName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `parentId` int NOT NULL COMMENT '父节点id',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1正常0删除)',
  `insertTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`tagId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='标签';

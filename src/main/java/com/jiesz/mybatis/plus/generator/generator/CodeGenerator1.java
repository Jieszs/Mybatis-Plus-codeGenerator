package com.jiesz.mybatis.plus.generator.generator;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import org.springframework.util.StringUtils;

import java.util.*;

public class CodeGenerator1 {
    /**
     * 请输入作者名称、表名、实体名称、模块名称
     */
    private static final String author = "Jiesz";
    private static final String tableName = "DRILL_RELATED_PARTY";
    private static final String entityName = "RelatedParty";
    private static final String moduleName = "drill";
    /**
     * 请输入数据库连接、用户、密码
     */
    private static final String url = "jdbc:oracle:thin:@//localhost:1521/orcl";
    private static final String username = "C##root";
    private static final String password = "123456";
    private static final Boolean enablePage = true;
    private static final Boolean enableTree = false;
    //保存和更新忽略字段
    private static final List<String> saveAndUpdateIgnoreFields = Arrays.asList("insertTime", "updateTime", "state");
    //查询忽略字段
    private static final List<String> selectIgnoreFields = Arrays.asList("insertTime", "updateTime", "state");
    private static final IdType idType = IdType.INPUT;
    //逻辑删除字段
    private static final String logicDeleteFieldName = "STATE";
    //不允許重复字段
    private static final String existFieldName = "relatedPartyName";
    private static final String parentPackageName = "com.centerm.hbmp";
    private static final String ignoreTablePrefix = null;
    private static final String versionFieldName = null;
    private static final String projectPath = System.getProperty("user.dir")+"/src/hbmp";


    public static void main(String[] args) {
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();
        //全局配置
        GlobalConfig gc = getGlobalConfig();
        mpg.setGlobalConfig(gc);
        //数据源配置
        DataSourceConfig dsc = getDataSourceConfig();
        mpg.setDataSource(dsc);
        //包名配置
        PackageConfig pc = getPackageConfig();
        mpg.setPackageInfo(pc);
        //模板配置
        TemplateConfig templateConfig = getTemplateConfig();
        mpg.setTemplate(templateConfig);
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        //策略配置
        StrategyConfig strategy = getStrategyConfig();
        mpg.setStrategy(strategy);
        //自定义注入信息配置
        Map<String, Object> map = new HashMap<>();
        map.put("parentPackageName", parentPackageName);
        map.put("urlName", entityName.toLowerCase() + "s");
        map.put("enablePage", enablePage);
        map.put("enableTree", enableTree);
        map.put("moduleName", moduleName);
        map.put("saveAndUpdateIgnoreFields", saveAndUpdateIgnoreFields);
        map.put("selectIgnoreFields", selectIgnoreFields);
        map.put("existFieldName", existFieldName);
        InjectionConfig cfg = getInjectionConfig(map);
        // 自定义输出文件配置
        List<FileOutConfig> focList = new ArrayList<>();
        setFileOutConfig(focList);
        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);
        //生成
        mpg.execute();
    }

    private static void setFileOutConfig(List<FileOutConfig> focList) {
        String mapperTemplatePath = "/templates/mapper.xml.ftl";
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(mapperTemplatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return projectPath + "/dao/src/main/resources/mapper/" + moduleName + "/" + entityName + "Mapper" + StringPool.DOT_XML;
            }
        });
        String dtoTemplatePath = "/templates/dto.java.ftl";
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(dtoTemplatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return projectPath + "/entity/src/main/java/" + parentPackageName.replace(".", "/") + "/dto/" + moduleName + "/" + entityName + "Dto" + StringPool.DOT_JAVA;
            }
        });
        String apiTemplatePath = "/templates/controller.java.ftl";
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(apiTemplatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return projectPath + "/api/src/main/java/" + parentPackageName.replace(".", "/") + "/controller/" + moduleName + "/" + entityName + "Controller" + StringPool.DOT_JAVA;
            }
        });
        String daoTemplatePath = "/templates/mapper.java.ftl";
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(daoTemplatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return projectPath + "/dao/src/main/java/" + parentPackageName.replace(".", "/") + "/mapper/" + moduleName + "/" + entityName + "Mapper" + StringPool.DOT_JAVA;
            }
        });
        String poTemplatePath = "/templates/entity.java.ftl";
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(poTemplatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return projectPath + "/entity/src/main/java/" + parentPackageName.replace(".", "/") + "/po/" + moduleName + "/" + entityName + "Po" + StringPool.DOT_JAVA;
            }
        });
        String serviceTemplatePath = "/templates/service.java.ftl";
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(serviceTemplatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return projectPath + "/service/src/main/java/" + parentPackageName.replace(".", "/") + "/service/" + moduleName + "/I" + entityName + "Service" + StringPool.DOT_JAVA;
            }
        });
        String serviceImplTemplatePath = "/templates/serviceImpl.java.ftl";
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(serviceImplTemplatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return projectPath + "/service/src/main/java/" + parentPackageName.replace(".", "/") + "/service/" + moduleName + "/impl/" + entityName + "ServiceImpl" + StringPool.DOT_JAVA;
            }
        });
    }

    /**
     * 自定义配置
     *
     * @return
     */
    private static InjectionConfig getInjectionConfig(Map<String, Object> map) {
        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                this.setMap(map);
            }
        };
        return cfg;
    }

    /**
     * 配置模板
     *
     * @return
     */
    private static TemplateConfig getTemplateConfig() {
        // 配置模板
        TemplateConfig templateConfig = new TemplateConfig();
        // 配置自定义输出模板
        //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
        templateConfig.setEntity(null);
        templateConfig.setService(null);
        templateConfig.setServiceImpl(null);
        templateConfig.setController(null);
        templateConfig.setXml(null);
        templateConfig.setMapper(null);
        return templateConfig;
    }

    /**
     * 策略配置
     *
     * @return
     */
    private static StrategyConfig getStrategyConfig() {
        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setEntityLombokModel(true);
        strategy.setChainModel(true);
        strategy.setRestControllerStyle(true);
        strategy.setEntityTableFieldAnnotationEnable(true);
        // 忽视前缀
        if (!StringUtils.isEmpty(ignoreTablePrefix)) {
            strategy.setTablePrefix(ignoreTablePrefix);
        }
        // 逻辑删除
        if (!StringUtils.isEmpty(logicDeleteFieldName)) {
            strategy.setLogicDeleteFieldName(logicDeleteFieldName);
        }
        // 乐观锁
        if (!StringUtils.isEmpty(versionFieldName)) {
            strategy.setVersionFieldName(versionFieldName);
        }
        strategy.setInclude(tableName);
        strategy.setControllerMappingHyphenStyle(true);
        return strategy;
    }

    /**
     * 包配置
     *
     * @return
     */
    private static PackageConfig getPackageConfig() {
        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent(parentPackageName);//主包名
        return pc;
    }

    /**
     * 获取全局配置
     *
     * @return
     */
    private static GlobalConfig getGlobalConfig() {
        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        gc.setAuthor(author);
        gc.setOpen(false);
        // 是否覆盖目录
        gc.setFileOverride(true);
        // 是否Swagger2注解
        gc.setSwagger2(true);
        // 是否开启二级缓存
        gc.setEnableCache(false);
        gc.setBaseResultMap(true);
        gc.setBaseColumnList(true);
        //activeRecord
        gc.setActiveRecord(true);
        //主键策略
        gc.setIdType(idType);
        gc.setEntityName(entityName);
        gc.setControllerName(entityName + "Controller");
        gc.setMapperName(entityName + "Mapper");
        gc.setServiceName("I" + entityName + "Service");
        gc.setServiceImplName(entityName + "ServiceImpl");
        return gc;
    }

    /**
     * 数据源配置
     *
     * @return
     */
    private static DataSourceConfig getDataSourceConfig() {
        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl(url);
        dsc.setDriverName("oracle.jdbc.OracleDriver");
        dsc.setUsername(username);
        dsc.setPassword(password);
        return dsc;
    }
}
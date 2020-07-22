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

import java.security.PublicKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CodeGenerator {
    private static final String tableName = "user_info";
    private static final String entityName = "User";
    private static final String url = "jdbc:mysql://localhost:3306/mptest?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatementshedStatements=true&allowMultiQueries=true";
    private static final String username = "root";
    private static final String password = "123456";
    private static final String parentPackageName = "com.jiesz.mybatis.plus.generator";
    private static final IdType idType = IdType.AUTO;
    private static final String ignoreTablePrefix = null;
    private static final String logicDeleteFieldName = "state";
    private static final String versionFieldName = null;
    private static final String projectPath = System.getProperty("user.dir");
    private static final Boolean enablePage = true;

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
        map.put("entityName", entityName);
        map.put("enablePage", enablePage);
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
        String templatePath = "/templates/mapper.xml.ftl";
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(templatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return projectPath + "/src/main/resources/mapper/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
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
        templateConfig.setEntity("templates/entity.java");
        templateConfig.setService("templates/service.java");
        templateConfig.setServiceImpl("templates/serviceImpl.java");
        templateConfig.setController("templates/controller.java");
        templateConfig.setXml(null);
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
        gc.setOutputDir(projectPath + "/src/main/java");
        gc.setAuthor("Jiesz");
        gc.setOpen(false);
        // 是否覆盖目录
        gc.setFileOverride(true);
        gc.setActiveRecord(true);
        // 是否Swagger2注解
        gc.setSwagger2(true);
        // 是否开启二级缓存
        gc.setEnableCache(false);
        gc.setBaseResultMap(true);
        gc.setBaseColumnList(true);
        //主键策略
        gc.setIdType(idType);
        gc.setEntityName(entityName);
        gc.setControllerName(entityName + "Api");
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
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername(username);
        dsc.setPassword(password);
        return dsc;
    }
}
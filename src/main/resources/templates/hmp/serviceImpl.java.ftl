package ${cfg.parentPackageName}.service.${cfg.moduleName}.impl;

import ${cfg.parentPackageName}.po.${cfg.moduleName}.${entity}Po;
import ${cfg.parentPackageName}.dto.${cfg.moduleName}.${entity}Dto;
import ${cfg.parentPackageName}.mapper.${cfg.moduleName}.${table.mapperName};
import ${cfg.parentPackageName}.service.${cfg.moduleName}.${table.serviceName};
import ${superServiceImplClassPackage};
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
* <p>Title: ${table.serviceImplName}服务实现类</p>
* <p>Description: </p>
* <p>Company: 福建升腾资讯有限公司</p>
*
* @author ${author}
* @version 1.0
* @since ${date}
*/
<#list table.fields as field>
    <#if field.keyFlag>
        <#assign keyPropertyName="${field.propertyName}"/>
        <#assign keyPropertyType="${field.propertyType}"/>
        <#assign keyComment="${field.comment}"/>
    </#if>
</#list>
@Service
<#--@Transactional(rollbackFor = Exception.class)-->
<#if kotlin>
    open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}Po>(), ${table.serviceName} {

    }
<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}Po> implements ${table.serviceName} {

    @Resource
    private ${table.mapperName} ${table.mapperName?uncap_first};
    <#--/**-->
    <#--* 获取列表-->
    <#--*/-->
    <#--@Override-->
    <#--public Page<${entity}Po> getPage(${entity}Dto ${entity?uncap_first}Dto){-->
        <#--Page<${entity}Po> pageDate = ${entity?uncap_first}Dto.assignmentPage();-->
        <#--QueryWrapper<${entity}Po> wrapper = new QueryWrapper<>();-->
        <#--return ${table.mapperName?uncap_first}.selectPage(pageDate, wrapper);-->
    <#--}-->
    /**
    * 获取列表
    */
    public List<${entity}Po> list(${entity}Po ${entity?uncap_first}){
    return ${table.mapperName?uncap_first}.list(${entity?uncap_first});
    }
    /**
    * 获取总数
    */
    public Integer count(${entity}Po ${entity?uncap_first}){
    return ${table.mapperName?uncap_first}.count(${entity?uncap_first});
    }
    <#if cfg.existFieldName??&&cfg.existFieldName!="">
        /**
        *添加时判重
        */
       public boolean exist${cfg.existFieldName?cap_first}(String ${cfg.existFieldName}){
        ${entity}Po condition = ${entity}Po.builder()
                                .${cfg.existFieldName}(${cfg.existFieldName})
                                .build();
            List<${entity}Po> list = list(condition);
            if (!CollectionUtils.isEmpty(list)){
            return true;
            }
            return false;
        }
        /**
        *修改时判重
        */
        public boolean exist${cfg.existFieldName?cap_first}(${keyPropertyType} ${keyPropertyName},String ${cfg.existFieldName}){
        ${entity}Po condition = ${entity}Po.builder()
        .${cfg.existFieldName}(${cfg.existFieldName})
        .build();
        List<${entity}Po> list = list(condition);
        if (!CollectionUtils.isEmpty(list)&&!list.get(0).get${keyPropertyName?cap_first}().equals(${keyPropertyName})){
        return true;
        }
        return false;
        }
    </#if>

    <#if (cfg.enableTree!"") == true>
        /**
        *获取树
        */
        public List<${entity}Po> getTree(${entity}Po ${entity?uncap_first}){
        List<${entity}Po> all = list(${entity?uncap_first});
        if (CollectionUtils.isEmpty(all)) return null;
        List<${entity}Po> tree = new ArrayList<>();
        for (${entity}Po one : all) {
        if (one.getParentId() == 0) {
        setChildren(one, all);
        tree.add(one);
        }
        }
        return tree;
        }

        private void setChildren(${entity} ${entity?uncap_first}, List<${entity}> all) {
        for (${entity}Po one : all) {
        if (one.getParentId().equals(${entity?uncap_first}.getTagId())) {
        setChildren(one, all);
        if (${entity?uncap_first}.getChildren() != null) {
        ${entity?uncap_first}.getChildren().add(one);
        } else {
        List<${entity}Po> list = new ArrayList<>();
        list.add(one);
        ${entity?uncap_first}.setChildren(list);
        }
        }
        }
        }
    </#if>



}
</#if>

package ${cfg.parentPackageName}.service.${cfg.moduleName};

import ${cfg.parentPackageName}.po.${cfg.moduleName}.${entity}Po;
import ${cfg.parentPackageName}.dto.${cfg.moduleName}.${entity}Dto;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.util.List;
import ${superServiceClassPackage};

/**
* <p>Title: ${table.serviceName}服务类</p>
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
<#if kotlin>
interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>

public interface ${table.serviceName} extends ${superServiceClass}<${entity}Po> {
  <#--/**-->
  <#--* 获取列表-->
  <#--*/-->
  <#--Page<${entity}Po> getPage(${entity}Dto ${entity?uncap_first}Dto);-->
    /**
    * 获取列表
    */
    List<${entity}Po> list(${entity}Po ${entity?uncap_first});

        /**
        * 获取总数
        */
        Integer count(${entity}Po ${entity?uncap_first});
 <#if (cfg.enableTree!"") == true>
   /**
   *获取树
   */
   List<${entity}> getTree(${entity} ${entity?uncap_first});
 </#if>
 <#if cfg.existFieldName??&&cfg.existFieldName!="">
  /**
  *添加时判重
  */
  boolean exist${cfg.existFieldName?cap_first}(String ${cfg.existFieldName});
  /**
  *修改时判重
  */
  boolean exist${cfg.existFieldName?cap_first}(${keyPropertyType} ${keyPropertyName},String ${cfg.existFieldName});
 </#if>
}
</#if>

package ${package.Service};

import ${package.Entity}.${entity};
import ${superServiceClassPackage};
import java.util.List;
/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {
 /**
 * 获取列表
 */
 List<${entity}> list(${entity} ${entity?uncap_first});

  /**
  * 获取总数
  */
  Integer count(${entity} ${entity?uncap_first});
 <#if (cfg.enableTree!"") == true>
   /**
   *获取树
   */
   List<${entity}> getTree(${entity} ${entity?uncap_first});
 </#if>
}
</#if>

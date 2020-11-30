package ${cfg.parentPackageName}.mapper.${cfg.moduleName};
import ${cfg.parentPackageName}.po.${cfg.moduleName}.${entity}Po;
import ${superMapperClassPackage};
import java.util.List;

/**
* <p>Title: ${table.comment!} Mapper 接口</p>
* <p>Description: </p>
* <p>Company: 福建升腾资讯有限公司</p>
*
* @author ${author}
* @version 1.0
* @since ${date}
*/
<#if kotlin>
interface ${table.mapperName} : ${superMapperClass}<${entity}Po>
<#else>
public interface ${table.mapperName} extends ${superMapperClass}<${entity}Po> {
        /**
        * 获取列表
        */
        List<${entity}Po> list(${entity}Po ${entity?uncap_first});

         /**
         * 获取总数
          */
            Integer count(${entity}Po ${entity?uncap_first});
}
</#if>

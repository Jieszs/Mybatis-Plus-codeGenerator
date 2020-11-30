package ${cfg.parentPackageName}.dto.${cfg.moduleName};

<#if (cfg.enablePage!"") == true>
import ${cfg.parentPackageName}.dto.AbstractPageDto;
</#if>
import java.io.Serializable;
<#if swagger2>
import io.swagger.annotations.ApiModel;
</#if>
<#if entityLombokModel>
import lombok.EqualsAndHashCode;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.experimental.Accessors;
import lombok.Builder;
</#if>

/**
* <p>Title: ${entity}Dto</p>
* <p>Description: </p>
* <p>Company: 福建升腾资讯有限公司</p>
*
* @author ${author}
* @version 1.0
* @since ${date}
*/
<#if entityLombokModel>
@Data
</#if>
<#if swagger2>
@ApiModel(value = "${entity}Dto对象", description = "${table.comment!}")
</#if>
public class ${entity}Dto  extends AbstractPageDto implements Serializable{
<#-- ----------  BEGIN 字段循环遍历  ---------->
<#--<#list table.fields as field>-->
<#--    <#if field.comment!?length gt 0>-->
<#--        <#if swagger2>-->
<#--    @ApiModelProperty(value = "${field.comment}")-->
<#--        </#if>-->
<#--    </#if>-->
<#--    private ${field.propertyType} ${field.propertyName};-->

<#--</#list>-->



}

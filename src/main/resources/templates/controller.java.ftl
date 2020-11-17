package ${package.Controller};

import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.validation.annotation.Validated;
import javax.annotation.Resource;
import ${cfg.parentPackageName}.common.enums.ResultCode;
import ${cfg.parentPackageName}.common.bean.Result;
import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.util.ArrayList;
import java.time.LocalDateTime;
import java.util.List;
<#if restControllerStyle>
    import org.springframework.web.bind.annotation.RestController;
<#else>
    import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
    import ${superControllerClassPackage};
</#if>
<#list table.fields as field>
    <#if field.keyFlag>
        <#assign keyPropertyName="${field.propertyName}"/>
        <#assign keyPropertyType="${field.propertyType}"/>
        <#assign keyComment="${field.comment}"/>
    </#if>
</#list>
/**
* <p>
    * ${table.comment!} 前端控制器
    * </p>
*
* @author ${author}
* @since ${date}
*/
<#if restControllerStyle>
    @RestController
<#else>
    @Controller
</#if>
@RequestMapping("/api")
@Validated
@Api(tags = "${table.comment!}管理")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
    public class ${table.controllerName} extends ${superControllerClass} {
<#else>
    public class ${table.controllerName} {
</#if>
@Resource
private ${table.serviceName} ${table.serviceName?uncap_first};

@ApiOperation("添加${table.comment!}")
@PostMapping("/${cfg.urlName}")
public Result<${entity}> insert(
    <#list table.fields as field>
        <#assign isOk = 1/>
        <#if keyPropertyName == field.propertyName >
            <#assign isOk = 0/>
        </#if>
        <#if cfg.saveAndUpdateIgnoreFields?? && (cfg.saveAndUpdateIgnoreFields?size > 0) >
            <#list cfg.saveAndUpdateIgnoreFields as ignore>
                <#if ignore == field.propertyName >
                    <#assign isOk = 0/>
                    <#break>
                </#if>
            </#list>
        </#if>
        <#if isOk == 1>
                @RequestParam @ApiParam(value = "${field.comment}",required = true) ${field.propertyType} ${field.propertyName},
        </#if>
    </#list>
    )  {
    ${entity} ${entity?uncap_first} = ${entity}.builder()
    <#list table.fields as field>
        <#assign isOk = 1/>
        <#if keyPropertyName == field.propertyName >
            <#assign isOk = 0/>
        </#if>
        <#if cfg.saveAndUpdateIgnoreFields?? && (cfg.saveAndUpdateIgnoreFields?size > 0) >
            <#list cfg.saveAndUpdateIgnoreFields as ignore>
                <#if ignore == field.propertyName >
                    <#assign isOk = 0/>
                    <#break>
                </#if>
            </#list>
        </#if>
        <#if isOk == 1>
            .${field.propertyName}(${field.propertyName})
        </#if>
    </#list>
    .build();
${entity?uncap_first}.insert();
return Result.success(${entity?uncap_first});
}

@ApiOperation("修改${table.comment!}")
@PutMapping("/${cfg.urlName}/{${keyPropertyName}}")
public Result update(
    @PathVariable @ApiParam(value = "${keyComment}", required = true) ${keyPropertyType} ${keyPropertyName},
    <#list table.fields as field>
        <#assign isOk = 1/>
        <#if keyPropertyName == field.propertyName >
            <#assign isOk = 0/>
        </#if>
        <#if cfg.saveAndUpdateIgnoreFields?? && (cfg.saveAndUpdateIgnoreFields?size > 0) >
            <#list cfg.saveAndUpdateIgnoreFields as ignore>
                <#if ignore == field.propertyName >
                    <#assign isOk = 0/>
                    <#break>
                </#if>
            </#list>
        </#if>
        <#if isOk == 1>
            @RequestParam(required = false) @ApiParam(value = "${field.comment}") ${field.propertyType} ${field.propertyName},
        </#if>
    </#list>
    )  {
    ${entity} ${entity?uncap_first} = ${entity}.builder()
    <#list table.fields as field>
        <#assign isOk = 1/>
        <#if cfg.saveAndUpdateIgnoreFields?? && (cfg.saveAndUpdateIgnoreFields?size > 0) >
            <#list cfg.saveAndUpdateIgnoreFields as ignore>
                <#if ignore == field.propertyName >
                    <#assign isOk = 0/>
                    <#break>
                </#if>
            </#list>
        </#if>
        <#if isOk == 1>
            .${field.propertyName}(${field.propertyName})
        </#if>
    </#list>
    .build();
    if (null == ${entity?uncap_first}.selectById()) {
    return Result.fail(ResultCode.PARAM_NOT_COMPLETE_ERROR);
    }
    ${entity?uncap_first}.updateById();
    return Result.success("修改成功");
    }

    @ApiOperation("获取${table.comment!}列表")
    @GetMapping("/${cfg.urlName}")
    <#if (cfg.enablePage!"") == true>
    public Result<Page<${entity}>> list(
        @RequestParam(defaultValue = "0") @ApiParam(value = "偏移量") Integer offset,
        @RequestParam(defaultValue = "10") @ApiParam(value = "限制") Integer limit,
    <#else>
    public Result<List<${entity}>> list(
    </#if>
    <#list table.fields as field>
        <#assign isOk = 1/>
        <#if keyPropertyName == field.propertyName >
            <#assign isOk = 0/>
        </#if>
        <#if cfg.selectIgnoreFields?? && (cfg.selectIgnoreFields?size > 0) >
            <#list cfg.selectIgnoreFields as ignore>
                <#if ignore == field.propertyName >
                    <#assign isOk = 0/>
                    <#break>
                </#if>
            </#list>
        </#if>
        <#if isOk == 1>
                @RequestParam(required = false) @ApiParam(value = "${field.comment}") ${field.propertyType} ${field.propertyName},
        </#if>
    </#list>
    ) {
    ${entity} condition = ${entity}.builder()
    <#list table.fields as field>
        <#assign isOk = 1/>
        <#if keyPropertyName == field.propertyName >
            <#assign isOk = 0/>
        </#if>
        <#if cfg.selectIgnoreFields?? && (cfg.selectIgnoreFields?size > 0) >
            <#list cfg.selectIgnoreFields as ignore>
                <#if ignore == field.propertyName >
                    <#assign isOk = 0/>
                    <#break>
                </#if>
            </#list>
        </#if>
        <#if isOk == 1>
            .${field.propertyName}(${field.propertyName})
        </#if>
    </#list>
    .build();
    <#if (cfg.enablePage!"") == true>
        Page<${entity}> result =new Page<>();
        result.setCurrent(offset);
        result.setSize(limit);
        QueryWrapper<${entity}> wrapper = new QueryWrapper<>();
        condition.selectPage(result, wrapper);
     return Result.success(result);
        <#else>
     List<${entity}> list = ${table.serviceName?uncap_first}.list(condition);
     return Result.success(list);
    </#if>

    }
    <#if (cfg.enableTree!"") == true>
        @ApiOperation("获取${table.comment!}树")
        @GetMapping("/${cfg.urlName}/tree")
        public Result
        <List<${entity}>> getTree(
        <#list table.fields as field>
            <#assign isOk = 1/>
            <#if keyPropertyName == field.propertyName >
                <#assign isOk = 0/>
            </#if>
            <#if cfg.selectIgnoreFields?? && (cfg.selectIgnoreFields?size > 0) >
                <#list cfg.selectIgnoreFields as ignore>
                    <#if ignore == field.propertyName >
                        <#assign isOk = 0/>
                        <#break>
                    </#if>
                </#list>
            </#if>
            <#if isOk == 1>
                    @RequestParam(required = false) @ApiParam(value = "${field.comment}") ${field.propertyType} ${field.propertyName},
            </#if>
        </#list>
        )  {
        ${entity} condition = ${entity}.builder()
        <#list table.fields as field>
            <#assign isOk = 1/>
            <#if keyPropertyName == field.propertyName >
                <#assign isOk = 0/>
            </#if>
            <#if cfg.selectIgnoreFields?? && (cfg.selectIgnoreFields?size > 0) >
                <#list cfg.selectIgnoreFields as ignore>
                    <#if ignore == field.propertyName >
                        <#assign isOk = 0/>
                        <#break>
                    </#if>
                </#list>
            </#if>
            <#if isOk == 1>
                .${field.propertyName}(${field.propertyName})
            </#if>
        </#list>
        .build();
        List<${entity}> tree = ${table.serviceName?uncap_first}.getTree(condition);
        return Result.success(tree);
        }
    </#if>
    @ApiOperation("获取${table.comment!}详情")
    @GetMapping("/${cfg.urlName}/{${keyPropertyName}}")
    public Result<${entity}> get(
    @PathVariable @ApiParam(value = "${keyComment}", required = true) ${keyPropertyType} ${keyPropertyName}
    ) {
    ${entity} condition = ${entity}.builder().${keyPropertyName}(${keyPropertyName}).build();
    ${entity} result = condition.selectById();
    if (result == null) {
    return Result.fail(ResultCode.PARAM_NOT_COMPLETE_ERROR);
    }
    return Result.success(result);
    }

    @ApiOperation("删除${table.comment!}")
    @DeleteMapping("/${cfg.urlName}/{${keyPropertyName}}")
    public Result delete(
    @PathVariable @ApiParam(value = "${keyComment}", required = true) ${keyPropertyType} ${keyPropertyName}
    )  {
    ${entity} condition = ${entity}.builder().${keyPropertyName}(${keyPropertyName}).build();
    if (condition.selectById() == null) {
        return Result.fail(ResultCode.PARAM_NOT_COMPLETE_ERROR);
        }
    condition.deleteById();
    return Result.success("删除成功");
    }
    }
    </#if>

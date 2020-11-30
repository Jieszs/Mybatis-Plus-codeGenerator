package ${cfg.parentPackageName}.controller.${cfg.moduleName};

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.Api;
import java.util.List;
import java.util.ArrayList;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.validation.annotation.Validated;
import ${cfg.parentPackageName}.common.enums.ResultCode;
import javax.annotation.Resource;
<#--import ${cfg.parentPackageName}.common.enums.ResultCode;-->
import ${cfg.parentPackageName}.common.bean.Result;
import ${cfg.parentPackageName}.po.${cfg.moduleName}.${entity}Po;
import ${cfg.parentPackageName}.dto.${cfg.moduleName}.${entity}Dto;
import ${cfg.parentPackageName}.service.${cfg.moduleName}.${table.serviceName};
<#--import com.baomidou.mybatisplus.extension.plugins.pagination.Page;-->
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
* <p>Title: ${table.controllerName}</p>
* <p>Description: 前端控制器</p>
* <p>Company: 福建升腾资讯有限公司</p>
*
* @author ${author}
* @version 1.0
* @since ${date}
*/
<#if restControllerStyle>
@RestController
<#else>
    @Controller
</#if>
@RequestMapping("/api/${cfg.moduleName}")
@Validated
@Api(tags = "${table.comment!}前端接口")
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

    <#--@ApiOperation("获取分页列表${table.comment!}")-->
    <#--@PostMapping("/${cfg.urlName}")-->
    <#--public Result<Page<${entity}Po>> getPageList(@RequestBody @Validated ${entity}Dto ${entity?uncap_first}Dto) {-->
        <#--Page<${entity}Po> ${entity?uncap_first}Page = ${table.serviceName?uncap_first}.getPage(${entity?uncap_first}Dto);-->
        <#--return Result.success(${entity?uncap_first}Page);-->
    <#--}-->

        @ApiOperation("添加${table.comment!}")
        @PostMapping("/add${cfg.urlName}")
        public Result<${entity}Po> insert(
        @RequestBody @Validated ${entity}Po ${entity?uncap_first}
        ) {
          ${entity?uncap_first}.insert();
        return Result.success(${entity?uncap_first});
        }

        @ApiOperation("修改${table.comment!}")
        @PutMapping("/update${cfg.urlName}/{${keyPropertyName}}")
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
                @RequestParam(required = false) @ApiParam(value = "${field.comment}") ${field.propertyType} ${field.propertyName}<#if field_has_next>,</#if>
            </#if>
        </#list>
        )  {
        ${entity}Po ${entity?uncap_first} = ${entity}Po.builder()
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
        return Result.fail(ResultCode.DATA_NOT_FOUND);
        }
        ${entity?uncap_first}.updateById();
        return Result.success();
        }

    @ApiOperation("获取${table.comment!}列表")
    @GetMapping("/${cfg.urlName}")
    <#if (cfg.enablePage!"") == true>
        public Result<Page<${entity}Po>> list(
        @RequestParam(defaultValue = "0") @ApiParam(value = "偏移量") Integer offset,
        @RequestParam(defaultValue = "10") @ApiParam(value = "限制") Integer limit,
    <#else>
        public Result<List<${entity}Po>> list(
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
            @RequestParam(required = false) @ApiParam(value = "${field.comment}") ${field.propertyType} ${field.propertyName}<#if field_has_next>,</#if>
        </#if>
    </#list>
    ) {
    ${entity}Po condition = ${entity}Po.builder()
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
    Integer total = ${table.serviceName?uncap_first}.count(condition);
    List<${entity}Po> list = new ArrayList<>();
    if (total > 0) {
    <#if (cfg.enablePage!"") == true>
        condition.setOffset(offset);
        condition.setLimit(limit);
    </#if>
    list = ${table.serviceName?uncap_first}.list(condition);
    }
    <#if (cfg.enablePage!"") == true>
        Page<${entity}Po> result =new Page<>();
        result.setTotal(total);
        result.setRecords(list);
        result.setCurrent(offset);
        result.setSize(limit);
        return Result.success(result);
    <#else >
        return Result.success(list);
    </#if>

    }
    <#if (cfg.enableTree!"") == true>
        @ApiOperation("获取${table.comment!}树")
        @GetMapping("/${cfg.urlName}/tree")
        public Result
        <List<${entity}Po>> getTree(
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
        ${entity}Po condition = ${entity}Po.builder()
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
        List<${entity}Po> tree = ${table.serviceName?uncap_first}.getTree(condition);
        return Result.success(tree);
        }
    </#if>
    @ApiOperation("获取${table.comment!}详情")
    @GetMapping("/${cfg.urlName}/{${keyPropertyName}}")
    public Result<${entity}Po> get(
    @PathVariable @ApiParam(value = "${keyComment}", required = true) ${keyPropertyType} ${keyPropertyName}
    ) {
    ${entity}Po condition = ${entity}Po.builder().${keyPropertyName}(${keyPropertyName}).build();
    ${entity}Po result = condition.selectById();
    if (result == null) {
    return Result.fail(ResultCode.DATA_NOT_FOUND);
    }
    return Result.success(result);
    }

    @ApiOperation("删除${table.comment!}")
    @DeleteMapping("/${cfg.urlName}/{${keyPropertyName}}")
    public Result delete(
    @PathVariable @ApiParam(value = "${keyComment}", required = true) ${keyPropertyType} ${keyPropertyName}
    ) throws Exception {
    ${entity}Po condition = ${entity}Po.builder().${keyPropertyName}(${keyPropertyName}).build();
    if (condition.selectById() == null) {
        return Result.fail(ResultCode.DATA_NOT_FOUND);
        }
    condition.deleteById();
    return Result.success();
    }
}
    </#if>

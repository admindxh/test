<#--自定义组件
type："1":"字符串文本","2":"整型文本","3":"浮点型文本","4":"文本区","5":"日期","6":"下拉列表","7":"复选框","8":"单选框"
name
label
help
value
size
rows
cols
colspan
width
class
-->
<#macro selfDefineRegisterWidget
	type="1" name="" label="" value="" help="" size="" rows="" cols="" list=""
	colspan="" width="100" class="form-control" helpPosition="2" required=""
	>
	<#if required>
      	<#assign vld="{required:true}"/>
    </#if>
<#if type=="1" || type=="2" || type=="3">
	<#if type=="1"><#if required><#assign vld="{required:true,maxlength:255}"/><#else><#assign vld="{maxlength:255}"/></#if>
			<#elseif type=="2"><#if required><#assign vld="{required:true,digits:true,maxlength:20}"/><#else><#assign vld="{digits:true,maxlength:20}"/></#if>
			<#elseif type=="3"><#if required><#assign vld="{required:true,number:true,maxlength:20}"/><#else><#assign vld="{number:true,maxlength:20}"/></#if>
	</#if>
	<@p.text colspan=colspan width=width class=class label=label  name=name value=value size=size help=help helpPosition=helpPosition vld=vld/>
<#elseif type=="4">
<@p.textarea colspan=colspan width=width class=class label=label  name=name value=value help=help cols=cols?string rows=rows?string helpPosition=helpPosition maxlength="255"/>
<#elseif type=="5">
<@p.text colspan=colspan width=width class=class label=label  name=name value=value class="form-control form-control-inline input-medium date-picker radio-inline" dateformat="yyyy-mm-dd" size=size?string help=help helpPosition=helpPosition/>
<#elseif type=="6">
<@p.select colspan=colspan width=width class=class label=label  name=name value=value help=help list=list!?split(",") helpPosition=helpPosition/>
<#elseif type=="7">
<@p.checkboxlist colspan=colspan width=width class=class label=label  name=name valueList=value!?split(",") list=list!?split(",") help=help helpPosition=helpPosition/>
<#elseif type=="8">
<@p.radio colspan=colspan width=width class=class label=label  name=name value=value list=list!?split(",") help=help helpPosition=helpPosition/>
<#else>
not support type: "${type}"
</#if>
</#macro>

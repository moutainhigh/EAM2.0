<%@ page import="org.activiti.engine.form.FormType" %>
<%@ page import="org.activiti.engine.form.FormProperty" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/eamsys/eamTaglib.jsp"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>标准工单审批</title>
	<style type="text/css">
		#pinfo th {background: #f7f7f9;}
		#flowstatus tr {
			border: 1px solid rgba(34, 34, 34, 0.17);
		}
		#flowstatus td,#flowstatus th{
			width: 1%;
			height: 40px;
		}
		#flowstatus .blue{
			background-color: rgba(21, 199, 189, 0.19);
		}
	</style>

	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>

	<script type="text/javascript">
        var executionId = '${task.executionId}';
        $(function () {

            //完整的渲染方法
            var data='${activityList}';

            data=JSON.parse(data);
            console.log(data);
            function showData(data) {
                //debugger;
                var dom = '';
                $.each(data,function(index,e){
                    dom += '<tr class="blue"><td>'+ (index+1) +'</td><td>' + e.node +
                        '</td><td>操作者总计:' + e.operatorNum +
                        '</td><td>已提交:' + e.submit +
                        '</td><td></td><td></td></tr>' +
                        '<tr class="operator"><td></td><td>操作人</td><td>操作状态</td><td>接收时间</td><td>操作时间</td><td>操作损耗</td></tr>';
                    $.each(e.detail,function(index,i){
                        var a = "<tr><td></td><td>" + i.operator +
                            "</td><td>" + i.status +
                            "</td><td>" + i.accepttime +
                            "</td><td>" + i.submittime +
                            "</td><td>" + i.duration + "</td></tr>";
                        dom += a;
                    })
                })
                $('table').append(dom);
            }
            showData(data);

            //表单提交
            $("#btnSubmit").on('click', function() {

                $("#inputForm").on("submit", function () {

                    $(this).ajaxSubmit({
                        type: 'post',
                        success: function (data) {
                            if (data == "success") {
                                layer.msg('提交成功！',{icon:1,time: 1000}, function (index) {
                                    parent.$("#mytable").DataTable().ajax.reload();
                                    parent.layer.closeAll();
                                });
                            } else if (data == "noauth") {
                                layer.msg("无审批权限，请先签收任务！",{time: 1000,icon:7});
                            } else {
                                layer.msg("提交失败！",{time: 1000,icon:2});
                            }
                        }
                    });
                    return false;
                });
            });
            $.fn.outerHTML = function () {

                // IE, Chrome & Safari will comply with the non-standard outerHTML, all others (FF) will have a fall-back for cloning
                return (!this.length) ? this : (this[0].outerHTML ||
                (function (el) {
                    var div = document.createElement('div');
                    div.appendChild(el.cloneNode(true));
                    var contents = div.innerHTML;
                    div = null;
                    return contents;
                })(this[0]));

            };

            if ($('#processDiagram').length == 1) {
                showActivities();
            }
            function showActivities() {
                $.getJSON(ctx + '/eam/act/process/trace/data/' + executionId, function (infos) {
                    var positionHtml = "";

                    var diagramPositon = $('#processDiagram').position();
                    var varsArray = new Array();
                    $.each(infos, function (i, v) {
                        var $positionDiv = $('<div/>', {
                            'class': 'activity-attr'
                        }).css({
                            position: 'absolute',
                            left: (v.x + 2),
                            top: (v.y + 35),
                            width: (v.width - 2),
                            height: (v.height - 2),
                            backgroundColor: 'black',
                            opacity: 0
                        });

                        // 节点边框
                        var $border = $('<div/>', {
                            'class': 'activity-attr-border'
                        }).css({
                            position: 'absolute',
                            left: (v.x + 2),
                            top: (v.y + 35),
                            width: (v.width - 4),
                            height: (v.height - 3)
                        });

                        if (v.currentActiviti) {
                            $border.css({
                                border: '3px solid red'
                            }).addClass('ui-corner-all-12');
                        }
                        positionHtml += $positionDiv.outerHTML() + $border.outerHTML();
                        varsArray[varsArray.length] = v.vars;
                    });

                    $(positionHtml).appendTo('#flowchart').find('.activity-attr-border');

                    // 鼠标移动到活动上提示
                    $('.activity-attr-border').each(function (i, v) {
                        var tipContent = "<table class='table table-bordered'>";
                        $.each(varsArray[i], function(varKey, varValue) {
                            if (varValue) {
                                tipContent += "<tr><td>" + varKey + "</td><td>" + varValue + "</td></tr>";
                            }
                        });
                        tipContent += "</table>";
                        $(this).data('vars', varsArray[i]).data('toggle', 'tooltip').data('placement', 'bottom').data('title', '活动属性').attr('title', tipContent);
                    }).tooltip();
                });
            }

            var formFieldnew=[{display:"标准工单编码",name:"order_code",type:"text"},{display:"标准工单名称",name:"order_content",type:"text"},
                { display:"紧急程度",name:"order_priority",comboboxName:"order_priorityBox","type": "select"},
				{display:"标准工作",name:"order_work",comboboxName:"order_workBox",
                    options : {
                        isMultiSelect : true,
                        valueField : 'id',
                        treeLeafOnly : false,
                        tree : {
                            url :'${ctx}/opestandard/standardOrder/getOrderwork',
                            checkbox : true,
                            parentIcon: null,
                            childIcon: null,
                            nodeWidth:200,
                            ajaxType : 'post',
                            textFieldName:'operationwork_content',
                            autoCheckboxEven:false,//复选框联动
                            onClick : function (note) {
                            }
                        }
                    }
				},{display:"专业",name:"order_major",type:"text"},{display:"额定总工时",name:"order_totalhours",type:"text"},{display:"故障描述",name:"order_desc",type:"text"},
				{display:"备注",name:"order_remark",type:"text"},{display:"状态",name:"order_status",type:"select",comboboxName: "order_statusBox"}
                ]

            $.each(formFieldnew, function (index, val) {
                val.readonly = true;
            })
            var formConfig = {
                space : 50, labelWidth : 120 , inputWidth : 200,
                validate: true,
                fields: formFieldnew

            };
            $("#serviceForm").ligerForm(formConfig);
            //状态：   有效  1       无效  0
            common.callAjax('post',false,common.interfaceUrl.getDictByDictTypeCode,"json",{"dict_type_code" : "common"},function(data){
                var statusHtml="";
                $.each(data, function (i, item) {
                    statusHtml += "<option value=\"" + item.dict_value + "\">" + item.dict_name + "</option>";
                });
                var order_statusBox= $("#order_statusBox");
                order_statusBox .html(statusHtml).append($("<input></input>").attr("type", "hidden").attr("name", "order_status"));
            });
            common.callAjax('post',false,common.interfaceUrl.getDictByDictTypeCode,"json",{"dict_type_code" : "priority"},function(data){
                var statusHtml="";
                $.each(data, function (i, item) {
                    statusHtml += "<option value=\"" + item.dict_value + "\">" + item.dict_name + "</option>";
                });
                var order_priorityBox= $("#order_priorityBox");
                order_priorityBox .html(statusHtml).append($("<input></input>").attr("type", "hidden").attr("name", "order_priority"));
            });
            //给表单赋值
            $.ajax({
                type: 'POST',
                url: ctx + "/opestandard/standardOrder/getOrderByPIid",
                async: false,
                dataType: 'json',
                data: {pIid: $("#pIid").val()},
                success: function (data) {
                    debugger;
                    var editForm  = liger.get("serviceForm");
                    editForm.setData(data);
                    $('#order_statusBox').val(data.order_status).trigger('change.select2');
                    $('#order_priorityBox').val(data.order_priority).trigger('change.select2');
                }
            })
        });

	</script>
</head>
<body>
<div>
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="#taskContent" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">任务详情</a></li>
		<li role="presentation" ><a href="#flowchart" role="tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">流程图</a></li>
		<li role="presentation" ><a href="#flowstatus" role="tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">流程状态</a></li>
	</ul>
	<div class="tab-content">
		<div id="taskContent" role="tabpanel" class="tab-pane active">
<form  class="form-horizontal" action="" method="post" id="serviceForm">

</form>
<%--action="${ctx }/eam/act/task/complete?taskid=${task.id}"--%>
<form  class="form-horizontal" action="${ctx }/eam/act/task/complete?taskid=${task.id}" method="post" id="inputForm">
	<%--<input type="hidden" value="${task.id}" id="taskid">--%>
	<%--<h4>任务内容</h4>--%>
	<c:if test="${hasFormKey}">
		${taskFormData}
	</c:if>
		<c:if test="${!hasFormKey}">
			<c:forEach items="${taskFormData.formProperties}" var="fp">
				<c:set var="fpo" value="${fp}"/>
				<c:set var="disabled" value="${fp.writable ? '' : 'disabled'}" />
				<c:set var="readonly" value="${fp.writable ? '' : 'readonly'}" />
				<c:set var="required" value="${fp.required ? 'required' : ''}" />
				<%
					// 把需要获取的属性读取并设置到pageContext域
					FormType type = ((FormProperty)pageContext.getAttribute("fpo")).getType();
					String[] keys = {"datePattern", "values"};
					for (String key: keys) {
						pageContext.setAttribute(key, type.getInformation(key));
					}
				%>
				<div class="control-group">
						<%-- 文本或者数字类型 --%>
					<c:if test="${fp.type.name == 'string' || fp.type.name == 'long' || fp.type.name == 'double'}">
						<label class="control-label" for="${fp.id}">${fp.name}:</label>
						<div class="controls">
							<input type="text" id="${fp.id}" name="${fp.id}" data-type="${fp.type.name}" value="${fp.value}" ${readonly} ${required} />
						</div>
					</c:if>

						<%-- 大文本 --%>
					<c:if test="${fp.type.name == 'bigtext'}">
						<label class="control-label" for="${fp.id}">${fp.name}:</label>
						<div class="controls">
							<textarea id="${fp.id}" name="${fp.id}" data-type="${fp.type.name}" ${readonly} ${required}>${fp.value}</textarea>
						</div>
					</c:if>

						<%-- 日期 --%>
					<c:if test="${fp.type.name == 'date'}">
						<label class="control-label" for="${fp.id}">${fp.name}:</label>
						<div class="controls">
							<input type="text" id="${fp.id}" name="${fp.id}" class="datepicker" value="${fp.value}" data-type="${fp.type.name}" data-date-format="${fn:toLowerCase(datePattern)}" ${readonly} ${required}/>
						</div>
					</c:if>

						<%-- 下拉框 --%>
					<c:if test="${fp.type.name == 'enum'}">
						<label class="control-label" for="${fp.id}">${fp.name}:</label>
						<div class="controls">
							<select name="${fp.id}" id="${fp.id}" ${disabled} ${required}>
								<c:forEach items="${values}" var="item">
									<option value="${item.key}" <c:if test="${item.value == fp.value}">selected</c:if>>${item.value}</option>
								</c:forEach>
							</select>
						</div>
					</c:if>

						<%-- Javascript --%>
					<c:if test="${fp.type.name == 'javascript'}">
						<script type="text/javascript">${fp.value};</script>
					</c:if>

				</div>
			</c:forEach>
		</c:if>

	<%-- 按钮区域 --%>
	<div class="control-group">
		<div class="controls">

			<input type="hidden" value="${task.id}" id="taskid">
			<input type="hidden" value="${pIid}" id="pIid" name="pIid">
			<%--<c:if test="${not empty task.assignee}">--%>
				<button type="submit" class="btn btn-primary" id="btnSubmit"><i class="icon-ok"></i>完成任务</button>
			<%--</c:if>
			<c:if test="${empty task.assignee}">
				<a class="btn" id="claim"><i class="icon-ok"></i>签收</a>
			</c:if>--%>
		</div>
	</div>
</form>
	</div>
		<div id="flowchart" role="tabpanel" class="tab-pane">
			<img id="processDiagram" src="${ctx }/eam/act/process/read-resource?pdid=${processDefinition.id}&resourceName=${processDefinition.diagramResourceName}" />
		</div>
		<div id="flowstatus" role="tabpanel" class="tab-pane">
			<div>
				<table>
					<tr>
						<th>序号</th>
						<th>节点</th>
						<th>操作情况统计</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>

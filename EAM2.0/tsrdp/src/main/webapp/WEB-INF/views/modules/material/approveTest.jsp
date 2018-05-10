
	<div class="control-group">
		<label class="control-label" for="startDate">申请人：</label>
		<div class="controls">${applyUserId}</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="startDate">开始时间：</label>
		<div class="controls">
			<input type="text" id="startDate" name="startDate" value="startDate" readonly />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="endDate">结束时间：</label>
		<div class="controls">
			<input type="text" id="endDate" name="endDate" value="${endDate}" readonly />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="reason">请假原因：</label>
		<div class="controls">
			<textarea id="reason" name="reason" readonly>${reason}</textarea>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="deptLeaderApproved">审批意见：</label>
		<div class="controls">
			<select name="deptLeaderApproved" id="deptLeaderApproved">
				<option value="true">同意</option>
				<option value="false">拒绝</option>
			</select>
		</div>
	</div>
